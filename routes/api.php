<?php

use Illuminate\Http\Request;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::middleware('auth:sanctum')->resource('tournaments', 'TournamentController');
Route::get('tournaments/{id}/matches', 'TournamentController@matches');
Route::get('tournaments/{id}/incidents', 'TournamentController@incidents');
Route::get('tournaments/{id}/instances', 'TournamentController@instances');

Route::middleware('auth:sanctum')->resource('instances', 'InstanceController');
Route::get('instances/{instance}/teams/{team}/matches', 'InstanceController@teamMatches');
Route::get('instances/{instance}/lastmatches', 'InstanceController@lastMatches');
Route::middleware('auth:sanctum')->get('instances/{id}/teams', 'InstanceController@teams');
Route::get('instances/{id}/standings/{date}', 'InstanceController@standings');


Route::middleware('auth:sanctum')->resource('teams', 'TeamController');

Route::middleware('auth:sanctum')->resource('matches', 'MatchController');

Route::middleware('auth:sanctum')->resource('incidents', 'IncidentController');

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('auth:sanctum')->get('/pingo', function (Request $request) {
    return 'chupame el pingo';
}); 


Route::prefix('v1')->group(function () {
    Route::prefix('auth')->group(function () {
        // Below mention routes are public, user can access those without any restriction.
        // Create New User
        Route::post('register', 'AuthController@register');
        // Login User
        Route::post('login', 'AuthController@login');
        
        // Refresh the JWT Token
        Route::get('refresh', 'AuthController@refresh');
        
        // Below mention routes are available only for the authenticated users.
        Route::middleware('auth:api')->group(function () {
            // Get user info
            Route::get('user', 'AuthController@user');
            // Logout user from application
            Route::post('logout', 'AuthController@logout');
        });
    });
});