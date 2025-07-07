<template>
  <div class="flex min-h-screen bg-gray-100">
    <!-- Sidebar -->
    <AdminNavbar />

    <!-- Main Content -->
    <div class="ml-64 p-8 w-full">
      <h1 class="text-3xl font-bold text-gray-800 mb-6">Donor Records</h1>

      <!-- Navigation Links -->
      <div class="mb-6 flex space-x-6 border-b pb-4">
        <router-link
          to="/admin/dashboard"
          class="text-blue-600 hover:text-blue-800 font-semibold transition duration-150 ease-in-out"
          active-class="text-blue-800 border-b-2 border-blue-600"
        >
          Dashboard
        </router-link>
        <router-link
          to="/admin/donors"
          class="text-blue-600 hover:text-blue-800 font-semibold transition duration-150 ease-in-out"
          active-class="text-blue-800 border-b-2 border-blue-600"
        >
          Donors
        </router-link>
        <router-link
          to="/admin/staffs"
          class="text-blue-600 hover:text-blue-800 font-semibold transition duration-150 ease-in-out"
          active-class="text-blue-800 border-b-2 border-blue-600"
        >
          Staff
        </router-link>
      </div>

      <!-- Notification -->
      <div
        v-if="notification.message"
        :class="notification.type === 'success' ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'"
        class="p-4 mb-6 rounded-lg flex items-center space-x-3 shadow-sm"
      >
        <svg v-if="notification.type === 'success'" class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
        </svg>
        <svg v-else class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
        </svg>
        <span class="font-medium">{{ notification.message }}</span>
      </div>

      <div v-if="loading" class="text-gray-600 text-lg text-center">Loading donors...</div>
      <div v-else class="space-y-6">
        <!-- Stats Cards -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
          <div
            class="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition duration-200 transform hover:-translate-y-1"
          >
            <h3 class="text-lg font-semibold text-gray-700 mb-2">Total Donors</h3>
            <p class="text-3xl font-bold text-green-600">{{ totalDonors }}</p>
          </div>
          <div
            class="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition duration-200 transform hover:-translate-y-1"
          >
            <h3 class="text-lg font-semibold text-gray-700 mb-2">Total Amount</h3>
            <p class="text-3xl font-bold text-blue-600">${{ totalAmount.toFixed(2) }}</p>
          </div>
        </div>

        <!-- Donors Table -->
        <div class="bg-white p-6 rounded-lg shadow-md">
          <div class="overflow-x-auto">
            <table class="min-w-full border border-gray-200 divide-y divide-gray-200">
              <thead class="bg-gray-50">
                <tr>
                  <th class="p-4 text-left text-sm font-semibold text-gray-700">ID</th>
                  <th class="p-4 text-left text-sm font-semibold text-gray-700">Profile</th>
                  <th class="p-4 text-left text-sm font-semibold text-gray-700">Name</th>
                  <th class="p-4 text-left text-sm font-semibold text-gray-700">Email</th>
                  <th class="p-4 text-left text-sm font-semibold text-gray-700">Description</th>
                  <th class="p-4 text-left text-sm font-semibold text-gray-700">Amount</th>
                  <th class="p-4 text-left text-sm font-semibold text-gray-700">Date</th>
                  <th class="p-4 text-left text-sm font-semibold text-gray-700">Actions</th>
                </tr>
              </thead>
              <tbody class="divide-y divide-gray-200">
                <tr
                  v-for="donor in donors"
                  :key="donor.id"
                  class="hover:bg-gray-50 transition duration-150"
                >
                  <td class="p-4 text-gray-600">{{ donor.id }}</td>
                  <td class="p-4 text-gray-600">
                    <img
                      :src="donor.profile_image || 'https://via.placeholder.com/40'"
                      alt="Profile"
                      class="w-10 h-10 rounded-full object-cover"
                    />
                  </td>
                  <td class="p-4 text-gray-600">{{ donor.name }}</td>
                  <td class="p-4 text-gray-600">{{ donor.email }}</td>
                  <td class="p-4 text-gray-600 max-w-xs truncate">{{ donor.description || '-' }}</td>
                  <td class="p-4 text-gray-600">${{ parseFloat(donor.amount || 0).toFixed(2) }}</td>
                  <td class="p-4 text-gray-600">{{ formatDate(donor.created_at) }}</td>
                  <td class="p-4 text-gray-600 flex space-x-2">
                    <router-link
                      :to="`/admin/donors/${donor.id}`"
                      class="text-blue-600 hover:text-blue-800 font-medium"
                    >
                      View
                    </router-link>
                    <button
                      @click="deleteDonor(donor.id)"
                      class="text-red-600 hover:text-red-800 font-medium"
                    >
                      Delete
                    </button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div v-if="!loading && donors.length === 0" class="text-gray-600 mt-4 text-center">
            No donors found.
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import AdminNavbar from '../Admin/Layout/adminNavbar.vue';

