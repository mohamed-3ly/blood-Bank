<?php

namespace App\Http\Controllers\Admin;
use App\Post;
use App\Category;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
// use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;

class PostsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $records = Governorate::paginate(20);
        $records = Post::with('category')->paginate(20);
        // dd($records);
        return view('posts.index',compact('records'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $records = Category::pluck('name', 'id');
        
        return view('posts.create',compact('records'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd($request->image);
        $rules =[
            'title' => 'required',
            'content' => 'required',
            'image' => 'required|mimes:jpg,jpeg,bmb,pnd,png',
            'category_id' => 'required|exists:categories,id'
        ];
        $this->validate($request,$rules);
        // dd($request->category_id);
        $record = Post::create($request->all());
        if ($request->hasFile('image')) {
           
            $path = public_path();
            $destinationPath = $path . '/uploads/posts/'; // upload path
            $background_photo = $request->file('image');
            $extension = $background_photo->getClientOriginalExtension(); // getting image extension
            $name = time() . '' . rand(11111, 99999) . '.' . $extension; // renameing image
            $background_photo->move($destinationPath, $name); // uploading file to given path
            $record->image = 'uploads/posts/' . $name;
             $record->save();
        }
        // $record = Post::create($request->all());

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
        $model= Post::findOrFail($id);
        return view('posts.show',compact('model'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $records = Category::pluck('name', 'id');
        $model= Post::findOrFail($id);
        // dd($model->image);

        return view('posts.edit',compact('model','records'));
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
            'title' => 'required',
            'content' => 'required',
            'image' => 'mimes:jpg,jpeg,bmb,pnd,png',
            'category_id' => 'required|exists:categories,id'
        ];
        $this->validate($request,$rules);

        $model= Post::findOrFail($id);
        
        if ($request->hasFile('image')) {
            
            $image_path = public_path().'/'.$model->image;// delete old image from disk
            File::delete($image_path);
            $model->update($request->all()); //update post
            $path = public_path();
            $destinationPath = $path . '/uploads/posts/'; // upload path

            $background_photo = $request->file('image');
            $extension = $background_photo->getClientOriginalExtension(); // getting image extension
            $name = time() . '' . rand(11111, 99999) . '.' . $extension; // renameing image
            $background_photo->move($destinationPath, $name); // uploading file to given path
            $model->image = 'uploads/posts/' . $name;
            $model->save();
        }
        else
        {
            $model->update($request->all());
        }
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
        $model= Post::findOrFail($id);
        $image_path = public_path().'/'.$model->image;// delete image from disk
        File::delete($image_path);
        $model->delete();
        flash()->success("deleted");
        return back();
    }
}
