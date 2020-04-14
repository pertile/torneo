<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Auth::routes();

Route::get('home', function() {
    return view('home');
});

Route::group(['prefix' => 'maxi-power'], function () {
    Voyager::routes();
});

//Route::resource('matches', 'MatchController');

Route::get('/{any}', function () {
    return view('app');
})->where('any', '.*');

