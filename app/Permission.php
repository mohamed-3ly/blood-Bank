<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Permission extends Model 
{
    protected $fillable = array('name', 'guard_name');
    
    public function rols()
    {
        return $this->hasMany('App\Role');
    }
    public function users()
    {
        return $this->hasMany('App\User');
    }
}