<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RestaurantController;

Route::get('/restaurants', [RestaurantController::class, 'index']);
Route::get('/restaurants/{id}/trends', [RestaurantController::class, 'restaurantTrends']);
Route::get('/restaurants/top/revenue', [RestaurantController::class, 'topByRevenue']);
Route::get('/orders/filter', [RestaurantController::class, 'filter']);

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
