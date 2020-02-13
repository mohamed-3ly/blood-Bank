@extends('layouts.app')
@inject('model','App\Role')
@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Users</h1>
          </div>
                  <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                      <li class="breadcrumb-item"><a href="{{url('/home')}}">Home</a></li>
                      <li class="breadcrumb-item active">Create Users</li>
                    </ol>
                  </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <!-- Default box -->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Create Users</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                    <i class="fas fa-minus"></i></button>
                </div>
              </div>
              
                <div class="card-body">
                @include('flash::message')

                    @include('partials.validation_errors')
                    {!! Form::model($model,[
                        'action' =>'Admin\UsersController@store',
                        'files'=> true
                    ])!!}
                    <div class="form-group">
                        <label for="title">Name</label>
                        {!! Form::text('name', null, $attributes = [
                            'class' => 'form-control'
                          ]) !!}
                      </div>
                      
                      <div class="form-group">
                        <label for="title">Email</label>
                        {!! Form::text('email', null, $attributes = [
                            'class' => 'form-control'
                          ]) !!}
                      </div>

                      <div class="form-group">
                        <label for="title">Password</label>
                        {!! Form::password('password', $attributes = [
                            'class' => 'form-control'
                          ]) !!}
                      </div>
                      <div class="form-group">
                        <label for="title">Password confirm</label>
                        {!! Form::password('password_confirmation', $attributes = [
                            'class' => 'form-control'
                          ]) !!}
                      </div>
                      <div class="form-group">
                        <label for="permission_id">Choose Rules </label>
                        <br>
                        @foreach ($records as $record)
                          {{ Form::checkbox('roles[]',  $record->id ) }}
                          {{ Form::label($record->name, ucfirst($record->name)) }}<br>
                        @endforeach
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary" type='submit'>Submit</button>
                    </div>
                    {!! Form::close() !!}
                </div>
                <!-- /.card -->
          </div>
        </div>
      </div>
    </section>
    <!-- /.content     ['L' => 'Large', 'S' => 'Small']       -->

@endsection
