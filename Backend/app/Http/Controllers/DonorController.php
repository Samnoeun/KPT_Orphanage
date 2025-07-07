<?php

namespace App\Http\Controllers;

use App\Models\Donor;
use Illuminate\Http\Request;
use App\Http\Resources\DonorResource;

class DonorController extends Controller
{
    public function index()
    {
        // Return all donors as a collection
        return DonorResource::collection(Donor::all());
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email',
            'bankName' => 'required|string|max:255',
            'amount' => 'required|numeric|min:0',
            'description' => 'nullable|string',
        ]);

        $donor = Donor::create($validated);

        return response()->json([
            'message' => 'Thank you so much for supporting us. Good luck all the time!',
            'data' => new DonorResource($donor),
        ], 201);
    }

    public function show(Donor $donor)
    {
        return new DonorResource($donor);
    }

    public function update(Request $request, Donor $donor)
    {
        $validated = $request->validate([
            'name' => 'sometimes|required|string|max:255',
            'email' => 'sometimes|required|email',
            'bankName' => 'sometimes|required|string|max:255',
            'amount' => 'sometimes|required|numeric|min:0',
            'description' => 'nullable|string',
        ]);

        $donor->update($validated);

        return response()->json([
            'message' => 'Donor updated successfully.',
            'data' => new DonorResource($donor),
        ]);
    }

    public function destroy(Donor $donor)
    {
        $donor->delete();

        return response()->json([
            'message' => 'Donor deleted successfully.',
        ]);
    }
}
