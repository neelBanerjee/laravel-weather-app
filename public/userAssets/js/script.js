//Initilizing app element from dom 
const inputBox = document.querySelector('.input-box');
const searchBtn = document.getElementById('searchBtn');
const weather_img = document.querySelector('.weather-img');
const temperature = document.querySelector('.temperature');
const description = document.querySelector('.description');
const humidity = document.getElementById('humidity');
const wind_speed = document.getElementById('wind-speed');
const location_not_found = document.querySelector('.location-not-found');
const weather_body = document.querySelector('.weather-body');

//Initilizing Loader 
let overlay = document.getElementsByClassName('loading-overlay')[0];

/**
 * Featch weather data.
 *
 * This function takes city and server url and returns weather data.
 *
 * @param {string} url - The url to fetch weather data from server.
 * @param {string} city - The name of the city.
 * @returns {object} weather data response from server.
 */
async function fetchWeatherData(url, data) {
    
    //Display loader
    overlay.classList.toggle('is-active');

    try {
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json', // Set the content type
                // You might need to set other headers here, like authorization headers
                'X-CSRF-TOKEN': csrfToken
            },
            body: JSON.stringify(data) // Convert the data to JSON format
        });

        if (!response.ok) {
            throw new Error('Network response was not ok');
        }

        const responseData = await response.json();
        return responseData;
    } catch (error) {
        console.error('Error posting data:', error);
        return null;
    } finally{
        overlay.classList.toggle('is-active');
    }
}

/**
 * Render weather data.
 *
 * This function render weather data on dom.
 *
 * @param {string} city - The name of the city.
 * @returns {void} return void.
 */
async function renderWeather(city) {
    const api_key = "aa41112aa37b3bc55c5f2ffcc75d18f1";
    // const url = `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${api_key}`;
    // const weather_data = await fetch(`${url}`).then(response => response.json());

    const dataToSend = {
        city: city,
    };

    const weather_data = await fetchWeatherData(fetchWeatherUrl, dataToSend);

    //console.log(weather_data);

    if (weather_data.cod === `404`) {
        location_not_found.style.display = "flex";
        weather_body.style.display = "none";
        //console.log("error 404");
        return;
    }

    else if (weather_data.status === '0') {
        location_not_found.style.display = "flex";
        weather_body.style.display = "none";
        //console.log("server error");
        return;
    }

    //console.log("run");
    location_not_found.style.display = "none";
    weather_body.style.display = "flex";
    //Call this when you won't pass S.I/Metric method as unit in api query string 
    //temperature.innerHTML = `${Math.round(weather_data.main.temp - 273.15)}°C`;
    temperature.innerHTML = `${Math.round(weather_data.main.temp)}°C`;
    description.innerHTML = `${weather_data.weather[0].description}`;

    humidity.innerHTML = `${weather_data.main.humidity}%`;
    wind_speed.innerHTML = `${weather_data.wind.speed}Km/H`;

    console.log(weather_data.weather[0].main);

    switch (weather_data.weather[0].main) {
        case 'Clouds':
        case 'Haze':    
            weather_img.src = publicUrl + "/images/cloud.png";
            break;
        case 'Clear':
            weather_img.src = publicUrl + "/images/clear.png";
            break;
        case 'Rain':
            weather_img.src = publicUrl + "/images/rain.png";
            break;
        case 'Mist':
            weather_img.src = publicUrl + "/images/mist.png";
            break;
        case 'Snow':
        case 'Thunderstorm':    
            weather_img.src = publicUrl + "/images/snow.png";
            break;
    }

}

//Foucusing on serach input on click function
$("#search_weather_data").on('click', function() {
    $("#serachWeatherInput").focus();
});

