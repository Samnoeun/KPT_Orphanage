<template>
  <div class="space-x-2">
    <button
      @click="backToWebsite"
      class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition duration-150"
    >
      Back to Website
    </button>
    <button
      @click="logout"
      class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 transition duration-150"
    >
      Logout
    </button>
  </div>
</template>

<script>
export default {
  name: "LogoutButton",
  methods: {
    backToWebsite() {
      alert("You are still logged in as Admin. To log out, click the Logout button.");
      // or use confirm:
      const confirmed = confirm("You are still logged in as Admin. Are you sure you want to go back?");
      if (confirmed) {
        this.$router.push('/');
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
