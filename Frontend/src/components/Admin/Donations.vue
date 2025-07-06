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
                    <!-- <button
                      @click="editDonation(donation)"
                      class="bg-yellow-500 text-white px-3 py-1 rounded hover:bg-yellow-600 transition duration-150"
                    >
                      Edit
                    </button> -->
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
export default {
  name: 'Donations',
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
    },
    navHistory() {
      return JSON.parse(localStorage.getItem('adminNavHistory') || '[]');
    },
    canGoBack() {
      return this.navHistory.length > 1 && this.navHistory.includes(this.$route.path);
    }
  },
  mounted() {
    this.fetchDonations();
    this.updateNavHistory();
  },
  beforeRouteUpdate(to, from, next) {
    this.updateNavHistory();
    next();
  },
  methods: {
    // Added example fallback
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
        // Use example data
        this.donations = this.exampleDonations();
      } finally {
        this.loading = false;
      }
    },
    viewDonation(donation) {
      this.$router.push(`/admin/donations/${donation.id}`);
    },
    editDonation(donation) {
      this.$router.push(`/admin/donations/${donation.id}/edit`);
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
      this.$router.push('/');
    }
  }
};
</script>
