<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Match extends Model
{
    protected $appends = ['home_result', 'away_result'];
    
    public function instance() {
        return $this->belongsTo('App\Instance');
    }

    public function homeTeam() {
        return $this->belongsTo('App\Team', 'home');
    }

    public function awayTeam() {
        return $this->belongsTo('App\Team', 'away');
    }

    public function getHomeResultAttribute() {
        $home = $this->home_score;
        $away = $this->away_score;
        
        $twoAbsents = explode('-', $this->instance->two_absents);

        //por esta situación no se puede poner result como un campo independiente, ya que en este caso ambos pierden
        if ($twoAbsents[0] == $home && $twoAbsents[1] == $away) {
            return 'lost';
        }
        if ($home > $away) {
            return 'win';
        } else {
            if ($home < $away) {
                return 'lost';
            } else {
                return 'draw';
            }
        }
    }

    public function getAwayResultAttribute() {
        $home = $this->home_score;
        $away = $this->away_score;
        
        $twoAbsents = explode('-', $this->instance->two_absents);

        if ($twoAbsents[0] == $home && $twoAbsents[1] == $away) {
            return 'lost';
        }
        if ($home < $away) {
            return 'win';
        } else {
            if ($home > $away) {
                return 'lost';
            } else {
                return 'draw';
            }
        }        
    }

}
