<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Token;
use App\donationRequest;

class DonationController extends Controller
{
    public function addDonationRequest (Request $request)
    {
        $validation = Validator()->make($request->all(),[
            'patient_name' =>'required|min:5',
            'patient_age' =>'required:digits',
            'blood_type_id' =>'required|exists:blood_types,id',
            'bags_num' =>'required:digits',
            'hospital_name' =>'required',
            'hospital_address' =>'required',
            'latitude' =>'required|numeric',
            'longitude' =>'required|numeric',
            'city_id' =>'required|exists:cities,id',
            'phone' =>'required|numeric|regex:/^([0-9\s\-\+\(\)]*)$/|min:9',
            'notes' =>'required|string',
        ]);

        if ($validation->fails())
        {
            return responseJson(0,$validation->errors()->first(),);
        }
        // create donation request 
        $donationRequest = $request->user()->donations()->create($request->all());


        //find clients suitable for this request to notify
        $clientIds =$donationRequest->city->governorate->clients()
            ->whereHas('bloodTypes',function($query) use($request ){
                $query->where('blood_types.id',$request->blood_type_id);
            })->pluck('client_id')->toArray();
                    //array_search to find the key of current user
                    //unset to removethis element by it's key
        unset($clientIds[array_search($request->user()->id,$clientIds)]);
        // dd($clientIds);
        if(count($clientIds)){
            //create notification on database
            $notification = $donationRequest->notifications()->create([
                'title' => 'يوجد حاله حرجه',
                'content'=>$request->user()->name .'محتاج تبرع بالدم',
            ]);
            //attach clients to this notification
            $notification->clients()->attach($clientIds);
            
            $tokens = Token::whereIn('client_id',$clientIds)->where('token','!=','')->pluck('token')->toArray();
             //dd($tokens);
            if(count($tokens)){
                $title = $notification->title;
                $body = $notification->content;
                $data =[
                    'donation_request_id'=> $donationRequest->id
                ];
                $send =notifyByFirebase($title, $body, $tokens, $data);
dd( $send);
            }
            return responseJson(1,' وتم اضافه طلبك بنجاح وارسال الاشعارات ',$send);
        }
        return responseJson(1,'تم اضافه طلبك بنجاح');
    }

    public function donationRequests ()
    {
        $donations = donationRequest::paginate(5);
        if(count($donations))
        {
            return responseJson(1,'success',$donations);
        }
        else
        {
            return responseJson(0,'لا يوجد طلبات تبرع');

        }
    }

    public function donationRequestsByType (Request $request)
    {
        $validation = Validator()->make($request->all(),[
            'blood_type_id' =>'required|exists:blood_types,id',
        ]);

        if ($validation->fails())
        {
            return responseJson(0,$validation->errors()->first(),);
        }

        $donations = donationRequest::where(function ($quary) use ($request){
            $quary->where('blood_type_id' , $request->blood_type_id);
            })->paginate(5);

        if(count($donations))
        {
            return responseJson(1,'success',$donations);
        }
        else
        {
            return responseJson(0,'لا يوجد طلبات تبرع');

        }
    }

    public function donationRequestsByCity (Request $request)
    {
        $validation = Validator()->make($request->all(),[
            'city_id' =>'required|exists:cities,id',
        ]);

        if ($validation->fails())
        {
            return responseJson(0,$validation->errors()->first(),);
        }

        $donations = donationRequest::where(function ($quary) use ($request){
            $quary->where('city_id' , $request->city_id);
            })->paginate(5);

        if(count($donations))
        {
            return responseJson(1,'success',$donations);
        }
        else
        {
            return responseJson(0,'لا يوجد طلبات تبرع');

        }
    }
    
    public function donationRequestsByCityType (Request $request)
    {
        $validation = Validator()->make($request->all(),[
            'city_id' =>'required|exists:cities,id',
            'blood_type_id' =>'required|exists:blood_types,id',
        ]);

        if ($validation->fails())
        {
            return responseJson(0,$validation->errors()->first(),);
        }

        $donations = donationRequest::where(function ($quary) use ($request){
            $quary->where('city_id' , $request->city_id)
            ->where('blood_type_id' , $request->blood_type_id);
            })->paginate(5);

        if(count($donations))
        {
            return responseJson(1,'success',$donations);
        }
        else
        {
            return responseJson(0,'لا يوجد طلبات تبرع');

        }
    }

    public function donationRequest (Request $request)
    {
        $validation = Validator()->make($request->all(),[
            'id' =>'required|exists:donation_requests,id',
        ]);

        if ($validation->fails())
        {
            return responseJson(0,$validation->errors()->first(),);
        }

        $donation = donationRequest::where(function ($quary) use ($request){
            $quary->where('id' , $request->id);
            })->get();

            return responseJson(1,'success',$donation);
    }



}
