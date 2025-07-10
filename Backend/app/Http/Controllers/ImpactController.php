<?php

namespace App\Http\Controllers;

use App\Models\Impact;
use App\Http\Requests\StoreImpactRequest;
use App\Http\Requests\UpdateImpactRequest;
use App\Http\Resources\ImpactResource;
use Illuminate\Http\Request;

class ImpactController extends Controller
{
    public function index()
    {
        return response()->json(['data' => Impact::all()]);
    }


    public function store(StoreImpactRequest $request)
    {
        $impact = Impact::create($request->validated());
        return new ImpactResource($impact);
    }

    public function show(Impact $impact)
    {
        return new ImpactResource($impact);
    }

    public function update(UpdateImpactRequest $request, Impact $impact)
    {
        $impact->update($request->validated());
        return new ImpactResource($impact);
    }


    public function destroy(Impact $impact)
    {
        $impact->delete();
        return response()->json(['message' => 'Impact deleted successfully']);
    }
}
