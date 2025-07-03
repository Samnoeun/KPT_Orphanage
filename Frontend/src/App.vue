<script setup>
import { RouterLink, RouterView } from 'vue-router'
</script>

<template>
  <div class="min-h-screen bg-gray-100 text-gray-800">
    <nav class="bg-white shadow px-6 py-4 flex gap-4">
      <RouterLink to="/" class="text-blue-600 hover:underline">Home</RouterLink>
      <RouterLink to="/about" class="text-blue-600 hover:underline">About</RouterLink>
      <RouterLink to="/contact" class="text-blue-600 hover:underline">Contact</RouterLink>
      <RouterLink to="/donate" class="text-blue-600 hover:underline">Donate</RouterLink>
      <RouterLink to="/admin" class="text-red-600 hover:underline">Admin</RouterLink>
    </nav>

    <main class="p-6">
      <RouterView />
    </main>
  </div>
</template>
