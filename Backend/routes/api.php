<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\StaffController;
use App\Http\Controllers\ItemController;
use App\Http\Controllers\BannerController;
use App\Http\Controllers\DonorController;
use App\Http\Controllers\TestimonialController;
use PHPUnit\Event\Code\Test;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::apiResource('students', StudentController::class);
Route::apiResource('staff', StaffController::class);
Route::apiResource('items', ItemController::class);
Route::apiResource('banners', BannerController::class);
Route::apiResource('testimonials', TestimonialController::class);
Route::apiResource('donors', DonorController::class);

