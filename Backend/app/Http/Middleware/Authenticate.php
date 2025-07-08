<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Http\Request;

class Authenticate extends Middleware
{
    // protected function redirectTo(Request $request): ?string
    // {
    //     return $request->expectsJson() ? null : route('login');
    // }
    protected function redirectTo(Request $request): ?string
    {
        if (! $request->expectsJson()) {
            return '/'; // Or any frontend login path if needed
        }

        return null; // For API requests, don't redirect
    }
}
