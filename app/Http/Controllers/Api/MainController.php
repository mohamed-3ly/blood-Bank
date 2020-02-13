<?php

namespace App\Http\Controllers\Api;

use Illuminate\Foundation\Auth\User as Authenticatable;

use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Governorate;
use App\City;
use App\Settings;
use App\Category;
use App\BloodType;
use App\Client;
use App\Post;
use App\Cp;



class MainController extends Controller
{
    //get all governorate
    public function governorates()
    {
        // dd("dd");
        $governorates = Governorate::all();
        
        return responseJson(1,'success',$governorates);
    }
    // get all cites and get cites by governorate
    public function cities(Request $request)
    {
        // dd("dd");
        $cities = City::where(function ($quary) use ($request){
            if($request->has('governorate_id'))
            {
                $quary->where('governorate_id' , $request->governorate_id);
            }
        })->get();
        return responseJson(1,'success',$cities);
    }

    // get  app settings
    public function settings()
    {
        $settings = Settings::all();
        return responseJson(1,'success',$settings);
    }

    // public function contactus()
    // {
    //     $contactus = Contacts::all();
    //     return responseJson(1,'success',$contactus);
    // }

    // get  all categories
    public function categories()
    {
        $categories = Category::all();
        return responseJson(1,'success',$categories);
    }

    // get  all blood types
    public function bloodTypes()
    {
        $bloodTypes = BloodType::all();
        return responseJson(1,'success',$bloodTypes);
    }

    // get all posts and search on posts by keyword and category_id
    public function posts(Request $request)
    {
        if($request->has(['search_key' , 'category_id']))
        {
            $posts = Post::where(function ($quary) use ($request){
            $quary->where('content', 'LIKE', "%$request->search_key%")
            ->where('category_id' , $request->category_id);
            //->orWhere('title' ,'LIKE', "%$request->search_key%");
            })->paginate(5);

            return responseJson(1,'success',$posts);

        }elseif($request->has('favourites'))
        {
            $posts = Client::find(request()->user()->id)->posts()->get();
            return responseJson(1,'success',$posts);
        }

        return responseJson(1,'success',$posts);
    }

    public function myFavourites(Request $request)
    {
        // $posts = Client::find(request()->user()->id)->posts()->get();
        $posts =$request->user()->posts()->get();
        return responseJson(1,'success',$posts);
    }

    // get one post
    public function post(Request $request)
    {
        $validation = Validator()->make($request->all(),[
            'post_id' =>'required|exists:posts,id',
        ]);

        if ($validation->fails())
        {
            return responseJson(0,$validation->errors()->first(),);
        }
        $post = Post::where(function ($quary) use ($request){
            
                $quary->where('id' , $request->post_id);
        })->get();

        return responseJson(1,'success',$post);
    }

    // toggle favourite statue
    public function toggleFavourite(Request $request)
    {
         $post_id=$request->post_id;
        $toggleFavourite = $request->user()->posts()->toggle($post_id);
        return responseJson(1,'تم تبديل الحاله بنجاح');
    }

    
 

    
}
