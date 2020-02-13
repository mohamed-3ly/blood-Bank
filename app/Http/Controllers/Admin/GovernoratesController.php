<?php

namespace App\Http\Controllers\Admin;
use App\Governorate;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class GovernoratesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $records = Governorate::paginate(20);
        $records = Governorate::with('cites')->paginate(20);
        // dd($records);
        return view('governorates.index',compact('records'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('governorates.create');
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
            'name' => 'required'
        ];
        $this->validate($request,$rules);
        $record = Governorate::create($request->all());
        flash()->success("success ");
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
        $model= Governorate::findOrFail($id);
        return view('governorates.edit',compact('model'));
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
        $model= Governorate::findOrFail($id);
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
        $model= Governorate::findOrFail($id);
        $model->delete();
        flash()->success("deleted");
        return back();
    }
}
