<?php

// app/Http/Controllers/API/StaffController.php
namespace App\Http\Controllers\API;

use App\Models\Staff;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreStaffRequest;
use App\Http\Requests\UpdateStaffRequest;
use App\Http\Resources\StaffResource;

class StaffController extends Controller
{
    public function index()
    {
        return StaffResource::collection(Staff::all());
    }

    public function store(StoreStaffRequest $request)
    {
        $staff = Staff::create($request->validated());
        return new StaffResource($staff);
    }


    public function show(Staff $staff)
    {
        return new StaffResource($staff);
    }

    public function update(UpdateStaffRequest $request, Staff $staff)
    {
        $staff->update($request->validated());
        return new StaffResource($staff);
    }

    public function destroy(Staff $staff)
    {
        $staff->delete();
        return response()->json(['message' => 'Staff deleted']);
    }
}
