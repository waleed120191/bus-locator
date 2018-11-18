<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard where we make our SPA start
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        return view('home')->with('userid', \Auth::user()->id);
    }
}
