<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class NotificationController extends Controller
{

    public function registerToken(Request $request)
    {
        $validation = Validator()->make($request->all(),[
            'token' =>'required',
            'platform' =>'required|in:android,ios',
        ]);

        if ($validation->fails())
        {
            return responseJson(0,$validation->errors()->first(),);
        }
        $request->user()->tokens()->create($request->all());


        return responseJson(1,'تم التسجيل بنجاح');
    }

    public function notificationSettings (Request $request)
    {
        $validation = Validator()->make($request->all(),[
            'bloodtypes' =>'required|array|exists:blood_types,id',
            'governorates' =>'required|array|exists:governorates,id',
           
        ]);

        if ($validation->fails())
        {
            return responseJson(0,$validation->errors()->first(),);
        }
       
            $update=$request->user()->bloodTypes()->sync($request->bloodtypes);
            $update=$request->user()->governorates()->sync($request->governorates);


            $data = [
                'governorates'=>$request->user()->governorates()->pluck('governorates.id')->toArray(),
                'bloodtypes'=>$request->user()->bloodTypes()->pluck('blood_types.id')->toArray(),
            ];
            return responseJson(1,'notification settings', $data);
    }

    public function notificationCount (Request $request)
    {
        $count = $request->user()->notifications()->where(function ($quary) use ($request){
            $quary->where('is_read' , null);
            })->get();

        return responseJson(1,'success', count($count));
    }

    public function notifications (Request $request)
    {
        //$notifications = $request->user()->notifications()->with('donationRequest:id,created_at')->get();
        $notifications = $request->user()->notifications()->get();


        if(count($notifications))
        {
            return responseJson(1,'success',$notifications);
        }
        else
        {
            return responseJson(0,'لا يوجد طلبات تنبيهات');

        }    
    }

    public function test (Request $request)
    {
        // $tokens = ['dTCJRJHoXb8:APA91bHqUsDWTq-qBZvBE444Zbf3KXYHWFqG6MK-iwTCtWzrkvXlVxhcjdr5P4wUDbiGsG30bpuaZGQPP0Quv9MNYF0eEg8eUrfEaYKSnZOiZbDYTb_WvLYwLFkuWmd4nN6Vw7VDKykS'];
        $tokens = ['eGqD6jNnZLw:APA91bHd2eU4PI52BYc-LjNJ0LWwfuZpjP7G80Y0GWP5GhlsntMLzJ5jgj3xe7g8ThXOuIs2rJUQnllblA1TThP9FEG-n9vfeR-8kaxKoXXWqHUtFR36jejRGqW-PTW88q76MVIk5T_M'];

        $title = "مرحبا ههههههههه  و ";
        $body = "تجربه ";
        $data =[
            'donation_request_id'=> 1
        ];
        $send = notifyByFirebase($title, $body, $tokens, $data, true);

        return responseJson(1,' وتم اضافه طلبك بنجاح وارسال الاشعارات ',$send);
    }
}



