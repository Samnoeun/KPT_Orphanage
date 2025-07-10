<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BannerController;
use App\Http\Controllers\DonorController;
use App\Http\Controllers\PartnerController;
use App\Http\Controllers\TestimonialController;
use App\Http\Controllers\ImpactController;
use App\Http\Controllers\CtaSectionController;
use App\Http\Controllers\WwdController;
use App\Models\Wwd; 
use PHPUnit\Event\Code\Test;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResource('banners', BannerController::class);
Route::apiResource('testimonials', TestimonialController::class);
Route::apiResource('partners', PartnerController::class);
Route::apiResource('cta-sections', CtaSectionController::class);
Route::apiResource('impacts', ImpactController::class);
Route::apiResource('wwds', WwdController::class);
Route::apiResource('donors', DonorController::class);

