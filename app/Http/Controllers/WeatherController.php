<?php

// app/Http/Controllers/WeatherController.php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use App\Models\WeatherData;

use Illuminate\Support\Facades\Cache;

class WeatherController extends Controller
{
    public function processRawWeatherData($city)
    {

        $apiKey = config('app.open_weather_map_api_key');

        $response = Http::get("https://api.openweathermap.org/data/2.5/weather?q={$city}&appid={$apiKey}&units=metric");

        if ($response->failed()) {
            return response()->json(['status' => '0', 'error' => 'Failed to fetch weather data'], 200);
        }

        $weatherData = $response->json();

        //print_r($weatherData);exit;

        return $weatherData;
    }

    public function fetchWeatherData(Request $request)
    {

        $validated = $request->validate([
            'city' => 'required',
        ], [
            'city.required' => 'City name is required',
        ]);

        $city = $request->input('city');

        if (Cache::has('weatherCollection')) {
            $weatherDataCollection = Cache::get('weatherCollection');

            //Checking if the current city is alreay in the list
            foreach ($weatherDataCollection as $weather) {
                if (ucfirst($weather['city']) == ucfirst($city)) {
                    return response()->json(unserialize($weather['response']));
                }
            }
        } else {
            //Checking if the current city is alreay in the list
            $record = WeatherData::where('city', $city)->first();

            if ($record) {
                $weather = $record->toArray();
                return response()->json(unserialize($weather['response']));
            }
        }

        $weatherData = $this->processRawWeatherData($city);

        $insertData = [
            'city' => ucfirst($city),
            'weather' => $weatherData['weather'][0]['main'],
            'description' => $weatherData['weather'][0]['description'],
            'temperature' => round($weatherData['main']['temp']),
            'humidity' => $weatherData['main']['humidity'],
            'pressure' => $weatherData['main']['pressure'],
            'wind_speed' => $weatherData['wind']['speed'],
            'response' => serialize($weatherData)
        ];

        //print_r($insertData);exit;

        //Inserting new location weather in database
        $isSuccess = WeatherData::create($insertData);

        if ($isSuccess) {

            // Clearning cached weather data
            Cache::forget('weatherCollection');

            // Caching weather data
            Cache::put('weatherCollection', WeatherData::all(), 60 * 4);
            return response()->json($weatherData);
        }
        return response()->json(['error' => true]);
    }

    public function syncWeatherData(Request $request)
    {
        $id = $request->input('id');

        if (!empty($id)) {
            $record = WeatherData::find($id);

            if ($record) {
                $weatherData = $this->processRawWeatherData($record->city);

                $updateData = [
                    'city' => $record->city,
                    'weather' => $weatherData['weather'][0]['main'],
                    'description' => $weatherData['weather'][0]['description'],
                    'temperature' => round($weatherData['main']['temp']),
                    'humidity' => $weatherData['main']['humidity'],
                    'pressure' => $weatherData['main']['pressure'],
                    'wind_speed' => $weatherData['wind']['speed'],
                    'response' => serialize($weatherData)
                ];

                $record->update($updateData);
                return response()->json(['status' => '1', 'msg' => "Record is successfully updated!"]);
            } else {
                return response()->json(['status' => '0', 'msg' => "No record found!"]);
            }
        } else {
            return response()->json(['status' => '0', 'msg' => "Something went wrong, please try again"]);
        }
    }

    public function deleteWeatherData(Request $request)
    {
        $id = $request->input('id');

        if (!empty($id)) {
            $record = WeatherData::find($id);

            if ($record) {
                $record->delete();
                return response()->json(['status' => '1', 'msg' => "Record is successfully deleted!"]);
            } else {
                return response()->json(['status' => '0', 'msg' => "No record found!"]);
            }
        } else {
            return response()->json(['status' => '0', 'msg' => "Something went wrong, please try again"]);
        }
    }

    public function handleWeatherCache(Request $request)
    {   
        $cacheType = $request->input('cacheType');

        if($cacheType == "create"){
            Cache::put('weatherCollection', WeatherData::all(), 60 * 4);
            $responseArr = ['status' => '1', 'msg' => "Cache is successfully created!"];
        }else{
            // Clearning cached weather data
            Cache::forget('weatherCollection');
            $responseArr = ['status' => '1', 'msg' => "Cache is successfully cleared!"];
        }

        return response()->json($responseArr);
    }
    
}
