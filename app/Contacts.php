<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Contacts extends Model 
{

    protected $table = 'contacts';
    public $timestamps = true;
    protected $fillable = array('name', 'email', 'phone', 'subject', 'message');

    public function client()
    {
        return $this->belongsTo('App\Client');
    }

}