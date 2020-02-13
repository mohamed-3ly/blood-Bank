<?php

namespace App\Http\Controllers\Admin;
use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Hash;
use Auth;
use Session;
class UsersController extends Controller
{
    public function __construct() {
        $this->middleware(['auth']);//isAdmin middleware lets only users with a //specific permission permission to access these resources
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $records = User::all();//Get all roles
        return view('users.index')->with('records', $records);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $records = Role::all();//Get all roles
    // dd($records);
        return view('users.create', ['records'=>$records]);
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
            'name'=>'required|max:120',
            'email'=>'required|email|unique:users',
            'password'=>'required|min:6|confirmed',
            'roles' => 'required|exists:roles,id'
        ];
        $this->validate($request,$rules);
        // $user = User::create($request->only('email', 'name'));
        $user = new User();
        $user->name = $request->name;
        $user->email =$request->email;
        $password = Hash::make($request->password);
        $user->password = $password;
        $user->save();

        $roles = $request['roles']; //Retrieving the roles field
        //Looping thru selected permissions
        foreach ($roles as $role) {
            $role_r = Role::where('id', '=', $role)->firstOrFail();            
            $user->assignRole($role_r); //Assigning role to user
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
        $user = User::findOrFail($id); //Get user with specified id
        $records = Role::get(); //Get all roles

        return view('users.edit', compact('user', 'records')); //pass user and roles data to view

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
            'name'=>'required|max:120',
            'email'=>'required|email|unique:users,email,'.$id,
            'password'=>'required|min:6|confirmed',
            'roles' => 'required|exists:roles,id'
        ];
        $this->validate($request,$rules);
        // $user = User::create($request->only('email', 'name'));
        $user = User::findOrFail($id); //Get user specified by id
        // $input = $request->only(['name', 'email', 'password']); //Retreive the name, email and password fields
        // dd($input->password);
        // $input->password = Hash::make($input->password);
        // $user->fill($input)->save();
        $user->name = $request->name;
        $user->email =$request->email;
        $password = Hash::make($request->password);
        $user->password = $password;
        $user->save();

        $roles = $request['roles']; //Retreive all roles
        //Looping thru selected permissions
        $user->roles()->sync($roles);
        flash()->success("success");
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
        $model= Post::findOrFail($id);
        $image_path = public_path().'/'.$model->image;// delete image from disk
        File::delete($image_path);
        $model->delete();
        flash()->success("deleted");
        return back();
    }
}
