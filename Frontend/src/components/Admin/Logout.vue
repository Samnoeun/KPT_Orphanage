<template>
  <button
    @click="logout"
    class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 transition duration-150"
  >
    Logout
  </button>
</template>

<script>
export default {
  name: "LogoutButton",
  methods: {
    logout() {
      localStorage.removeItem('token');
      localStorage.removeItem('adminNavHistory');
      this.$router.push('/');
    }
  }
};
</script>
