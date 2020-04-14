<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Person extends Model
{
    public function getFullNameAttribute()
    {
        return "{$this->apellido}, {$this->nombre}";
    }

    public $additional_attributes = ['full_name'];
}
