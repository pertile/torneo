<?php

namespace App\Http\Controllers;

use App\Instance;
use App\Match;
use App\Team;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\DB;

class InstanceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $instances = Instance::with('tournament')->get()->sortByDesc('created_at')->values();
        
        return $instances;
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

    public function createMatchesRoundRobin(Instance $instance, Array $teams) {
        foreach ($teams as $home) {
            foreach ($teams as $away) {
                if ($home !== $away) {
                    $match = new Match;
                    $match->instance_id = $instance->id;
                    $match->home = $home;
                    $match->away = $away;
                    $match->save();
                }
            }
        }
    }

    public function standings(int $instance, string $date) {
        $standings = DB::select("CALL Standings(?, ?)", [$instance, $date]);

        $lastMatches = new Collection;
        
        foreach($standings as $standing) {
            $lastMatches = DB::table('matches')
                ->join('teams as home', 'matches.home', '=', 'home.id')
                ->join('teams as away', 'matches.away', '=', 'away.id')
                ->select('matches.*', 'home.name as homeName', 'home.shield as homeShield', 
                    'away.name as awayName', 'away.shield as awayShield')
                ->where('instance_id', $instance)
                ->whereNotNull('date')
                ->where('date', '<=', $date)
                ->where(function ($query) use ($standing) {
                    $query->where('home', '=', $standing->team_id)
                          ->orWhere('away', '=', $standing->team_id);
                    })
                ->orderBy('date', 'desc')
                ->take(5);

                $standing->lastMatches = $lastMatches->get();
        }

        return $standings;
    }

    public function teamMatches(int $instance, int $team) {
        
        return DB::table('matches')
            ->where('instance_id', $instance)
            ->join('teams as home', 'matches.home', '=', 'home.id')
            ->join('teams as away', 'matches.away', '=', 'away.id')
            ->select('matches.*', 'home.name as homeName', 'home.shield as homeShield', 
                'away.name as awayName', 'away.shield as awayShield')
            ->where(function ($query) use ($team) {
                $query->where('home', '=', $team)
                      ->orWhere('away', '=', $team);
            })->orderBy('date', 'desc')->get();

    }

    public function lastMatches(int $instance) {
        $matches = Instance::find($instance)->matches()->get();
        // $matches->dd();
        $teams = new Collection;
        
        foreach ($matches as $match) {
            $teams->push($match->homeTeam);
            $teams->push($match->awayTeam);
        }

        $uniqueTeams = $teams->unique();

        $result = new Collection;

        foreach ($uniqueTeams as $team) {
            //$lastHomeMatches = Team::find($team->id)->matchesHome()->get()->where('instance_id', $instance)->whereNotNull('date');
            //$lastAwayMatches = Team::find($team->id)->matchesAway()->get()->where('instance_id', $instance)->whereNotNull('date');

            $lastMatches = DB::table('matches')
                ->where('instance_id', $instance)
                ->whereNotNull('date')
                ->where(function ($query) use ($team) {
                    $query->where('home', '=', $team->id)
                          ->orWhere('away', '=', $team->id);
                    })
                ->orderBy('date', 'desc')
                ->take(5);
            //$lastHomeMatches->concat($lastAwayMatches);
            $team->lastMatches = $lastMatches->get();

            $result->push($team);
        }

        return $result;
    }

    public function teams(int $id) {
        //$instance = Instance::Find($id);
        $matches = Instance::find($id)->matches()->get();
        // $matches->dd();
        $teams = new Collection;
        
        foreach ($matches as $match) {
            $teams->push($match->homeTeam);
            $teams->push($match->awayTeam);
        }
        //$teams->unique()->sortBy('name')->dd();
        $sortedTeams = $teams->unique()->sortBy('name')->values();
        return $sortedTeams;
        
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Instance  $instance
     * @return \Illuminate\Http\Response
     */
    public function show(Instance $instance)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Instance  $instance
     * @return \Illuminate\Http\Response
     */
    public function edit(Instance $instance)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Instance  $instance
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Instance $instance)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Instance  $instance
     * @return \Illuminate\Http\Response
     */
    public function destroy(Instance $instance)
    {
        //
    }
}