export default {
  name: 'Donors',
  components: {
    AdminNavbar,
  },
  data() {
    return {
      donors: [],
      loading: false,
      notification: {
        message: '',
        type: '',
      },
    };
  },
  computed: {
    totalDonors() {
      return this.donors.length;
    },
    totalAmount() {
      return this.donors.reduce((sum, donor) => sum + parseFloat(donor.amount || 0), 0);
    },
  },
  mounted() {
    this.fetchDonors();
  },
  methods: {
    showNotification(message, type) {
      this.notification = { message, type };
      setTimeout(() => {
        this.notification = { message: '', type: '' };
      }, 3000);
    },
    async fetchDonors() {
      this.loading = true;
      try {
        const token = localStorage.getItem('token');
        if (!token) {
          console.warn('No authentication token found, using example donors.');
          this.donors = [
            {
              id: 1,
              name: 'Alice Example',
              email: 'alice@example.com',
              description: 'Support Education Program',
              profile_image: 'https://via.placeholder.com/40',
              amount: '100.00',
              created_at: '2025-07-01T10:00:00Z',
            },
            {
              id: 2,
              name: 'Bob Sample',
              email: 'bob@example.com',
              description: 'Support Healthcare Outreach',
              profile_image: 'https://via.placeholder.com/40',
              amount: '250.50',
              created_at: '2025-07-02T14:30:00Z',
            },
            {
              id: 3,
              name: 'Charlie Demo',
              email: 'charlie@example.com',
              description: 'Suport Cultural Event',
              profile_image: 'https://via.placeholder.com/40',
              amount: '75.25',
              created_at: '2025-07-03T09:15:00Z',
            },
          ];
        } else {
          const res = await fetch('/api/admin/donors', {
            headers: { Authorization: `Bearer ${token}` },
          });
          if (!res.ok) {
            throw new Error(`Failed to fetch donors: ${res.status} ${res.statusText}`);
          }
          const json = await res.json();
          this.donors = json.data || [];
          if (this.donors.length === 0) {
            this.showNotification('No donor data available', 'error');
          }
        }
      } catch (err) {
        console.error('Error fetching donors:', err);
        this.showNotification('Failed to load donor data', 'error');
        this.donors = [];
      } finally {
        this.loading = false;
      }
    },
    async deleteDonor(id) {
      if (!confirm('Are you sure you want to delete this donor?')) return;
      try {
        const token = localStorage.getItem('token');
        if (!token) {
          this.donors = this.donors.filter((donor) => donor.id !== id);
          this.showNotification('Donor deleted (local data)', 'success');
          return;
        }
        const res = await fetch(`/api/admin/donors/${id}`, {
          method: 'DELETE',
          headers: { Authorization: `Bearer ${token}` },
        });
        if (!res.ok) {
          throw new Error(`Failed to delete donor: ${res.status} ${res.statusText}`);
        }
        this.donors = this.donors.filter((donor) => donor.id !== id);
        this.showNotification('Donor deleted successfully', 'success');
      } catch (err) {
        console.error('Error deleting donor:', err);
        this.showNotification('Failed to delete donor', 'error');
      }
    },
    formatDate(dateStr) {
      if (!dateStr) return '-';
      const date = new Date(dateStr);
      return date.toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' });
    },
  },
};
</script>