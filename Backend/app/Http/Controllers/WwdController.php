<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreWwdRequest;
use App\Http\Resources\WwdResource;
use App\Models\Wwd;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class WwdController extends Controller
{
    // List all WWD records (usually one, but just in case)
    public function index()
    {
        $wwds = Wwd::all();
        return WwdResource::collection($wwds);
    }

    // Show single WWD by ID or the first one
    public function show($id = null)
    {
        if ($id) {
            $wwd = Wwd::find($id);
        } else {
            $wwd = Wwd::first();
        }

        if (!$wwd) {
            return response()->json(['message' => 'No record found'], 404);
        }
        return new WwdResource($wwd);
    }

    // Store new WWD record
    public function store(StoreWwdRequest $request)
    {
        $path = $request->file('image')->store('wwd_images', 'public');

        $wwd = Wwd::create([
            'image' => $path,
        ]);

        return new WwdResource($wwd);
    }

    // Update existing WWD record by ID
    public function update(StoreWwdRequest $request, $id)
    {
        $wwd = Wwd::findOrFail($id);

        // Delete old image if exists
        if ($wwd->image && Storage::disk('public')->exists($wwd->image)) {
            Storage::disk('public')->delete($wwd->image);
        }

        $path = $request->file('image')->store('wwd_images', 'public');
        $wwd->image = $path;
        $wwd->save();

        return new WwdResource($wwd);
    }

    // Delete WWD record by ID
    public function destroy($id)
    {
        $wwd = Wwd::findOrFail($id);

        // Delete image file if exists
        if ($wwd->image && Storage::disk('public')->exists($wwd->image)) {
            Storage::disk('public')->delete($wwd->image);
        }

        $wwd->delete();

        return response()->json(['message' => 'WWD record deleted successfully']);
    }
}
