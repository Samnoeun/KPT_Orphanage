<template>
  <div class="flex min-h-screen bg-gray-50">
    <!-- Sidebar -->
    <nav class="fixed top-0 left-0 h-screen w-64 bg-gray-900 text-white flex flex-col p-6 shadow-lg">
        <router-link 
            to="/admin" 
            class="text-2xl font-bold mb-8"
            >
            Admin Panel
        </router-link>

      <div class="flex flex-col space-y-4">
        <button 
          @click="goBack" 
          class="flex items-center space-x-2 p-2 rounded-lg hover:bg-gray-700 transition duration-200 text-left"
          :disabled="!canGoBack"
          :class="{ 'opacity-50 cursor-not-allowed': !canGoBack }"
        >
          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
          </svg>
          <span>Back</span>
        </button>
        <button 
          @click="logout" 
          class="flex items-center space-x-2 p-2 rounded-lg hover:bg-gray-700 transition duration-200 text-left"
        >
          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
          </svg>
          <span>Back to Website</span>
        </button>
        <router-link 
          to="/admin/dashboard" 
          class="flex items-center space-x-2 p-2 rounded-lg hover:bg-gray-700 transition duration-200"
          active-class="bg-gray-700"
        >
          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
          </svg>
          <span>Dashboard</span>
        </router-link>
        <router-link 
          to="/admin/donors" 
          class="flex items-center space-x-2 p-2 rounded-lg hover:bg-gray-700 transition duration-200"
          active-class="bg-gray-700"
        >
          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z" />
          </svg>
          <span>Donors</span>
        </router-link>
        <router-link 
          to="/admin/donations" 
          class="flex items-center space-x-2 p-2 rounded-lg hover:bg-gray-700 transition duration-200"
          active-class="bg-gray-700"
        >
          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
          <span>Donations</span>
        </router-link>
      </div>
    </nav>

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
      </div>

      <!-- Overview Cards -->
      <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <div class="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition duration-200 transform hover:-translate-y-1">
          <h3 class="text-lg font-semibold text-gray-700">Total Donations</h3>
          <p class="text-3xl font-bold text-green-600">${{ totalAmount }}</p>
        </div>
        <div class="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition duration-200 transform hover:-translate-y-1">
          <h3 class="text-lg font-semibold text-gray-700">Total Donors</h3>
          <p class="text-3xl font-bold text-blue-600">{{ totalDonors }}</p>
        </div>
        <div class="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition duration-200 transform hover:-translate-y-1">
          <h3 class="text-lg font-semibold text-gray-700">Pending Verifications</h3>
          <p class="text-3xl font-bold text-yellow-600">{{ pendingVerifications }}</p>
        </div>
      </div>

      <!-- Quick Links -->
      <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
        <router-link 
          to="/admin/donations" 
          class="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition duration-200 transform hover:-translate-y-1"
        >
          <h4 class="text-lg font-semibold text-gray-700 mb-2">Manage Donations</h4>
          <p class="text-gray-600">View, verify, and delete donation records.</p>
        </router-link>
        <router-link 
          to="/admin/donors" 
          class="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition duration-200 transform hover:-translate-y-1"
        >
          <h4 class="text-lg font-semibold text-gray-700 mb-2">View Donors</h4>
          <p class="text-gray-600">Browse donor details and export data.</p>
        </router-link>
        <router-link 
          to="/admin/settings" 
          class="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition duration-200 transform hover:-translate-y-1"
        >
          <h4 class="text-lg font-semibold text-gray-700 mb-2">System Settings</h4>
          <p class="text-gray-600">Configure site preferences and security.</p>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      donations: [],
      totalAmount: 0,
      totalDonors: 0,
      pendingVerifications: 0
    };
  },
  computed: {
    navHistory() {
      return JSON.parse(localStorage.getItem('adminNavHistory') || '[]');
    },
    canGoBack() {
      return this.navHistory.length > 1 && this.navHistory.includes(this.$route.path);
    }
  },
  mounted() {
    this.fetchOverview();
    this.updateNavHistory();
  },
  beforeRouteUpdate(to, from, next) {
    this.updateNavHistory();
    next();
  },
  methods: {
    async fetchOverview() {
      try {
        const token = localStorage.getItem('token');
        if (!token) throw new Error('No authentication token found');
        const res = await fetch('/api/admin/donations', {
          headers: { Authorization: `Bearer ${token}` }
        });
        if (!res.ok) throw new Error('Failed to fetch donations');
        const json = await res.json();
        this.donations = json.data || [];
        this.totalAmount = this.donations
          .reduce((sum, d) => sum + parseFloat(d.amount || 0), 0)
          .toFixed(2);
        this.totalDonors = this.donations.length;
        this.pendingVerifications = this.donations.filter(d => d.status === 'pending').length;
      } catch (err) {
        console.error('Error fetching overview:', err);
      }
    },
    updateNavHistory() {
      const currentPath = this.$route.path;
      let history = JSON.parse(localStorage.getItem('adminNavHistory') || '[]');
      if (currentPath.startsWith('/admin') && history[history.length - 1] !== currentPath) {
        history.push(currentPath);
        if (history.length > 10) {
          history.shift();
        }
        localStorage.setItem('adminNavHistory', JSON.stringify(history));
      }
    },
    goBack() {
      if (this.canGoBack) {
        let history = JSON.parse(localStorage.getItem('adminNavHistory') || '[]');
        history.pop();
        const previousRoute = history[history.length - 1] || '/admin/dashboard';
        localStorage.setItem('adminNavHistory', JSON.stringify(history));
        this.$router.push(previousRoute);
      }
    },
    logout() {
      localStorage.removeItem('token');
      localStorage.removeItem('adminNavHistory');
      this.$router.push("/");
    }
  }
};
</script>