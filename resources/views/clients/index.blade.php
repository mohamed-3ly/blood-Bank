@extends('layouts.app')

@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Clients</h1>
          </div>
                  <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                      <li class="breadcrumb-item"><a href="{{url('/home')}}">Home</a></li>
                      <li class="breadcrumb-item active">Clients</li>
                    </ol>
                  </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    @include('flash::message')
    @if(count($records))
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Clients</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>#</th>
                  <th>name</th>
                  <th>phone</th>
                  <th>city</th>
                  <th>email</th>
                  <th>data of birth</th>
                  <th>blood Type</th>
                  <th>last donation data</th>
                  <th>Active / Deactive</th>
                  <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                    @foreach($records as $record)
                      <tr>
                          <td>{{$loop->iteration}}</td>
                          <td>{{$record->name}}</td>
                          <td>{{$record->phone}}</td>
                          <td>{{$record->city->name}}</td>
                          <td>{{$record->email}}</td>
                          <td>{{$record->date_of_birth}}</td>
                          <td>{{$record->bloodType->name}}</td>
                          <td>{{$record->last_donation_date}}</td>
                          <td>
                              @if($record->is_active)
                              <a href="{{url(route('client.edit',$record->id))}}" class="btn btn-success btn-xs">
                              activatd  
                              @else
                              <a href="{{url(route('client.edit',$record->id))}}" class="btn btn-danger btn-xs">
                              not activeate  
                              @endif  
                            <i class="fa fa-edit">  </i></a>
                          </td>
                          <td>
                          {!!Form::open([
                                'action' => ['Admin\ClientsController@destroy', $record->id],
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