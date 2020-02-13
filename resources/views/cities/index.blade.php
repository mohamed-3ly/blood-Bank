@extends('layouts.app')
@inject('city','App\city')
@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Cities</h1>
          </div>
                  <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                      <li class="breadcrumb-item"><a href="{{url('/home')}}">Home</a></li>
                      <li class="breadcrumb-item active">Cities</li>
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
                <h3 class="card-title">Cities</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                    <i class="fas fa-minus"></i></button>
                </div>
              </div>
              
              <div class="card-body">
              <a href="{{url(route('city.create'))}}" class="btn btn-primary"><i class="fa fa-plus"></i> New City</a>
              @include('flash::message')
                @if(count($records))
                <div class="table-responsive">
                    <table class="table table-borderd">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>name</th>
                                <th>Governorate</th>
                                <th>edit</th>
                                <th>delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($records as $record)
                                <tr>
                                    <td>{{$loop->iteration}}</td>
                                    <td>{{$record->name}}</td>
                                    <td>{{$record->governorate->name}}</td>
                                    <td>
                                        <a href="{{url(route('city.edit',$record->id))}}" class="btn btn-success btn-xs"><i class="fa fa-edit"></i></a>
                                    </td>
                                    <td>
                                        {!!Form::open([
                                            'action' => ['Admin\CitiesController@destroy', $record->id],
                                            'method' => 'DELETE'
                                        ])!!}
                                        <button type='submit' class='btn btn-danger btn-xs'><i class="fa fa-trash-o"></i></button>
                                        {!! Form::close() !!}
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                        <!-- <tfoot>
                            <div class="card-footer clearfix">
                                <ul class="pagination pagination-sm m-0 float-right">
                                    <li class="page-item"><a class="page-link" href="#">«</a></li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">»</a></li>
                                </ul>
                            </div>
                        </tfoot> -->
                    </table>
                
                    @else
                            <div class="alert alert-danger" role="alert">
                                no data
                            </div>
                    @endif
                
                </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
      </div>
    </section>
    <!-- /.content -->

@endsection
