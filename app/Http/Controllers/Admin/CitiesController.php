<?php

namespace App\Http\Controllers\Admin;
use App\City;
use App\Governorate;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CitiesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $records = City::with('governorate')->orderBy('governorate_id')->paginate(20);
        //  dd($records);
        return view('cities.index',compact('records'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $records = Governorate::pluck('name', 'id');
        // dd($records);
        return view('cities.create',compact('records'));    
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd($request->name , $request->id);
        $rules =[
            'name' => 'required',
            'governorate_id'   => 'required|exists:governorates,id'
        ];
        $this->validate($request,$rules);
        $record = City::create($request->all());
        flash()->success("added ");
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
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $model= City::findOrFail($id);
        return view('cities.edit',compact('model'));    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $model= City::findOrFail($id);
        $model->update($request->all());
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
        $model= City::findOrFail($id);
        $model->delete();
        flash()->success("deleted");
        return back();
    }
}
