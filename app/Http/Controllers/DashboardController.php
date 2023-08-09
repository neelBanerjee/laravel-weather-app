<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use App\Models\WeatherData;

class DashboardController extends Controller
{
    public function index()
    {
        return view('login');
    }

    public function registration()
    {
        return view('registration');
    }

    public function validate_registration(Request $request)
    {
        $request->validate([
            'name'         =>   'required',
            'email'        =>   'required|email|unique:users',
            'password'     =>   'required|min:6'
        ]);

        $data = $request->all();

        User::create([
            'name'  =>  $data['name'],
            'email' =>  $data['email'],
            'password' => Hash::make($data['password'])
        ]);

        return redirect('login')->with('success', 'Registration Completed, now you can login');
    }

    public function validate_login(Request $request)
    {
        $request->validate([
            'email' =>  'required',
            'password'  =>  'required'
        ]);

        $credentials = $request->only('email', 'password');

        if(Auth::attempt($credentials))
        {
            return redirect()->route('dashboard');
        }

        return redirect()->back()->withErrors(['credentials' => 'Invalid credentials'])->withInput();
    }

    public function dashboard()
    {
        if(Auth::check())
        {
            $weathers = WeatherData::paginate(6);
            return view('dashboard', compact('weathers'));
        }

        return redirect('login')->with('error', 'you are not allowed to access');
    }

    public function searchWeather()
    {
        if(Auth::check())
        {
            return view('search_weather');
        }

        return redirect('login')->with('error', 'you are not allowed to access');
    }

    public function logout()
    {
        Session::flush();

        Auth::logout();

        return Redirect('login');
    }
}
