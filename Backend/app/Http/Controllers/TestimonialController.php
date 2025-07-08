<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Testimonial;
use App\Http\Requests\TestimonialRequest;
use App\Http\Resources\TestimonialResource;
use Illuminate\Support\Facades\Storage;

class TestimonialController extends Controller
{

    public function index()
    {
        $testimonials = Testimonial::all();

        // Append full URL to image if it exists
        $testimonials->transform(function ($testimonial) {
            if ($testimonial->image) {
                $testimonial->image = asset('storage/' . $testimonial->image);
            }
            return $testimonial;
        });

        return response()->json([
            'message' => 'Testimonials fetched successfully',
            'data' => $testimonials,
        ]);
    }
    public function store(Request $request)
    {
        $data = $request->all();

        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $filename = time() . '_' . $file->getClientOriginalName();
            $path = $file->storeAs('testimonials', $filename, 'public');
            $data['image'] = $path;
        }

        $testimonial = Testimonial::create($data);

        return response()->json([
            'message' => 'Testimonial created successfully',
            'data' => $testimonial,
        ], 201);
    }
    public function show($id)
    {
        $testimonial = Testimonial::findOrFail($id);

        // Add full image URL if it exists
        if ($testimonial->image) {
            $testimonial->image = asset('storage/' . $testimonial->image);
        }

        return response()->json([
            'message' => 'Testimonial fetched successfully',
            'data' => $testimonial,
        ]);
    }


    public function update(Request $request, $id)
    {
        $testimonial = Testimonial::findOrFail($id);
        $data = $request->all();

        if ($request->hasFile('image')) {
            // Delete old image
            if ($testimonial->image && Storage::disk('public')->exists($testimonial->image)) {
                Storage::disk('public')->delete($testimonial->image);
            }

            $file = $request->file('image');
            $filename = time() . '_' . $file->getClientOriginalName();
            $path = $file->storeAs('testimonials', $filename, 'public');
            $data['image'] = $path;
        }

        $testimonial->update($data);

        return response()->json([
            'message' => 'Testimonial updated successfully',
            'data' => $testimonial,
        ]);
    }

    // ✅ DELETE: delete testimonial
    public function destroy($id)
    {
        $testimonial = Testimonial::findOrFail($id);

        // Delete image file if exists
        if ($testimonial->image && Storage::disk('public')->exists($testimonial->image)) {
            Storage::disk('public')->delete($testimonial->image);
        }

        $testimonial->delete();

        return response()->json([
            'message' => 'Testimonial deleted successfully'
        ]);
    }
}
