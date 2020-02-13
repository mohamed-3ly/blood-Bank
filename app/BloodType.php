<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BloodType extends Model 
{

    protected $table = 'blood_types';
    public $timestamps = true;
    protected $fillable = array('name');

    public function clients()
    {
        return $this->hasMany('App\Client');
    }

    public function donations()
    {
        return $this->hasMany('App\DonationRequest');
    }

    public function clientsNotifications()
    {
        return $this->belongsToMany('App\Client');
    }

}