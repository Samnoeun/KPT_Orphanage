<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Staff extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'email',
        'description',
        'position',
        'profile'
    ];
    protected $hidden = [
        'created_at',
        'updated_at'
    ];
}
