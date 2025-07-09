<?php

namespace App\Http\Controllers;

use App\Models\CtaSection;
use App\Http\Requests\StoreCtaSectionRequest;
use App\Http\Requests\UpdateCtaSectionRequest;
use App\Http\Resources\CtaSectionResource;

class CtaSectionController extends Controller
{
    public function index()
    {
        return CtaSectionResource::collection(CtaSection::latest()->get());
    }

    public function store(StoreCtaSectionRequest $request)
    {
        $data = $request->validated();

        if ($request->hasFile('image')) {
            $data['image'] = $request->file('image')->store('cta_sections', 'public');
        }

        $cta = CtaSection::create($data);

        return new CtaSectionResource($cta);
    }

    public function update(UpdateCtaSectionRequest $request, CtaSection $ctaSection)
    {
        $data = $request->validated();

        if ($request->hasFile('image')) {
            $data['image'] = $request->file('image')->store('cta_sections', 'public');
        }

        $ctaSection->update($data);

        return new CtaSectionResource($ctaSection);
    }

    public function destroy(CtaSection $ctaSection)
    {
        $ctaSection->delete();

        return response()->json(['message' => 'Deleted']);
    }
}
