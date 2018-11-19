<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class StopController extends Controller
{
    public $successStatus = 200;

    /**
     * Register api
     *
     * @return \Illuminate\Http\Response
     */
    public function listing(Request $request)
    {
        $lat = $request->get('lat',0);
        $lng = $request->get('lng',0);
        $distance = 20;

        $query = \App\Stop::getByDistance($lat, $lng, $distance);


        $ids = [];

        //Extract the id's
        foreach($query as $q)
        {
            array_push($ids, $q->id);
        }

        // Get the listings that match the returned ids
        $data = \App\Stop::whereIn('id', $ids)->with(['buses','users' => function($q){
            $user_id = \Auth::user()->id;
            return $q->select('user_id')->where('user_id',$user_id);
        }])->get();


        return response()->json($data, $this->successStatus);
    }

    /**
     * Register user for stop
     *
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        $validator = \Validator::make($request->all(), [
            'user_id' => 'required',
            'stop_id' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 401);
        }

        $user_id = $request->get('user_id',0);
        $stop_id = $request->get('stop_id',0);


        $user = \App\User::find(1);
        $user->stops()->syncWithoutDetaching([$stop_id]);


        return response()->json(['status' => '1','stop_id' => $stop_id,  'message' => 'Added successfully'], $this->successStatus);
    }

}
