<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Tournament extends Model
{
    public function scopeValid($query) {
        return $query->where('valid', 1);
    }

    public function instances() {
        return $this->hasMany('App\Instance');
    }
    
    public function matches() {
        return $this->hasManyThrough('App\Match', 'App\Instance');
    }

    public function incidents() {
        return $this->hasManyThrough('App\Incident', 'App\Instance');
    }
}