//Displaying weather data of a city from weather data table on dashboard
$(".showWeatherDetails").on('click', function() {
    const wId = $(this).data('wid');

    const city = $("#city_"+wId).val();
    const weather = $("#desc_"+wId).val();
    const temperature = $("#temp_"+wId).val();
    const humidity = $("#hmdt_"+wId).val();
    const pressure = $("#prsr_"+wId).val();
    const wind_speed = $("#wndspd_"+wId).val();

    $("#desc_city").text(city);
    $("#desc_weather").text(weather);
    $("#desc_temp").text(temperature+'°C');
    $("#desc_hmdt").text(humidity+'%');
    $("#desc_pressure").text(pressure+'Pa');
    $("#desc_wind").text(wind_speed+'Km/H');

    $("#weatherDetailsModal").modal('show');
});

//Updating or deleting on click function based on action type
$('.actionWeatherData').on('click', function () {
    
    const weatherId = $(this).data('wid');
    const actionType = $(this).data('atype');
    const formData = {id:weatherId};

    if(!weatherId){
        return false;
    }

    if(actionType == "sync"){
        var alertText = "Weather data will be synced with current atmosphere";
        var callAjaxUrl = syncWeatherUrl;
    }else{
        var alertText = "Weather data for this location will be parmanently deleted";  
        var callAjaxUrl = deleteWeatherUrl;  
    }

    //console.log(formData); return false;

    swal({
        title: "Are you sure?",
        text: alertText,
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Yes, Go ahead",
        closeOnConfirm: true
    }, function () {

        $.ajax({
            url: callAjaxUrl,
            method: 'POST',
            data: formData,
            headers: {
                'X-CSRF-TOKEN': csrfToken
            },
            beforeSend: function () {
                overlay.classList.toggle('is-active');
            },
            success: function (data) {
                //console.log(responseData); 

                if (data.status == '1') {
                    //show sweetalert success
                    setTimeout(function () {
                        //Disabling loader
                        overlay.classList.toggle('is-active');
                        //showing success message
                        swal({
                            title: "Success!",
                            text: data.msg,
                            type: "success"
                        }, function () {
                            window.location = dashboardUrl;
                        });
                    }, 1000);

                    return true;
                } else {
                    //Disabling loader
                    //$('.content_div_loader').removeClass('sk-loading');
                    //show sweetalert success
                    swal({
                        title: "Error!",
                        text: data.msg,
                        type: "error"
                    });
                    return false;
                }
            }
        });
    });
});

//Creating or destroying cache on server
$('.handleCache').on('click', function () {
    
    const cacheType = $(this).data('ctype');

    const formData = {cacheType:cacheType};

    if(cacheType == "create"){
        var alertText = "All cache data will be cleared";
    }else{
        var alertText = "All data will be fetched from cache";  
    }

    //console.log(formData); return false;

    swal({
        title: "Are you sure?",
        text: alertText,
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Yes, Go ahead",
        closeOnConfirm: true
    }, function () {

        $.ajax({
            url: handleCacheUrl,
            method: 'POST',
            data: formData,
            headers: {
                'X-CSRF-TOKEN': csrfToken
            },
            beforeSend: function () {
                overlay.classList.toggle('is-active');
            },
            success: function (data) {
                //console.log(responseData); 

                if (data.status == '1') {
                    //show sweetalert success
                    setTimeout(function () {
                        //Disabling loader
                        overlay.classList.toggle('is-active');
                        //showing success message
                        swal({
                            title: "Success!",
                            text: data.msg,
                            type: "success"
                        }, function () {
                            window.location = dashboardUrl;
                        });
                    }, 1000);

                    return true;
                } else {
                    //Disabling loader
                    //$('.content_div_loader').removeClass('sk-loading');
                    //show sweetalert success
                    swal({
                        title: "Error!",
                        text: data.msg,
                        type: "error"
                    });
                    return false;
                }
            }
        });
    });
});

//Initializing render weather function on serach button click listener
searchBtn.addEventListener('click', () => {
    if(!inputBox.value){
        swal({
            title: "Error!",
            text: "Please enter a city name",
            type: "error"
        });
    }
    renderWeather(inputBox.value);
});