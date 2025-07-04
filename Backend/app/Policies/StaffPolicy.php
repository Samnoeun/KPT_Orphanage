<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Staff;

class StaffPolicy
{
    public function viewAny(User $user)
    {
        return true;
    }

    public function view(User $user, Staff $staff)
    {
        return true;
    }

    public function create(User $user)
    {
        return true;
    }

    public function update(User $user, Staff $staff)
    {
        return true;
    }

    public function delete(User $user, Staff $staff)
    {
        return true;
    }
}
