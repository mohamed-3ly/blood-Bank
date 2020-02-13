<?php

namespace App\Http\Controllers\Api;
use Illuminate\Foundation\Auth\User as Authenticatable;
use App\Http\Middleware\Authenticate;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Mail\ResetPassword;
use App\Client;
use Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class AuthController extends Authenticatable
{

    public function register (Request $request)
    { 
        $validation = Validator()->make($request->all(),[
            'name' =>'required|min:5',
            'email' =>'required|email|unique:clients',
            'date_of_birth' =>'required|date',
            'blood_type_id' =>'required',
            'last_donation_date' =>'required|date',
            'city_id' =>'required',
            'phone' =>'required|unique:clients|numeric|regex:/^([0-9\s\-\+\(\)]*)$/|min:9',
            'password' =>'required|confirmed',
        ]);

        if ($validation->fails())
        {
            return responseJson(0,$validation->errors()->first(),);
        }
        $request->merge(['password'=> Hash::make($request->password)]);
        $client = Client::create($request->all());

        $client->api_token = Str::random(60);;
        $client->save();
        return responseJson(1,'تم الاضافه بنجاح',$client);
    }

    public function login(Request $request)
    {
        $validation = Validator()->make($request->all(),[
            'phone' =>'required|numeric|regex:/^([0-9\s\-\+\(\)]*)$/|min:9',
            'password' =>'required',
        ]);

        if ($validation->fails())
        {
            return responseJson(0,$validation->errors()->first(),);
        }
        // $auth= Auth::guard('api')->validate($request->all());
        // return responseJson(0,'kuhkjh',$auth);
        $client = Client::where('phone',$request->phone)->first();
        if($client)
        {

            if(Hash::check($request->password , $client->password))
            {
                return responseJson(0,'تم تسجيل الدخول',[
                    'api_token' => $client->api_token,
                    'data'      => $client,
                ]);
            }
            else{
                return responseJson(0,'البيانات غير صحيحه',);
            }
        }
        else{
            return responseJson(0,'البيانات غير صحيحه',);
        }
    }

    public function reset(Request $request)
    {
                $user = Client::where('phone',$request->phone)->first();
                if($user)
                {
                    $code=Str::random(6);
                    $update=$user->update(['pin_code'=> $code]);
                    if($update)
                    {    
                        // send sms to phone with code
                        //smsMisr($request->phone,"your reset password code is:".$code );
                        // send mail
                        Mail::to($user->email)
                        // ->bcc('admin email') // optional
                        ->send(new ResetPassword($code));
                        return responseJson(1,'تم ارسال البريد بنجاح');
                    }
                }
                else{
                    return responseJson(0,'تم ارسال بيانات خاطئه'); 
                }
        
        return responseJson(1,'success');
    }

    public function newPassword (Request $request)
    {
        $validation = Validator()->make($request->all(),[
            'phone' =>'required|numeric|regex:/^([0-9\s\-\+\(\)]*)$/|min:9',
            'password' =>'required|confirmed',
            'pin_code' =>'required|size:6|string'
        ]);

        if ($validation->fails())
        {
            return responseJson(0,$validation->errors()->first(),);
        }
        $user = Client::where('pin_code',$request->pin_code)->where('pin_code' , '!=',0)
                            ->where('phone' ,$request->phone)->first();
        if($user)
        {
                $user->password=Hash::make($request->password);
                $user->pin_code=null;
            if($user->save())
            {
                return responseJson(1,' تم تحديث بياناتك'); 
            }
            else
            {
                return responseJson(0,'حدث خطأ'); 
            }
        }
        else{
            return responseJson(0,'تم ارسال بيانات خاطئه'); 
        }
    }

    public function profile (Request $request)
    {
        if($request->has('name'))
            {
                //validate data like registeration
                $validation = Validator()->make($request->all(),[
                    'name' =>'required|min:5',
                    'email' =>'required|email|unique:clients',
                    'date_of_birth' =>'required|date',
                    'blood_type_id' =>'required',
                    'last_donation_date' =>'required|date',
                    'city_id' =>'required',
                    'phone' =>'required|unique:clients|numeric|regex:/^([0-9\s\-\+\(\)]*)$/|min:9',
                    'password' =>'required|confirmed',
                ]);
        
                if ($validation->fails())
                {
                    return responseJson(0,$validation->errors()->first(),);
                }

                // update user data in database
                $client = Client::where(function ($quary) use ($request){
                    $update=$request->user()->update($request->all());
                })->get();

                return responseJson(1,'updated',$request->user());
            }      
        return responseJson(1,'seccess',$request->user());

    }

}
