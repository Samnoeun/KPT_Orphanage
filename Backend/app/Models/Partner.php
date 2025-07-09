<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Partner extends Model
{
    protected $fillable = ['logo', 'link'];
    protected $hidden = ['created_at', 'updated_at'];
}
