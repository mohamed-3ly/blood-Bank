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


class RolesController extends Controller
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
        $records = Role::all();//Get all roles

        return view('roles.index')->with('records', $records);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $records = Permission::all();//Get all permissions
    // dd($records);
        return view('roles.create', ['records'=>$records]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $rules =[
            'name' => 'required|unique:roles|max:10',
            'permissions' => 'required|exists:permissions,id'
        ];
        $this->validate($request,$rules);
        $record = Role::create(['name' => $request->name]);
        $permissions = $request['permissions'];
        //Looping thru selected permissions
        foreach ($permissions as $permission) {
            $p = Permission::where('id', '=', $permission)->firstOrFail(); 
         //Fetch the newly created role and assign permission
            $role = Role::where('name', '=', $request->name)->first(); 
            $role->givePermissionTo($p);
        }
        flash()->success("success");
        return back();
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
        $records = Permission::all();//Get all permissions
        $role= Role::findOrFail($id);
    // dd($records);
        return view('roles.edit', ['records'=>$records, 'role' =>$role ]);
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
            'name' => 'required|max:10|unique:roles,name,'.$id,
            'permissions' => 'required|exists:permissions,id'
        ];
        $this->validate($request,$rules);

        $model= Role::findOrFail($id);
        // $input = $request->except(['permissions']);
        // $model->fill($input)->save();
        $model->update($request->only('name')); //update 
        $permissions = $request['permissions'];
        $model->syncPermissions($permissions);
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
        $model= Role::findOrFail($id);
        $model->delete();
        flash()->success("deleted");
        return back();
    }
}
