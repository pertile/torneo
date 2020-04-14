<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Incident extends Model
{
    use SoftDeletes;

    public function instance() {
        return $this->belongsTo('App\Instance');
    }

    public function team() {
        return $this->belongsTo('App\Team');
    }
    
    public function getTournamentAttribute() {
        return $this->instance->tournament;
    }
}
