<template>
  <div class="flex min-h-screen bg-gray-50">
    <!-- Sidebar -->
    <AdminNavbar />

    <!-- Main Content -->
    <div class="ml-64 p-8 w-full">
      <h2 class="text-3xl font-bold text-gray-800 mb-4">Welcome, Admin</h2>
      
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

      <!-- Overview Cards -->
      <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
        <div class="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition duration-200">
          <h3 class="text-lg font-semibold text-gray-700 mb-2">Total Donations</h3>
          <p class="text-3xl font-bold text-purple-600">${{ totalAmount }}</p>
        </div>
        <div class="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition duration-200">
          <h3 class="text-lg font-semibold text-gray-700 mb-2">Total Donors</h3>
          <p class="text-3xl font-bold text-purple-600">{{ totalDonors }}</p>
        </div>
        <div class="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition duration-200">
          <h3 class="text-lg font-semibold text-gray-700 mb-2">Total Staff</h3>
          <p class="text-3xl font-bold text-purple-600">{{ totalStaff }}</p>
        </div>
      </div>

      <!-- Quick Links -->
      <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
        <router-link 
          to="/admin/donations" 
          class="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition duration-200 flex items-start space-x-4"
        >
          <svg class="w-8 h-8 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
          <div>
            <h4 class="text-lg font-semibold text-gray-700 mb-2">Manage Donations</h4>
            <p class="text-gray-600 text-sm">View, verify, and delete donation records.</p>
          </div>
        </router-link>
        <router-link 
          to="/admin/donors" 
          class="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition duration-200 flex items-start space-x-4"
        >
          <svg class="w-8 h-8 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z" />
          </svg>
          <div>
            <h4 class="text-lg font-semibold text-gray-700 mb-2">View Donors</h4>
            <p class="text-gray-600 text-sm">Browse donor details and export data.</p>
          </div>
        </router-link>
        <router-link 
          to="/admin/staffs" 
          class="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition duration-200 flex items-start space-x-4"
        >
          <svg class="w-8 h-8 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 005.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
          </svg>
          <div>
            <h4 class="text-lg font-semibold text-gray-700 mb-2">Manage Staff</h4>
            <p class="text-gray-600 text-sm">Add, edit, or delete staff members.</p>
          </div>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
import AdminNavbar from '../components/Admin/Layout/adminNavbar.vue';

export default {
  components: {
    AdminNavbar
  },
  data() {
    return {
      donations: [],
      totalAmount: 0,
      totalDonors: 0,
      totalStaff: 0,
      loading: false
    };
  },
  mounted() {
    this.fetchOverview();
  },
  methods: {
    async fetchOverview() {
      this.loading = true;
      try {
        const token = localStorage.getItem('token');
        if (!token) throw new Error('No authentication token found');
        
        // Fetch donations
        const donationRes = await fetch('/api/admin/donations', {
          headers: { Authorization: `Bearer ${token}` }
        });
        if (!donationRes.ok) throw new Error('Failed to fetch donations');
        const donationJson = await donationRes.json();
        this.donations = donationJson.data || [];
        this.totalAmount = this.donations
          .reduce((sum, d) => sum + parseFloat(d.amount || 0), 0)
          .toFixed(2);
        this.totalDonors = this.donations.length;

        // Fetch staff
        const staffRes = await fetch('/api/admin/staff', {
          headers: { Authorization: `Bearer ${token}` }
        });
        if (!staffRes.ok) throw new Error('Failed to fetch staff');
        const staffJson = await staffRes.json();
        this.totalStaff = staffJson.data ? staffJson.data.length : 0;
      } catch (err) {
        console.error('Error fetching overview:', err);
      } finally {
        this.loading = false;
      }
    }
  }
};
</script>