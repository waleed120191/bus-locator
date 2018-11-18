<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

// OAuth2 - Implicit grant - Request for token from Auth server.
Route::get('/redirect', function (Request $request) {

    $input  = $request->all();

    $query = http_build_query([
        'client_id' => isset($input['client_id'])?$input['client_id']:"",
        'redirect_uri' =>  isset($input['redirect_uri'])?$input['redirect_uri']:"",
        'response_type' =>  isset($input['response_type'])?$input['response_type']:"",
        'scope' =>  isset($input['scope'])?$input['scope']:"",
    ]);

    return redirect(url('/oauth/authorize?'.$query));
});
