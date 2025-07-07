<template>
  <div class="flex min-h-screen bg-gray-50">
    <!-- Sidebar -->
    <AdminNavbar />

    <!-- Main Content -->
    <div class="ml-64 p-8 w-full">
      <h2 class="text-3xl font-bold text-gray-800 mb-4">Staff Management</h2>
      
      <!-- Quick Links -->
      <div class="mb-6 flex space-x-4">
        <router-link 
          to="/admin/dashboard" 
          class="text-blue-600 hover:text-blue-800 font-semibold transition duration-150"
          active-class="text-blue-800 underline"
        >
          Dashboard
        </router-link>
        <router-link 
          to="/admin/donors" 
          class="text-blue-600 hover:text-blue-800 font-semibold transition duration-150"
          active-class="text-blue-800 underline"
        >
          Donors
        </router-link>
        <router-link 
          to="/admin/donations" 
          class="text-blue-600 hover:text-blue-800 font-semibold transition duration-150"
          active-class="text-blue-800 underline"
        >
          Donations
        </router-link>
        <router-link 
          to="/admin/staffs" 
          class="text-blue-600 hover:text-blue-800 font-semibold transition duration-150"
          active-class="text-blue-800 underline"
        >
          Staff
        </router-link>
      </div>

      <!-- Total Staff Card -->
      <div class="mb-6 flex justify-between items-center">
        <div v-if="staffList.length > 0" class="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition duration-200 transform hover:-translate-y-1">
          <h3 class="text-lg font-semibold text-gray-700 mb-2">Total Staff</h3>
          <p class="text-3xl font-bold text-green-600">{{ totalStaff }}</p>
        </div>
        <button 
          @click="openAddModal"
          class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition duration-200 flex items-center space-x-2"
        >
          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
          </svg>
          <span>Add New Staff</span>
        </button>
      </div>

      <!-- Staff Table -->
      <div class="bg-white shadow-md rounded-lg overflow-hidden">
        <table class="min-w-full divide-y divide-gray-200">
          <thead class="bg-gray-50">
            <tr>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Position</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Created At</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Updated At</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
            </tr>
          </thead>
          <tbody class="bg-white divide-y divide-gray-200">
            <tr v-for="staff in staffList" :key="staff.id">
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ staff.id }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ staff.name }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ staff.email }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ staff.position }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ formatDate(staff.created_at) }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ formatDate(staff.updated_at) }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                <button 
                  @click="openEditModal(staff)"
                  class="text-blue-600 hover:text-blue-800 mr-4"
                >
                  Edit
                </button>
                <button 
                  @click="deleteStaff(staff.id)"
                  class="text-red-600 hover:text-red-800"
                >
                  Delete
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- Add/Edit Staff Modal -->
      <div v-if="showModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 flex items-center justify-center z-50">
        <div class="bg-white p-8 rounded-xl shadow-2xl w-full max-w-lg">
          <h3 class="text-2xl font-bold text-gray-800 mb-6">{{ isEditing ? 'Edit Staff Member' : 'Add New Staff Member' }}</h3>
          
          <!-- Notification -->
          <div v-if="notification.message" 
               :class="notification.type === 'success' ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'"
               class="p-4 mb-6 rounded-lg flex items-center space-x-2">
            <svg v-if="notification.type === 'success'" class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
            </svg>
            <svg v-else class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
            <span>{{ notification.message }}</span>
          </div>

          <!-- Form -->
          <div class="space-y-6">
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
              <input 
                v-model="form.name"
                type="text" 
                placeholder="Enter full name"
                class="block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-200 focus:ring-opacity-50 py-2 px-3"
                :class="{ 'border-red-500': errors.name }"
                @input="clearError('name')"
                required
              >
              <p v-if="errors.name" class="text-red-500 text-sm mt-1">{{ errors.name }}</p>
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
              <input 
                v-model="form.email"
                type="email" 
                placeholder="Enter email address"
                class="block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-200 focus:ring-opacity-50 py-2 px-3"
                :class="{ 'border-red-500': errors.email }"
                @input="clearError('email')"
                required
              >
              <p v-if="errors.email" class="text-red-500 text-sm mt-1">{{ errors.email }}</p>
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Position</label>
              <select 
                v-model="form.position"
                class="block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-200 focus:ring-opacity-50 py-2 px-3"
                :class="{ 'border-red-500': errors.position }"
                @change="clearError('position')"
                required
              >
                <option value="" disabled>Select a position</option>
                <option value="Administrator">Administrator</option>
                <option value="Manager">Manager</option>
                <option value="Chemistry Teacher">Chemistry Teacher</option>
                <option value="English Teacher">English Teacher</option>
                <option value="Khmer Teacher">Khmer Teacher</option>
                <option value="Other">Other</option>
              </select>
              <p v-if="errors.position" class="text-red-500 text-sm mt-1">{{ errors.position }}</p>
            </div>
          </div>

          <!-- Form Actions -->
          <div class="mt-8 flex justify-end space-x-3">
            <button 
              @click="showModal = false"
              class="px-4 py-2 bg-gray-200 text-gray-800 rounded-lg hover:bg-gray-300 transition duration-200"
              :disabled="formSubmitting"
            >
              Cancel
            </button>
            <button 
              @click="isEditing ? updateStaff() : addStaff()"
              class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition duration-200 flex items-center space-x-2"
              :disabled="formSubmitting"
            >
              <svg v-if="formSubmitting" class="animate-spin w-5 h-5" fill="none" viewBox="0 0 24 24">
                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
              </svg>
              <span>{{ isEditing ? 'Update' : 'Add' }}</span>
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import AdminNavbar from '../Admin/Layout/adminNavbar.vue';

