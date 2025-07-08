<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class TestimonialResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'program' => $this->program,
            'year' => $this->year,
            'short_description' => $this->shortDescription,
            'full_testimonial' => $this->fullTestimonial,
            'background' => $this->background,
            'current_status' => $this->currentStatus,
            'future_goals' => $this->futureGoals,
            'image' => $this->image
                ? Storage::url($this->image)
                : null,
        ];
    
    }
}
