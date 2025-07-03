<template>
  <div class="relative h-screen w-full">
    <!-- Background Image -->
    <img
      src="../assets/images/orphanage.jpg"
      alt="Orphanage"
      class="absolute inset-0 w-full h-full object-cover"
    />

    <!-- Overlay Content -->
    <div class="absolute inset-0 bg-black bg-opacity-40 flex flex-col justify-center items-center text-center px-4">
      <h1 class="text-4xl md:text-5xl font-bold text-white mb-6">
        Welcome to Kompong Thom Orphanage
      </h1>

      <RouterLink
        to="/about"
        class="bg-yellow-400 hover:bg-yellow-500 text-black font-semibold px-6 py-3 rounded transition"
      >
        About Us
      </RouterLink>
    </div>
  </div>
</template>

<script setup>
import { RouterLink } from 'vue-router'
</script>
