<?php

namespace App\Http\Controllers;

use App\Http\Requests\EditMatchPost;
use App\Match;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Auth;

class MatchController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Match::with('homeTeam', 'awayTeam', 'instance')->get();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Match  $match
     * @return \Illuminate\Http\Response
     */
    public function show(Match $match)
    {
        
        //return Auth::user()->name;
        
        return Match::with('homeTeam', 'awayTeam', 'instance')->find($match->id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Match  $match
     * @return \Illuminate\Http\Response
     */
    public function edit(Match $match)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Match  $match
     * @return \Illuminate\Http\Response
     */
    public function update(EditMatchPost $request, Match $match)
    {
        /*
        
        $oneAbsent = explode('-', $match->instance->one_absent);
        $twoAbsentsScore = $match->instance->two_absents;
        $wonScoreAbsent = $oneAbsent[0];
        $lostScoreAbsent = $oneAbsent[1];
        
        //SE PRESENTÓ EL LOCAL Y NO EL VISITANTE
        //verifico puntaje del local
        $v->sometimes('home_score', Rule::in([$wonScoreAbsent]), function($request) {
            return ($request->home_played && ! $request->away_played) 
        };
        //verifico puntaje del visitante
        $v->sometimes('away_score', Rule::in([$lostScoreAbsent]), function($request) {
            return ($request->home_played && ! $request->away_played) 
        };

        //SE PRESENTÓ EL VISITANTE Y NO EL LOCAL
        //verifico puntaje del visitante
        $v->sometimes('away_score', Rule::in([$wonScoreAbsent]), function($request) {
            return (! $request->home_played && $request->away_played) 
        }; 

        //verifico puntaje del local
        $v->sometimes('home_score', Rule::in([$lostScoreAbsent]), function($request) {
            return (! $request->home_played && $request->away_played) 
        };

        //NINGUNO SE PRESENTÓ
        //verifico puntaje del local
        $v->sometimes('home_score', Rule::in([$twoAbsentsScore]), function($request) {
            return (! $request->home_played && ! $request->away_played) 
        };

        //verifico puntaje del visitante
        $v->sometimes('away_score', Rule::in([$twoAbsentsScore]), function($request) {
            return (! $request->home_played && ! $request->away_played) 
        };*/

        //$validated = $request->validate();
        
        $match->home_score = $request->home_score;
        $match->away_score = $request->away_score;
        $match->home_points = $request->home_points;
        $match->away_points = $request->away_points;
        $match->home_played = $request->home_played;
        $match->away_played = $request->away_played;
        $match->date = new Carbon($request->date);
        $match->note = $request->note;
        $match->save();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Match  $match
     * @return \Illuminate\Http\Response
     */
    public function destroy(Match $match)
    {
        //
    }
}
