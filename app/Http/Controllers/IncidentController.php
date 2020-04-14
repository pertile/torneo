<?php

namespace App\Http\Controllers;

use App\Incident;
use Illuminate\Http\Request;
use Carbon\Carbon;

class IncidentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Incident::with('instance', 'team', 'instance.tournament')->get();
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
        $validated = $request->validate([
            'instance' => 'required',
            'team' => 'required',
            'points' => 'required|integer|between:-99,99',
            'date' => 'required',
            'note' => 'required'
        ], [], [
            'instance' => 'instancia',
            'team' => 'equipo',
            'points' => 'puntos',
            'date' => 'fecha',
            'note' => 'observaciones'
        ]);
        
        $incident = new Incident;
        $incident->team()->associate($request->team['id']);
        $incident->instance()->associate($request->instance['id']);
        $incident->points = $request->points;
        $incident->date = new Carbon($request->date);
        $incident->note = $request->note;
        
        $incident->save();

        return $incident;

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Incident  $incident
     * @return \Illuminate\Http\Response
     */
    public function show(Incident $incident)
    {
        return Incident::with('team', 'instance', 'instance.tournament')->find($incident->id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Incident  $incident
     * @return \Illuminate\Http\Response
     */
    public function edit(Incident $incident)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Incident  $incident
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Incident $incident)
    {
        $validate = $request->validate([
            'points' => 'required|integer|between:-99,99',
            'date' => 'required',
            'note' => 'required'
        ], [], [
            'points' => 'puntos',
            'date' => 'fecha',
            'note' => 'observaciones'
        ]);
        
        $incident->team()->associate($request->team['id']);
        
        $incident->points = $request->points;
        $incident->date = new Carbon($request->date);
        $incident->note = $request->note;
        
        $incident->save();

        return $incident;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Incident  $incident
     * @return \Illuminate\Http\Response
     */
    public function destroy(Incident $incident)
    {
        $incident->delete();
    }
}
