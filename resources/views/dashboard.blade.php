@extends('main')

@section('content')
    <div class="card">
        <div class="card-header">
            <div class="d-flex justify-content-between">
                <span>Dashboard</span>

                <div class="text-right">
                    <button type="button" class="btn btn-primary btn-sm" id="search_weather_data">
                        <i class="fa fa-search"></i> Search Weather Data
                    </button>
                    @if(Cache::has('weatherCollection'))
                        <button type="button" class="btn btn-danger btn-sm handleCache" data-ctype="destroy">
                            <i class="fa fa-cogs"></i> Clear Cache
                        </button>
                    @else    
                        <button type="button" class="btn btn-success btn-sm handleCache" data-ctype="create">
                            <i class="fa fa-cogs"></i> Generate Cache
                        </button>
                    @endif    
                </div>    
            </div>
        </div>
        <div class="card-body">
            <ul>
                <li>You are Logged into the Laravel Weather Measure Application.</li>
                <li>Fetch weather by city name and it will automatically be added into the list.</li>
                <li>You can also view, delete and sync latest weather data for each city on the list.</li>
                <li>Clear or generate cache data for faster response time.</li>
                <li>Indexing is added for city column in the table.</li>
            </ul>    
             
        </div>
    </div>

    <div class="row mt-3">
        <div class="col-md-5">
            <div class="header">
                <div class="search-box">
                    <input type="text" id="serachWeatherInput" placeholder="Enter your location" class="input-box">

                    <button class="fa-solid fa-magnifying-glass" id="searchBtn"></button>
                </div>

                <div class="location-not-found">
                    <h1>Sorry, Location not found!!!</h1>
                    <img src="{{ asset('userAssets') }}/images/404.png" alt="404 Error">
                </div>

                <div class="weather-body" style="display:flex">
                    <div class="loading-overlay">
                        <span class="fa fa-spinner fa-3x fa-spin"></span>
                    </div>
                    <img src="{{ asset('userAssets') }}/images/404.png" alt="Weather Image" class="weather-img">

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
        </div>
        <div class="col-md-7">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex justify-content-between">
                        <span>All Weather Data</span>
                        
                        <div class="text-right">
                            <a href="{{ route('dashboard') }}">
                                <button type="button" class="btn btn-primary btn-sm">
                                    <i class="fa fa-refresh"></i> Refresh Table Data
                                </button>
                            </a>
                        </div>    
                    </div>
                </div>

                <div class="card-body">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">City</th>
                                <th scope="col">Weather</th>
                                <th scope="col">Temperature</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($weathers as $index => $weather)
                                <input type="hidden" id="city_{{ $weather->id }}" value="{{ $weather->city }}">
                                <input type="hidden" id="desc_{{ $weather->id }}" value="{{ ucwords($weather->description) }}">
                                <input type="hidden" id="temp_{{ $weather->id }}" value="{{ $weather->temperature }}">
                                <input type="hidden" id="hmdt_{{ $weather->id }}" value="{{ $weather->humidity }}">
                                <input type="hidden" id="prsr_{{ $weather->id }}" value="{{ $weather->pressure }}">
                                <input type="hidden" id="wndspd_{{ $weather->id }}" value="{{ $weather->wind_speed }}">
                                <tr>
                                    <th scope="row">{{ $index + 1 }}</th>
                                    <td>{{ $weather->city }}</td>
                                    <td>{{ ucwords($weather->description) }}</td>
                                    <td>{{ $weather->temperature }}°C</td>
                                    <td>
                                        <button type="button" class="btn btn-primary btn-sm showWeatherDetails" data-wid="{{ $weather->id }}">
                                            <i class="fa fa-eye"></i> View
                                        </button>
                                        <button type="button" class="btn btn-success btn-sm actionWeatherData"
                                            data-wid="{{ $weather->id }}" data-atype="sync">
                                            <i class="fa fa-refresh"></i> Sync
                                        </button>
                                        <button type="button" class="btn btn-danger btn-sm actionWeatherData"
                                            data-wid="{{ $weather->id }}" data-atype="delete">
                                            <i class="fa fa-trash"></i> Delete
                                        </button>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div class="col-md-12">
                        {{ $weathers->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="weatherDetailsModal" tabindex="-1" role="dialog" aria-labelledby="weatherDetailsModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Weather Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="table-responsive pt-3">
                        <table class="table table-bordered">
                            <tr>
                                <th width="30%">City</th>
                                <td width="2%">:</td>
                                <td id="desc_city">Not Available!</td>
                            </tr>
                            <tr>
                                <th width="30%">Weather</th>
                                <td width="2%">:</td>
                                <td id="desc_weather">Not Available!</td>
                            </tr>
                            <tr>
                                <th width="30%">Temperature</th>
                                <td width="2%">:</td>
                                <td id="desc_temp">Not Available!</td>
                            </tr>
                            <tr>
                                <th width="30%">Humidity</th>
                                <td width="2%">:</td>
                                <td id="desc_hmdt">Not Available!</td>
                            </tr>
                            <tr>
                                <th width="30%">Pressure</th>
                                <td width="2%">:</td>
                                <td id="desc_pressure">Not Available!</td>
                            </tr>
                            <tr>
                                <th width="30%">Wind Speed</th>
                                <td width="2%">:</td>
                                <td id="desc_wind">Not Available!</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
@endsection('content')

@section('script')
    <script>
        const publicUrl = '{{ asset('userAssets') }}';
        const dashboardUrl = '{{ route('dashboard') }}';
        const fetchWeatherUrl = '{{ route('weather.fetch') }}';
        const syncWeatherUrl = '{{ route('weather.sync') }}';
        const deleteWeatherUrl = '{{ route('weather.delete') }}';
        const handleCacheUrl = '{{ route('weather.cache.handle') }}';
        const csrfToken = $('meta[name="csrf-token"]').attr('content');
    </script>
@endsection()
