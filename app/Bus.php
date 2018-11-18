<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Bus extends Model
{
    /**
     * The roles that belong to the user.
     */
    public function stops()
    {
        return $this->belongsToMany('App\Stop');
    }
}
