<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Testimonial extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'program',
        'year',
        'short_description',
        'full_testimonial',
        'background',
        'current_status',
        'future_goals',
        'image',
    ];
    protected $hidden = [
        'created_at',
        'updated_at',
    ];
}
