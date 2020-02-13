@extends('layouts.app')
@inject('city','App\city')
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
                      <li class="breadcrumb-item active">Posts</li>
                    </ol>
                  </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    @include('flash::message')
    
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Clients</h3>
              <a href="{{url(route('post.create'))}}" class="btn btn-primary" style="
    /* text-align: center; */
    margin-left: 40%;
"><i class="fa fa-plus"></i> New Posts</a>
            </div>
            @if(count($records))
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>#</th>
                  <th>title</th>
                  <th>category</th>
                  <th>show</th>
                  <th>edit</th>
                  <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                    @foreach($records as $record)
                      <tr>
                          <td>{{$loop->iteration}}</td>
                          <td>{{$record->title}}</td>
                          <td>{{$record->category->name}}</td>
                          <td>
                            <a href="{{url(route('post.show',$record->id))}}" class="btn btn-success btn-xs">
                            show 
                            <i class="fa fa-eye">  </i></a>
                          </td>
                          <td>
                            <a href="{{url(route('post.edit',$record->id))}}" class="btn btn-success btn-xs">
                            edit 
                            <i class="fa fa-edit">  </i></a>
                          </td>
                          <td>
                          {!!Form::open([
                                'action' => ['Admin\PostsController@destroy', $record->id],
                                'method' => 'DELETE'
                            ])!!}
                            <button type='submit' class='btn btn-danger btn-xs'><i class="fa fa-trash-o" aria-hidden="true"> </i></button>
                          {!! Form::close() !!}
                          </td>
                      </tr>
                    @endforeach
                </tbody>
                
              </table>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
      <div class="row">
        <div class="col-md-12">
          {{$records->links()}}
          
        </div>
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
    @else
      <div class="alert alert-danger" role="alert">
          no data
      </div>
    @endif

@endsection
@section('script')
<script>
  $(function () {
    $('#example2').DataTable({
      "paging": false,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": true,
    });
  });
</script>
@endsection