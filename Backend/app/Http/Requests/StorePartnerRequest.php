<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StorePartnerRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'logo' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
            'link' => 'nullable|url',
        ];
    }
}
