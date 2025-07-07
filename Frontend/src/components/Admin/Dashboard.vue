<template>
  <div class="flex min-h-screen bg-gray-100">
    <!-- Sidebar -->
    <AdminNavbar />

    <!-- Main Content -->
    <div class="ml-64 p-8 w-full">
      <h2 class="text-3xl font-bold text-gray-800 mb-6">Welcome, Admin</h2>
      
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
          to="/admin/donations" 
          class="text-blue-600 hover:text-blue-800 font-semibold transition duration-150 ease-in-out"
          active-class="text-blue-800 border-b-2 border-blue-600"
        >
          Donations
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

      <!-- Overview Cards -->
      <div v-if="loading" class="text-gray-600 text-lg text-center">Loading dashboard...</div>
      <div v-else class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
        <div class="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition duration-200 transform hover:-translate-y-1 border border-purple-200">
          <h3 class="text-lg font-semibold text-gray-700 mb-2">Total Donations</h3>
          <p class="text-3xl font-bold text-purple-600">${{ totalAmount.toFixed(2) }}</p>
        </div>
        <div class="bg-blue-50 p-6 rounded-lg shadow-md hover:shadow-lg transition duration-200 transform hover:-translate-y-1 border border-blue-200">
          <h3 class="text-lg font-semibold text-gray-700 mb-2">Total Donors</h3>
          <p class="text-3xl font-bold text-blue-600">{{ totalDonors }}</p>
        </div>
        <div class="bg-green-50 p-6 rounded-lg shadow-md hover:shadow-lg transition duration-200 transform hover:-translate-y-1 border border-green-200">
          <h3 class="text-lg font-semibold text-gray-700 mb-2">Total Staff</h3>
          <p class="text-3xl font-bold text-green-600">{{ totalStaff }}</p>
        </div>
      </div>

      <!-- Program Donations -->
      <div v-if="!loading" class="bg-gray-100 p-6 rounded-lg border border-gray-200 mb-6">
        <h3 class="text-lg font-semibold text-gray-800 mb-4">Program Donations</h3>
        <div class="space-y-2">
          <div class="flex justify-between items-center">
            <p class="text-sm font-medium text-gray-700">Education Donations</p>
            <p class="text-sm font-bold text-gray-800">${{ educationAmount.toFixed(2) }}</p>
          </div>
          <div class="flex justify-between items-center">
            <p class="text-sm font-medium text-gray-700">Healthcare Donations</p>
            <p class="text-sm font-bold text-gray-800">${{ healthcareAmount.toFixed(2) }}</p>
          </div>
          <div class="flex justify-between items-center">
            <p class="text-sm font-medium text-gray-700">Cultural Event Donations</p>
            <p class="text-sm font-bold text-gray-800">${{ culturalAmount.toFixed(2) }}</p>
          </div>
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
import AdminNavbar from '../Admin/Layout/adminNavbar.vue';

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
      educationAmount: 0,
      healthcareAmount: 0,
      culturalAmount: 0,
      loading: false,
      notification: {
        message: '',
        type: ''
      }
    };
  },
  mounted() {
    this.fetchOverview();
  },
  methods: {
    showNotification(message, type) {
      this.notification = { message, type };
      setTimeout(() => {
        this.notification = { message: '', type: '' };
      }, 3000);
    },
    async fetchOverview() {
      this.loading = true;
      try {
        const token = localStorage.getItem('token');
        if (!token) {
          console.warn('No authentication token found, using example data.');
          this.donations = [
            {
              id: 1,
              description: 'Support Education Program',
              amount: '100.00',
            },
            {
              id: 2,
              description: 'Support Healthcare Outreach',
              amount: '250.50',
            },
            {
              id: 3,
              description: 'Support Cultural Event',
              amount: '75.25',
            },
          ];
          this.calculateTotals();
          // this.showNotification('Using example data due to missing token', 'error');
        } else {
          // Fetch donations
          const donationRes = await fetch('/api/admin/donations', {
            headers: { Authorization: `Bearer ${token}` }
          });
          if (!donationRes.ok) {
            throw new Error(`Failed to fetch donations: ${donationRes.status} ${donationRes.statusText}`);
          }
          const donationJson = await donationRes.json();
          this.donations = Array.isArray(donationJson.data) ? donationJson.data : [];
          
          // Fetch staff
          const staffRes = await fetch('/api/admin/staff', {
            headers: { Authorization: `Bearer ${token}` }
          });
          if (!staffRes.ok) {
            throw new Error(`Failed to fetch staff: ${staffRes.status} ${staffRes.statusText}`);
          }
          const staffJson = await staffRes.json();
          this.totalStaff = Array.isArray(staffJson.data) ? staffJson.data.length : 0;

          this.calculateTotals();
          if (this.donations.length === 0) {
            this.showNotification('No donation data available', 'error');
          }
        }
      } catch (err) {
        console.error('Error fetching overview:', err);
        this.showNotification('Failed to load dashboard data', 'error');
        this.donations = [];
        this.totalAmount = 0;
        this.totalDonors = 0;
        this.totalStaff = 0;
        this.educationAmount = 0;
        this.healthcareAmount = 0;
        this.culturalAmount = 0;
      } finally {
        this.loading = false;
      }
    },
    calculateTotals() {
      this.totalAmount = this.donations
        .reduce((sum, d) => sum + (parseFloat(d.amount) || 0), 0);
      this.totalDonors = this.donations.length;
      this.educationAmount = this.donations
        .filter(d => d.description && d.description.toLowerCase().includes('education'))
        .reduce((sum, d) => sum + (parseFloat(d.amount) || 0), 0);
      this.healthcareAmount = this.donations
        .filter(d => d.description && d.description.toLowerCase().includes('healthcare'))
        .reduce((sum, d) => sum + (parseFloat(d.amount) || 0), 0);
      this.culturalAmount = this.donations
        .filter(d => d.description && d.description.toLowerCase().includes('cultural'))
        .reduce((sum, d) => sum + (parseFloat(d.amount) || 0), 0);
    }
  }
};
</script>