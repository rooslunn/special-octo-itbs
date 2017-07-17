<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Client extends Model
{
    protected $fillable = ['name', 'surname', 'code', 'email', 'address', 'town', 'country'];
}
