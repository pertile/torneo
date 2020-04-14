<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Instance extends Model
{
    public function matches() {
        return $this->hasMany('App\Match');
    }

    public function teams() {
        return $this->hasManyThrough('App\Team', 'App\Match');
    }

    public function tournament() {
        return $this->belongsTo('App\Tournament');
    }
}
