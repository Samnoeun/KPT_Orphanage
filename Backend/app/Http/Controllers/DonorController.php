<?php

namespace App\Http\Controllers;

use App\Models\Donor;
use Illuminate\Http\Request;

class DonorController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // Get all donors
        $donors = Donor::all();
        return response()->json($donors);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // Validate input
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email',
            'bankName' => 'required|string|max:255',
            'amount' => 'required|numeric|min:0',
            'description' => 'nullable|string',
        ]);

        // Create donor
        $donor = Donor::create($validated);

        return response()->json([
            'message' => 'Thank you so much for supporting me,good luck all the time',
            'data' => $donor,
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Donor $donor)
    {
        return response()->json($donor);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Donor $donor)
    {
        // Validate input
        $validated = $request->validate([
            'name' => 'sometimes|required|string|max:255',
            'email' => 'sometimes|required|email',
            'bankName' => 'sometimes|required|string|max:255',
            'amount' => 'sometimes|required|numeric|min:0',
            'description' => 'nullable|string',
        ]);

        // Update donor
        $donor->update($validated);

        return response()->json([
            'message' => 'Donor updated successfully.',
            'data' => $donor,
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Donor $donor)
    {
        $donor->delete();

        return response()->json([
            'message' => 'Donor deleted successfully.',
        ]);
    }
}
