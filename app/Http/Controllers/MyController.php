<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MyController extends Controller
{
    public function gravy() {
        return view('/vendor/voyager/gravy');
    }
}
