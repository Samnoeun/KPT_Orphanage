<template>
  <div class="min-h-screen flex items-center justify-center bg-orange-300 relative overflow-hidden">
    <div class="absolute w-full h-full">
      <div class="absolute w-64 h-64 bg-orange-500 rounded-full -top-20 -left-20 opacity-50"></div>
      <div class="absolute w-48 h-48 bg-orange-400 rounded-full -bottom-16 -right-16 opacity-50"></div>
    </div>
    <div class="bg-white bg-opacity-90 p-20 rounded-lg shadow-lg w-full max-w-lg z-10">
      <div class="flex justify-between mb-6">
        <a href="/" class="text-gray-500 hover:text-gray-700 text-4xl">←</a>


      </div>
      <div class="flex justify-center mb-6">
        <div class="w-20 h-20 bg-white rounded-full flex items-center justify-center">
          <img src="https://cdn-icons-png.flaticon.com/512/1946/1946429.png" alt="User Icon" class="w-12 h-12">
        </div>
      </div>
      <h2 class="text-2xl font-semibold text-center mb-6">Welcome Back!</h2>
      <form @submit.prevent="login" class="space-y-5">
        <input v-model="username" type="text" placeholder="Username" class="w-full p-3 border border-gray-300 rounded" required />
        <input v-model="password" type="password" placeholder="Password" class="w-full p-3 border border-gray-300 rounded" required />
        <button type="submit" class="w-full bg-black text-white p-3 rounded-full hover:bg-gray-800">Sign In</button>
      </form>
      <p class="text-center text-sm mt-4 text-blue-500">Don't have an account? <a href="#" class="underline">Sign up now</a></p>
      <p v-if="error" class="text-red-500 text-center mt-2">{{ error }}</p>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: '',
      password: '',
      error: ''
    };
  },
  methods: {
    async login() {
      try {
        const response = await fetch('/api/login', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ username: this.username, password: this.password })
        });
        if (!response.ok) throw new Error('Invalid login');
        const data = await response.json();
        localStorage.setItem('token', data.token);
        this.$router.push('/admin/dashboard');
      } catch (err) {
        this.error = err.message;
      }
    }
  }
};
</script>

<style scoped>
/* Additional styling can be added here if needed */
</style>
