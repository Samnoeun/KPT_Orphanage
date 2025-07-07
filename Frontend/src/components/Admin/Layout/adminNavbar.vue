<template>
  <nav class="fixed top-0 left-0 h-screen w-64 bg-gray-800 text-white flex flex-col p-6 shadow-2xl">
    <router-link 
      to="/admin" 
      class="text-3xl font-extrabold mb-10 tracking-tight"
    >
      Admin Panel
    </router-link>
    <div class="flex flex-col space-y-3">
      <button 
        @click="goBack" 
        class="flex items-center space-x-3 p-3 rounded-xl hover:bg-gray-700 transition duration-300 text-left"
        :disabled="!canGoBack"
        :class="{ 'opacity-50 cursor-not-allowed': !canGoBack }"
      >
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
        </svg>
        <span class="font-medium">Back</span>
      </button>
      <button 
        @click="logout" 
        class="flex items-center space-x-3 p-3 rounded-xl hover:bg-gray-700 transition duration-300 text-left"
      >
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
        </svg>
        <span class="font-medium">Back to Website</span>
      </button>
      <router-link 
        to="/admin/dashboard" 
        class="flex items-center space-x-3 p-3 rounded-xl hover:bg-gray-700 transition duration-300"
        active-class="bg-gray-700"
      >
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
        </svg>
        <span class="font-medium">Dashboard</span>
      </router-link>
      <router-link 
        to="/admin/donors" 
        class="flex items-center space-x-3 p-3 rounded-xl hover:bg-gray-700 transition duration-300"
        active-class="bg-gray-700"
      >
        <svg class="w-6 h-6" fill="none" header stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z" />
        </svg>
        <span class="font-medium">Donors</span>
      </router-link>
      <router-link 
        to="/admin/donations" 
        class="flex items-center space-x-3 p-3 rounded-xl hover:bg-gray-700 transition duration-300"
        active-class="bg-gray-700"
      >
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
        </svg>
        <span class="font-medium">Donations</span>
      </router-link>
      <router-link 
        to="/admin/staffs" 
        class="flex items-center space-x-3 p-3 rounded-xl hover:bg-gray-700 transition duration-300"
        active-class="bg-gray-700"
      >
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 005.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
        </svg>
        <span class="font-medium">Staff</span>
      </router-link>
    </div>
  </nav>
</template>

<script>
export default {
  computed: {
    navHistory() {
      return JSON.parse(localStorage.getItem('adminNavHistory') || '[]');
    },
    canGoBack() {
      return this.navHistory.length > 1 && this.navHistory.includes(this.$route.path);
    }
  },
  methods: {
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
  },
  mounted() {
    this.updateNavHistory();
  },
  beforeRouteUpdate(to, from, next) {
    this.updateNavHistory();
    next();
  }
};
</script>