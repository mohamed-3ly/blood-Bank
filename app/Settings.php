<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Settings extends Model 
{

    protected $table = 'settings';
    public $timestamps = true;
    protected $fillable = array('notification_settings_text', 'about_app', 'phone', 'email', 'fb_link', 'tw_link', 'youtube_link', 'insta_link', 'app_logo', 'play_store_link', 'app_store_link');

}