export default {
  components: {
    AdminNavbar
  },
  data() {
    return {
      staffList: [],
      showModal: false,
      isEditing: false,
      form: {
        id: null,
        name: '',
        email: '',
        position: ''
      },
      errors: {
        name: '',
        email: '',
        position: ''
      },
      notification: {
        message: '',
        type: ''
      },
      formSubmitting: false,
      loading: false
    };
  },
  computed: {
    totalStaff() {
      return this.staffList.length;
    }
  },
  mounted() {
    this.fetchStaff();
  },
  methods: {
    async fetchStaff() {
      this.loading = true;
      try {
        const token = localStorage.getItem('token');
        if (!token) throw new Error('No authentication token found');
        const res = await fetch('/api/admin/staff', {
          headers: { Authorization: `Bearer ${token}` }
        });
        if (!res.ok) throw new Error('Failed to fetch staff');
        const json = await res.json();
        this.staffList = json.data || [];
      } catch (err) {
        console.error('Error fetching staff:', err);
        this.showNotification('Failed to load staff data', 'error');
      } finally {
        this.loading = false;
      }
    },
    openAddModal() {
      this.isEditing = false;
      this.form = { id: null, name: '', email: '', position: '' };
      this.errors = { name: '', email: '', position: '' };
      this.notification = { message: '', type: '' };
      this.showModal = true;
    },
    openEditModal(staff) {
      this.isEditing = true;
      this.form = { ...staff };
      this.errors = { name: '', email: '', position: '' };
      this.notification = { message: '', type: '' };
      this.showModal = true;
    },
    validateForm() {
      this.errors = { name: '', email: '', position: '' };
      let isValid = true;

      if (!this.form.name.trim()) {
        this.errors.name = 'Name is required';
        isValid = false;
      } else if (this.form.name.length > 255) {
        this.errors.name = 'Name must be 255 characters or less';
        isValid = false;
      }

      if (!this.form.email.trim()) {
        this.errors.email = 'Email is required';
        isValid = false;
      } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(this.form.email)) {
        this.errors.email = 'Invalid email format';
        isValid = false;
      }

      if (!this.form.position) {
        this.errors.position = 'Position is required';
        isValid = false;
      }

      return isValid;
    },
    clearError(field) {
      this.errors[field] = '';
    },
    showNotification(message, type) {
      this.notification = { message, type };
      setTimeout(() => {
        this.notification = { message: '', type: '' };
      }, 3000);
    },
    async addStaff() {
      if (!this.validateForm()) return;

      this.formSubmitting = true;
      try {
        const token = localStorage.getItem('token');
        if (!token) throw new Error('No authentication token found');
        const res = await fetch('/api/admin/staff', {
          method: 'POST',
          headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(this.form)
        });
        if (!res.ok) throw new Error('Failed to add staff');
        this.showModal = false;
        this.showNotification('Staff member added successfully', 'success');
        this.fetchStaff();
      } catch (err) {
        console.error('Error adding staff:', err);
        this.showNotification('Failed to add staff member', 'error');
      } finally {
        this.formSubmitting = false;
      }
    },
    async updateStaff() {
      if (!this.validateForm()) return;

      this.formSubmitting = true;
      try {
        const token = localStorage.getItem('token');
        if (!token) throw new Error('No authentication token found');
        const res = await fetch(`/api/admin/staff/${this.form.id}`, {
          method: 'PUT',
          headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(this.form)
        });
        if (!res.ok) throw new Error('Failed to update staff');
        this.showModal = false;
        this.showNotification('Staff member updated successfully', 'success');
        this.fetchStaff();
      } catch (err) {
        console.error('Error updating staff:', err);
        this.showNotification('Failed to update staff member', 'error');
      } finally {
        this.formSubmitting = false;
      }
    },
    async deleteStaff(id) {
      if (!confirm('Are you sure you want to delete this staff member?')) return;
      try {
        const token = localStorage.getItem('token');
        if (!token) throw new Error('No authentication token found');
        const res = await fetch(`/api/admin/staff/${id}`, {
          method: 'DELETE',
          headers: { Authorization: `Bearer ${token}` }
        });
        if (!res.ok) throw new Error('Failed to delete staff');
        this.showNotification('Staff member deleted successfully', 'success');
        this.fetchStaff();
      } catch (err) {
        console.error('Error deleting staff:', err);
        this.showNotification('Failed to delete staff member', 'error');
      }
    },
    formatDate(date) {
      return new Date(date).toLocaleDateString('en-US', {
        year: 'numeric',
        month: 'short',
        day: 'numeric'
      });
    }
  }
};
</script>