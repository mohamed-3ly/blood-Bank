<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

//api/v1/اسم الروت

Route::group(['prefix' =>'v1' ,'namespace' => 'Api'],function(){
    
    // user cycle
    Route::post('register' , 'Authcontroller@register');
    Route::post('login' , 'Authcontroller@login');
    Route::get('reset' , 'Authcontroller@reset');
    Route::post('new-password' , 'Authcontroller@newPassword');

    
    Route::get('governorates' , 'Maincontroller@governorates');
    Route::get('cities' , 'Maincontroller@cities');
    Route::get('settings' , 'Maincontroller@settings');
    Route::get('categories' , 'Maincontroller@categories');
    Route::get('blood-types' , 'Maincontroller@bloodTypes');

    
    Route::get('test' , 'NotificationController@test');


    //Route::get('posts' , 'Maincontroller@posts');

    Route::group(['middleware'=>'auth:api',] , function(){

        //notification cycle
        Route::post('register-token' , 'NotificationController@registerToken');
        Route::post('notification-settings' , 'NotificationController@notificationSettings');
        Route::post('notification-count' , 'NotificationController@notificationCount');
        Route::post('notifications' , 'NotificationController@notifications');

        //donation cycle
        Route::post('add-donation-request' , 'DonationController@addDonationRequest');
        Route::post('donation-request' , 'DonationController@donationRequest'); // get one donation details
        Route::post('donation-requests' , 'DonationController@donationRequests'); // all donations 
        Route::post('donation-requests-type' , 'DonationController@donationRequestsByType'); // all donations by  blood type
        Route::post('donation-requests-city' , 'DonationController@donationRequestsByCity'); // all donations by  city
        Route::post('donation-requests-city-type' , 'DonationController@donationRequestsByCityType'); // all donations by  city and blood type

        //posts cycle
        Route::post('toggleFavourite' , 'MainController@toggleFavourite');
        Route::get('my-favourites' , 'MainController@myFavourites');
        Route::get('posts' , 'MainController@posts');
        Route::get('post' , 'MainController@post');

        // profile cycle
        Route::get('profile' , 'AuthController@profile');
        //Route::post('contactus' , 'Maincontroller@contactus');

    });
});