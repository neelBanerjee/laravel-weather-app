<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\WeatherController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/login', [DashboardController::class, 'index'])->name('login');
Route::get('/registration', [DashboardController::class, 'registration'])->name('registration');
Route::post('/validate_registration', [DashboardController::class, 'validate_registration'])->name('auth.validate_registration');
Route::post('/validate_login', [DashboardController::class, 'validate_login'])->name('auth.validate_login');

Route::middleware(['auth'])->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'dashboard'])->name('dashboard');
    Route::get('/logout', [DashboardController::class, 'logout'])->name('logout');

    Route::get('/search-weather', [DashboardController::class, 'searchWeather'])->name('weather.search');
    Route::post('/weather/fetch', [WeatherController::class, 'fetchWeatherData'])->name('weather.fetch');
    Route::post('/weather/sync', [WeatherController::class, 'syncWeatherData'])->name('weather.sync');
    Route::post('/weather/delete', [WeatherController::class, 'deleteWeatherData'])->name('weather.delete');
    Route::post('/weather/handle-cache', [WeatherController::class, 'handleWeatherCache'])->name('weather.cache.handle');
});


