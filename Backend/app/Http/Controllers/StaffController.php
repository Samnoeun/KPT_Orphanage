<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Storage;
use App\Http\Requests\StoreStaffRequest;
use App\Http\Requests\UpdateStaffRequest;
use App\Http\Resources\StaffResource;
use App\Models\Staff;

class StaffController extends Controller
{
    public function index()
    {
        return StaffResource::collection(Staff::all());
    }

    public function store(StoreStaffRequest $request)
    {
        $data = $request->validated();

        if ($request->hasFile('profile')) {
            $data['profile'] = $request->file('profile')->store('profiles', 'public');
        }

        $staff = Staff::create($data);

        return new StaffResource($staff);
    }

    public function show(Staff $staff)
    {
        return new StaffResource($staff);
    }

    public function update(UpdateStaffRequest $request, Staff $staff)
    {
        $data = $request->validated();

        if ($request->hasFile('profile')) {
            // Delete old image
            if ($staff->profile && Storage::disk('public')->exists($staff->profile)) {
                Storage::disk('public')->delete($staff->profile);
            }

            $data['profile'] = $request->file('profile')->store('profiles', 'public');
        }

        $staff->update($data);

        return new StaffResource($staff);
    }

    public function destroy(Staff $staff)
    {
        if ($staff->profile && Storage::disk('public')->exists($staff->profile)) {
            Storage::disk('public')->delete($staff->profile);
        }

        $staff->delete();

        return response()->json(['message' => 'Staff deleted successfully']);
    }
}
