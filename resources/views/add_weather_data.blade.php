@extends('main')

@section('content')
    <div class="card w-50">
        <div class="card-header">Add Weather Data</div>
        <div class="card-body">
            <form>
                <div class="mb-3">
                    <label for="cityName" class="form-label">Enter City Name</label>
                    <input type="email" class="form-control" id="cityName">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>        

@endsection('content')
