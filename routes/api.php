<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::namespace('Api')->middleware('api')->group(function () {
    Route::get('/clients', 'ClientController@list')->name('api.client.list');
    Route::post('/clients', 'ClientController@create')->name('api.client.create');
    Route::put('/clients/{id}', 'ClientController@update')->name('api.client.update');
    Route::delete('/clients/{id}', 'ClientController@delete')->name('api.client.delete');
});

//Route::middleware('api')->post('/clients', 'Api\ClientController', 'create')->name('api.client.create');

//Route::middleware('api')->put('/clients/{id}', function (Request $request, int $id) {
//    return response()->json(["Update $id"]);
//});
//
//Route::middleware('api')->delete('/clients/{id}', function (Request $request, int $id) {
//    return response()->json(["Delete $id"]);
//});

//Route::middleware('auth:api')->get('/user', function (Request $request) {
//    return $request->user();
//});
