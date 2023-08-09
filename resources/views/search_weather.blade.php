@extends('main')

@section('css')
    <link rel="stylesheet" href="{{ asset('userAssets') }}/css/style.css">
@endsection()

@section('content')
    <div class="header">
        <div class="search-box">
            <input type="text" placeholder="Enter your location" class="input-box">

            <button class="fa-solid fa-magnifying-glass" id="searchBtn"></button>
        </div>


        <div class="location-not-found">
            <h1>Sorry, Location not found!!!</h1>
            <img src="{{ asset('userAssets') }}/images/404.png" alt="404 Error">
        </div>

        <div class="weather-body d-flex">
            <img src="{{ asset('userAssets') }}/images/cloud.png" alt="Weather Image" class="weather-img">

            <div class="weather-box">
                <p class="temperature">Not Found!</sup></p>
                <p class="description">Not Found!</p>
            </div>

            <div class="weather-details">
                <div class="humidity">
                    <i class="fa-sharp fa-solid fa-droplet"></i>
                    <div class="text">
                        <span id="humidity">Not Found!</span>
                        <p>Humidity</p>
                    </div>
                </div>

                <div class="wind">
                    <i class="fa-solid fa-wind"></i>
                    <div class="text">
                        <span id="wind-speed">Not Found!</span>
                        <p>Wind Speed</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection('content')

@section('script')
    <script>
        const publicUrl = '{{ asset('userAssets') }}';
        const fetchWeatherUrl = '{{ route('weather.fetch') }}';
        const csrfToken = $('meta[name="csrf-token"]').attr('content');
        //console.log(fetchWeatherUrl);
    </script>
    <script src="{{ asset('userAssets') }}/js/script.js"></script>
    <script src="https://kit.fontawesome.com/595a890311.js" crossorigin="anonymous"></script>
@endsection()
