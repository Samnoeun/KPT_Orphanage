<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateStudentRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true; // Allow all for now, customize if needed
    }

    public function rules(): array
    {
        // Get the student ID from route for unique email ignore
        $studentId = $this->route('student')->id;

        return [
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:students,email,' . $studentId,
            'description' => 'nullable|string',
        ];
    }
}
