@extends('main')

@section('content')
    <div class="row justify-content-center">
        <div class="col-md-4">
            @error('credentials')
                <div class="alert alert-danger">
                    {{ $message }}
                </div>
            @enderror

            @if ($message = Session::get('success'))
                <div class="alert alert-info">
                    {{ $message }}
                </div>
            @endif

            @if ($message = Session::get('error'))
                <div class="alert alert-info">
                    {{ $message }}
                </div>
            @endif
            <div class="card">
                <div class="card-header">Login</div>
                <div class="card-body">
                    <form action="{{ route('auth.validate_login') }}" method="post">
                        @csrf
                        <div class="form-group mb-3">
                            <input type="text" name="email" class="form-control" placeholder="Email"
                                value="{{ old('email') }}" />
                        </div>
                        <div class="form-group mb-3">
                            <input type="password" name="password" class="form-control" placeholder="Password"
                                value="{{ old('password') }}" />
                        </div>
                        <div class="d-grid mx-auto">
                            <button type="subit" class="btn btn btn-primary btn-block">Login</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection('content')
