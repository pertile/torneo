<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Team extends Model
{
    public function matchesHome() {
        return $this->hasMany('App\Match', 'home');
    }

    public function matchesAway() {
        return $this->hasMany('App\Match', 'away');
    }
}
