<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Stop extends Model
{
    /**
     * The roles that belong to the user.
     */
    public function buses()
    {
        return $this->belongsToMany('App\Bus')->withPivot('arrival_time');
    }

    public static function getByDistance($lat, $lng, $distance)
    {
        $results = \DB::select(\DB::raw('SELECT id, ( 3959 * acos( cos( radians(' . $lat . ') ) * cos( radians( lat ) ) * cos( radians( lng ) - radians(' . $lng . ') ) + sin( radians(' . $lat .') ) * sin( radians(lat) ) ) ) AS distance FROM stops HAVING distance < ' . $distance . ' ORDER BY distance') );

        return $results;
    }
}
