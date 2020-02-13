<?php

namespace App;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
class Client extends Authenticatable 
{
    use Notifiable;

    protected $primaryKey = 'id';

    protected $table = 'clients';
    public $timestamps = true;
    protected $fillable = array('phone', 'password', 'email', 'name', 'date_of_birth', 'blood_type_id', 'last_donation_date', 'city_id' ,'is_active');

    public function bloodType()
    {
        return $this->belongsTo('App\BloodType');
    }

    public function city()
    {
        return $this->belongsTo('App\City');
    }

    public function tokens()
    {
        return $this->hasMany('App\Token');
    }

    public function donations()
    {
        return $this->hasMany('App\DonationRequest');
    }

    public function contacts()
    {
        return $this->hasMany('App\Contacts');
    }

    public function posts()
    {
        return $this->belongsToMany('App\Post');
    }

    public function notifications()
    {
        return $this->belongsToMany('App\Notification')->withPivot('is_read');
    }

    public function bloodTypes()
    {
        return $this->belongsToMany('App\BloodType');
    }

    public function governorates()
    {
        return $this->belongsToMany('App\Governorate');
    }

    protected $hidden = [
        'password', 'api_token','pin_code',
    ];

}