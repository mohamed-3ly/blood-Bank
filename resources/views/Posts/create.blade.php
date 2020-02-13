@extends('layouts.app')
@inject('model','App\City')
@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>cities</h1>
          </div>
                  <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                      <li class="breadcrumb-item"><a href="{{url('/home')}}">Home</a></li>
                      <li class="breadcrumb-item active">Create cities</li>
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
                <h3 class="card-title">Create cities</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                    <i class="fas fa-minus"></i></button>
                </div>
              </div>
              
                <div class="card-body">
                @include('flash::message')

                    @include('partials.validation_errors')
                    {!! Form::model($model,[
                        'action' =>'Admin\PostsController@store',
                        'files'=> true
                    ])!!}
                    <div class="form-group">
                        <label for="title">Title</label>
                        {!! Form::text('title', null, $attributes = [
                            'class' => 'form-control'
                          ]) !!}
                      </div>
                      <div class="form-group">
                        <label for="content">Content</label>
                        {!! Form::textarea('content', null, $attributes = [
                            'class' => 'form-control',
                            'rows'  => 5
                          ]) !!}
                      </div>
                      <div class="form-group">
                        <label for="image">Chose Image</label>
                        {!! Form::file('image',null , $attributes = [
                          'class' => 'form-control',
                          'files'=> true
                          ])  !!}
                      </div>
                      <div class="form-group">
                        <label for="category_id">Category name</label>
                        {!! Form::select('category_id', $records,  null, ['placeholder' => 'choose category ..'], 
                          $attributes = [
                            'class' => 'form-control'
                          ])!!}
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
