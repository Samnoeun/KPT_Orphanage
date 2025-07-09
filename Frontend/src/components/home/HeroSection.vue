<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'
import { RouterLink } from 'vue-router'
import fallbackImage from '@/assets/images/orphanage.jpg' // ✅ Add this

const banner = ref({})

onMounted(async () => {
  try {
    const response = await axios.get('http://127.0.0.1:8000/api/banners')
    if (response.data.data.length > 0) {
      banner.value = response.data.data[0]
    }
  } catch (error) {
    console.error('Failed to fetch banner:', error)
  }
})
</script>

<template>
  <section class="relative h-screen flex items-center justify-center overflow-hidden">
    <div class="absolute inset-0 z-0">
      <!-- <img :src="banner.image || require('@/assets/images/orphanage.jpg')" alt="Orphanage"
        class="w-full h-full object-cover" /> -->
      <img :src="banner.image || fallbackImage" alt="Orphanage" class="w-full h-full object-cover" />

      <div class="absolute inset-0 bg-gradient-to-r from-black/60 via-black/40 to-black/60"></div>
    </div>

    <div class="relative z-10 text-center px-4 max-w-4xl mx-auto">
      <div class="animate-fade-in-up">
        <h1 class="text-5xl md:text-7xl font-bold text-white mb-6 leading-tight">
          {{ banner.title || 'Welcome to' }}
          <span class="block text-yellow-400 mt-2">Kompong Thom Orphanage</span>
        </h1>
        <p class="text-xl md:text-2xl text-gray-200 mb-8 max-w-2xl mx-auto">
          {{ banner.description || 'A sanctuary of hope, education, and endless possibilities for children in need' }}
        </p>

        <div class="flex flex-col sm:flex-row gap-4 justify-center">
          <RouterLink to="/about"
            class="inline-flex items-center justify-center bg-yellow-400 hover:bg-yellow-500 text-black font-semibold text-lg px-8 py-4 rounded-full transition-all duration-300 transform hover:scale-105">
            Discover Our Story
            <svg class="ml-2 h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
            </svg>
          </RouterLink>

          <RouterLink to="/donate"
            class="inline-flex items-center justify-center border-2 border-white text-white hover:bg-white hover:text-black font-semibold text-lg px-8 py-4 rounded-full transition-all duration-300 bg-transparent">
            Make a Difference
            <svg class="ml-2 h-5 w-5" fill="currentColor" viewBox="0 0 24 24">
              <path
                d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z" />
            </svg>
          </RouterLink>
        </div>
      </div>
    </div>

    <!-- Scroll indicator -->
    <div class="absolute bottom-8 left-1/2 transform -translate-x-1/2 animate-bounce">
      <div class="w-6 h-10 border-2 border-white rounded-full flex justify-center">
        <div class="w-1 h-3 bg-white rounded-full mt-2 animate-pulse"></div>
      </div>
    </div>
  </section>
</template>
