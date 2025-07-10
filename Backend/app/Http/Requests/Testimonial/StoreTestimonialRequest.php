<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TestimonialRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'name' => 'required|string',
            'program' => 'required|string',
            'year' => 'required|string',
            'short_description' => 'required|string',
            'full_testimonial' => 'required|string',
            'background' => 'required|string',
            'current_status' => 'required|string',
            'future_goals' => 'required|string',
            'image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048', // URL
        ];
    }
}
