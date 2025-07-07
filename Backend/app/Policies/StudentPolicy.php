<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Student;

class StudentPolicy
{
    public function viewAny(User $user)
    {
        return true;
    }

    public function view(User $user, Student $student)
    {
        return true;
    }

    public function create(User $user)
    {
        return true;
    }

    public function update(User $user, Student $student)
    {
        return true;
    }

    public function delete(User $user, Student $student)
    {
        return true;
    }
}
