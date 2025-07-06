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
      <h1 class="text-3xl font-bold text-gray-800 mb-4">Donor Records</h1>
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
      <div v-if="loading" class="text-gray-600 text-lg">Loading donors...</div>
      <div v-else class="bg-white p-6 rounded-lg shadow-md">
        <div class="overflow-x-auto">
          <table class="min-w-full border border-gray-200">
            <thead class="bg-gray-100">
              <tr>
                <th class="p-3 text-left text-sm font-semibold text-gray-700">Name</th>
                <th class="p-3 text-left text-sm font-semibold text-gray-700">Email</th>
                <th class="p-3 text-left text-sm font-semibold text-gray-700">Bank</th>
                <th class="p-3 text-left text-sm font-semibold text-gray-700">Amount</th>
                <th class="p-3 text-left text-sm font-semibold text-gray-700">Date</th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="donor in donors"
                :key="donor.id"
                class="border-t hover:bg-gray-50 transition duration-150"
              >
                <td class="p-3 text-gray-600">{{ donor.name }}</td>
                <td class="p-3 text-gray-600">{{ donor.email }}</td>
                <td class="p-3 text-gray-600">{{ donor.bank_name }}</td>
                <td class="p-3 text-gray-600">${{ parseFloat(donor.amount || 0).toFixed(2) }}</td>
                <td class="p-3 text-gray-600">{{ formatDate(donor.created_at) }}</td>
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
</template>

<script>
export default {
  name: 'Donors',
  data() {
    return {
      donors: [],
      loading: true
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
    this.fetchDonors();
    this.updateNavHistory();
  },
  beforeRouteUpdate(to, from, next) {
    this.updateNavHistory();
    next();
  },
  methods: {
    async fetchDonors() {
      this.loading = true;
      try {
        const token = localStorage.getItem('token');
        if (!token) {
          // Example donors if no token
          console.warn('No authentication token found, using example donors.');
          this.donors = [
            {
              id: 1,
              name: 'Alice Example',
              email: 'alice@example.com',
              bank_name: 'Example Bank',
              amount: '100.00',
              created_at: '2025-07-01T10:00:00Z'
            },
            {
              id: 2,
              name: 'Bob Sample',
              email: 'bob@example.com',
              bank_name: 'Sample Credit Union',
              amount: '250.50',
              created_at: '2025-07-02T14:30:00Z'
            },
            {
              id: 3,
              name: 'Charlie Demo',
              email: 'charlie@example.com',
              bank_name: 'Demo Savings',
              amount: '75.25',
              created_at: '2025-07-03T09:15:00Z'
            }
          ];
        } else {
          const res = await fetch('/api/admin/donors', {
            headers: { Authorization: `Bearer ${token}` }
          });
          if (!res.ok) throw new Error('Failed to fetch donors');
          const json = await res.json();
          this.donors = json.data || [];
        }
      } catch (err) {
        console.error('Error fetching donors:', err);
      } finally {
        this.loading = false;
      }
    },
    formatDate(dateStr) {
      if (!dateStr) return '-';
      const date = new Date(dateStr);
      return date.toLocaleDateString(undefined, { year: 'numeric', month: 'short', day: 'numeric' });
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
