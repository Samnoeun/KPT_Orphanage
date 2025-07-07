<template>
  <div class="flex min-h-screen bg-gray-50">
    <!-- Sidebar -->
    <AdminNavbar />

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
        <router-link 
          to="/admin/staffs" 
          class="text-blue-600 hover:text-blue-800 font-semibold transition duration-150"
          active-class="text-blue-800 underline"
        >
          Staff
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
import AdminNavbar from '../Admin/Layout/adminNavbar.vue';

export default {
  name: 'Donors',
  components: {
    AdminNavbar
  },
  data() {
    return {
      donors: [],
      loading: true
    };
  },
  mounted() {
    this.fetchDonors();
  },
  methods: {
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
    }
  }
};
</script>