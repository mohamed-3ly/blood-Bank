<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
// use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Auth;
use Session;
// use Spatie\Permission\Traits\HasRoles;


class PermissionsController extends Controller
{
    public function __construct() {
        $this->middleware(['auth']);//isAdmin middleware lets only users with a //specific permission permission to access these resources
    }
    // use HasRoles;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $records = Permission::all();//Get all roles

        return view('permissions.index')->with('records', $records);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
  
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $model= Permission::findOrFail($id);
        return view('permissions.edit',compact('model'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $rules =[
            'name' => 'required|max:50|unique:roles,name,'.$id,
        ];
        $this->validate($request,$rules);

        $model= Permission::findOrFail($id);
        // $input = $request->except(['permissions']);
        // $model->fill($input)->save();
        $model->update($request->all()); //update 
        // $permissions = $request['permissions'];
        // $model->syncPermissions($permissions);
        flash()->success("edited");
        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

    }
}
