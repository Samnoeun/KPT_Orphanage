<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\StaffController;
use App\Http\Controllers\API\HomeContentController;
use App\Http\Controllers\DonorController;



Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::apiResource('staff', StaffController::class);
// Route::get('/home-content', [HomeContentController::class, 'index']);
Route::apiResource('/donors', DonorController::class);

