<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Notification extends Model 
{

    protected $table = 'notifications';
    public $timestamps = true;
    protected $fillable = array('title', 'content', 'donation_request_id');

    public function donationRequest()
    {
        return $this->belongsTo('App\DonationRequest');
    }

    public function clients()
    {
        return $this->belongsToMany('App\Client')->withPivot('is_read');
    }

}