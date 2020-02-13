<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::group(['namespace' => 'Front'] , function(){

Route::get('/', 'mainController@home');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

// Route::get('/admin', 'Admin\AdminController@index')->name('dashboard');
// // Client Auth
// Route::group(['prefix' =>'admin' ,'namespace' => 'ClientAuth'],function(){
// Route::get('/register', 'RegisterController@showRegistrationForm');
// Route::post('/register', 'RegisterController@register');
// Route::get('/login', 'LoginController@showLoginForm')->name('Client.login');
// Route::post('/login', 'LoginController@login')->name('Client.login.submet');

// });

Route::group(['middleware'=>['auth:web','auto-check-permission']] , function(){

Route::resource('city','Admin\CitiesController');
Route::resource('governorate','Admin\GovernoratesController');
Route::resource('category','Admin\CategoriesController');
Route::resource('client','Admin\ClientsController');
Route::resource('post','Admin\PostsController');
Route::resource('role','Admin\RolesController');
Route::resource('permission','Admin\PermissionsController');
Route::resource('user','Admin\UsersController');
});

