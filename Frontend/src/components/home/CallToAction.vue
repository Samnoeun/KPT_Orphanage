<template>
  <section class="relative py-20 overflow-hidden" v-if="cta">
    <div class="absolute inset-0">
      <img :src="cta.image" alt="Group photo" class="w-full h-full object-cover" />
      <div class="absolute inset-0 bg-gradient-to-r from-black/70 via-black/50 to-black/70"></div>
    </div>

    <div class="relative z-10 container mx-auto px-4 text-center">
      <div class="max-w-4xl mx-auto">
        <h2 class="text-4xl md:text-5xl font-bold text-white mb-6">Ready to Make a Difference?</h2>
        <p class="text-xl text-gray-200 mb-8 max-w-2xl mx-auto">
          Join us in our mission to provide hope, education, and care to children in need. Every contribution makes
          a lasting impact.
        </p>

        <div class="flex flex-col sm:flex-row gap-6 justify-center">
          <RouterLink to="/contact"
            class="inline-flex items-center justify-center bg-orange-500 hover:bg-orange-600 text-white font-semibold text-lg px-8 py-4 rounded-full transition-all duration-300 transform hover:scale-105">
            <svg class="mr-2 h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
            </svg>
            Get in Touch
          </RouterLink>
          <RouterLink to="/donate"
            class="inline-flex items-center justify-center border-2 border-white text-white hover:bg-white hover:text-black font-semibold text-lg px-8 py-4 rounded-full transition-all duration-300 bg-transparent">
            <svg class="mr-2 h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            Donate Now
          </RouterLink>
        </div>
      </div>
    </div>
  </section>
</template>
<script setup>
import { ref, onMounted } from 'vue'
import { RouterLink } from 'vue-router'
import axios from 'axios'

const cta = ref(null)

onMounted(async () => {
  try {
    const response = await axios.get('http://127.0.0.1:8000/api/cta-sections')
    cta.value = response.data.data[0] // get the first record
  } catch (error) {
    console.error('Failed to fetch CTA section:', error)
  }
})
</script>
