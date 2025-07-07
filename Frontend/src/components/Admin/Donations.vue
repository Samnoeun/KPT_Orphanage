<template>
  <div class="flex min-h-screen bg-gray-50">
    <!-- Sidebar -->
    <AdminNavbar />

    <!-- Main Content -->
    <div class="ml-64 p-8 w-full">
      <h1 class="text-3xl font-bold text-gray-800 mb-4">Donations</h1>
      <!-- Navigation Links -->
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
      <div v-if="loading" class="text-gray-600 text-lg">Loading donations...</div>
      <div v-else class="space-y-6">
        <!-- Total Amount Card -->
        <div v-if="donations.length > 0" class="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition duration-200 transform hover:-translate-y-1">
          <h2 class="text-lg font-semibold text-gray-700">Total Amount</h2>
          <p class="text-3xl font-bold text-green-600">${{ totalAmount }}</p>
        </div>
        <!-- Donations Table -->
        <div class="bg-white p-6 rounded-lg shadow-md">
          <div class="overflow-x-auto">
            <table class="min-w-full border border-gray-200">
              <thead class="bg-gray-100">
                <tr>
                  <th class="p-3 text-left text-sm font-semibold text-gray-700">ID</th>
                  <th class="p-3 text-left text-sm font-semibold text-gray-700">Description</th>
                  <th class="p-3 text-left text-sm font-semibold text-gray-700">Budget Amount</th>
                  <th class="p-3 text-left text-sm font-semibold text-gray-700">Action</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="donation in donations" :key="donation.id" class="border-t hover:bg-gray-50 transition duration-150">
                  <td class="p-3 text-gray-600">{{ donation.id }}</td>
                  <td class="p-3 text-gray-600">{{ donation.description || '-' }}</td>
                  <td class="p-3 text-gray-600">${{ parseFloat(donation.amount || 0).toFixed(2) }}</td>
                  <td class="p-3 space-x-2">
                    <button
                      @click="viewDonation(donation)"
                      class="bg-blue-500 text-white px-3 py-1 rounded hover:bg-blue-600 transition duration-150"
                    >
                      View Details
                    </button>
                    <button
                      @click="deleteDonation(donation)"
                      class="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600 transition duration-150"
                    >
                      Delete
                    </button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div v-if="!loading && donations.length === 0" class="text-gray-600 mt-4 text-center">
            No donations found.
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import AdminNavbar from '../Admin/Layout/adminNavbar.vue';

export default {
  name: 'Donations',
  components: {
    AdminNavbar
  },
  data() {
    return {
      donations: [],
      loading: true
    };
  },
  computed: {
    totalAmount() {
      return this.donations
        .reduce((sum, d) => sum + parseFloat(d.amount || 0), 0)
        .toFixed(2);
    }
  },
  mounted() {
    this.fetchDonations();
  },
  methods: {
    exampleDonations() {
      return [
        { id: 1, description: "Education Program", amount: "150.00" },
        { id: 2, description: "Health Initiative", amount: "200.00" },
        { id: 3, description: "Community Outreach", amount: "75.50" }
      ];
    },
    async fetchDonations() {
      this.loading = true;
      try {
        const token = localStorage.getItem('token');
        if (!token) throw new Error('No authentication token found');
        const res = await fetch('/api/admin/donations', {
          headers: { Authorization: `Bearer ${token}` }
        });
        if (!res.ok) throw new Error('Failed to fetch donations');
        const json = await res.json();
        this.donations = json.data || [];
      } catch (err) {
        console.error('Error fetching donations:', err);
        this.donations = this.exampleDonations();
      } finally {
        this.loading = false;
      }
    },
    viewDonation(donation) {
      this.$router.push(`/admin/donations/${donation.id}`);
    },
    async deleteDonation(donation) {
      if (!confirm(`Are you sure you want to delete donation #${donation.id}?`)) return;
      try {
        const token = localStorage.getItem('token');
        if (!token) throw new Error('No authentication token found');
        const res = await fetch(`/api/admin/donations/${donation.id}`, {
          method: 'DELETE',
          headers: { Authorization: `Bearer ${token}` }
        });
        if (!res.ok) throw new Error('Failed to delete donation');
        this.fetchDonations();
      } catch (err) {
        console.error('Error deleting donation:', err);
      }
    }
  }
};
</script>