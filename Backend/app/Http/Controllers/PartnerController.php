<?php

// app/Http/Controllers/PartnerController.php
namespace App\Http\Controllers;

use App\Models\Partner;
use App\Http\Requests\StorePartnerRequest;
use App\Http\Requests\UpdatePartnerRequest;
use App\Http\Resources\PartnerResource;
use Illuminate\Support\Facades\Storage;

class PartnerController extends Controller
{
    public function index()
    {
        return PartnerResource::collection(Partner::latest()->get());
    }

    public function store(StorePartnerRequest $request)
    {
        $data = $request->validated();

        if ($request->hasFile('logo')) {
            $data['logo'] = $request->file('logo')->store('partners', 'public');
        }

        $partner = Partner::create($data);
        return new PartnerResource($partner);
    }

    public function update(UpdatePartnerRequest $request, Partner $partner)
    {
        $data = $request->validated();

        if ($request->hasFile('logo')) {
            if ($partner->logo) {
                Storage::disk('public')->delete($partner->logo);
            }
            $data['logo'] = $request->file('logo')->store('partners', 'public');
        }

        $partner->update($data);
        return new PartnerResource($partner);
    }

    public function destroy(Partner $partner)
    {
        if ($partner->logo) {
            Storage::disk('public')->delete($partner->logo);
        }

        $partner->delete();
        return response()->json(['message' => 'Partner deleted']);
    }
}
