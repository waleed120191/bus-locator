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
        $data = \App\Stop::whereIn('id', $ids)->with('buses')->get();


        return response()->json($data, $this->successStatus);
    }
}
