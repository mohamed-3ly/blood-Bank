@extends('layouts.app')
@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>permissions</h1>
          </div>
                  <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                      <li class="breadcrumb-item"><a href="{{url('/home')}}">Home</a></li>
                      <li class="breadcrumb-item active">permissions</li>
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
              <h3 class="card-title">permissions</h3>
            </div>
            @if(count($records))
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>#</th>
                  <th>Name</th>
                  <th>edit</th>
                </tr>
                </thead>
                <tbody>
                    @foreach($records as $record)
                      <tr>
                          <td>{{$loop->iteration}}</td>
                          <td>{{$record->name}}</td>
                          <td>
                            <a href="{{url(route('permission.edit',$record->id))}}" class="btn btn-success btn-xs">
                            edit 
                            <i class="fa fa-edit">  </i></a>
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