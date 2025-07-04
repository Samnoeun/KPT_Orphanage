<?php

namespace App\Http\Controllers;

use App\Models\HomeContent;
use Illuminate\Http\Request;
use App\Http\Resources\HomeContentResource;

class HomeContentController extends Controller
{



    public function index()
    {
        return HomeContentResource::collection(HomeContent::all());
    }




    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(HomeContent $homeContent)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(HomeContent $homeContent)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, HomeContent $homeContent)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(HomeContent $homeContent)
    {
        //
    }
}
