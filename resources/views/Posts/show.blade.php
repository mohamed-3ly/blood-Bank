@extends('layouts.app')
@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Posts</h1>
          </div>
                  <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                      <li class="breadcrumb-item"><a href="{{url('/home')}}">Home</a></li>
                      <li class="breadcrumb-item active">Edit Posts</li>
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
                <h3 class="card-title">Edit Posts</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                    <i class="fas fa-minus"></i></button>
                </div>
              </div>
              
                <div class="card-body">
                @include('flash::message')
                    @include('partials.validation_errors')
                    {!! Form::model($model,[
                        'route' =>['post.update' , $model->id ],
                        'method' => 'put',
                        'files' => true
                    ])!!}
                    <div class="form-group">
                        <label for="title">Title</label>
                        {!! Form::text('title', $model->tltle, $attributes = [
                            'class' => 'form-control'
                        ]) !!}
                    </div>
                    <div class="form-group">
                        <label for="content">Content</label>
                        {!! Form::textarea('content', $model->content, $attributes = [
                            'class' => 'form-control',
                            'rows'  => 5
                          ]) !!}
                      </div>
                      <div class="form-group">
                        <img src="{{asset($model->image)}}" alt="" hight="500" width="500" >
                      </div>
                      <div class="form-group">
                        <label for="image">update Image</label>
                        {!! Form::file('image', null
                          )  !!}
                      </div>
                      <div class="form-group">
                        <label for="category_id">Category </label>
                        {!! Form::select('category_id', $records,  null
                        )!!}
                    </div>
                    
                    {!! Form::close() !!}
                </div>
                <!-- /.card -->
          </div>
        </div>
      </div>
    </section>


@endsection
