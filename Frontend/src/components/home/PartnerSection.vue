<template>
  <section class="py-20 px-4 bg-white">
    <div class="container mx-auto max-w-7xl">
      <div class="text-center mb-16">
        <div
          class="inline-flex items-center gap-2 bg-orange-100 text-orange-600 px-4 py-2 rounded-full font-semibold mb-4">
          <svg class="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
              d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
          </svg>
          What we do
        </div>
        <h2 class="text-4xl md:text-5xl font-bold text-gray-900 mb-6">Our Partners</h2>
        <p class="text-xl text-gray-600 max-w-3xl mx-auto">
          Whether through companies, corporate or individual foundations, NGOs, or institutions,
          Kompong Thom Orphanage is supported by numerous partners worldwide.
        </p>
      </div>

      <!-- Running Partners Marquee -->
      <div class="relative overflow-hidden">
        <div class="flex animate-scroll">
          <div v-for="(partner, index) in duplicatedPartners" :key="`${partner.id}-${index}`"
            class="flex-shrink-0 mx-4 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300 p-6 w-48 h-32 flex items-center justify-center">
            <img :src="partner.logo" :alt="partner.name"
              class="max-w-full max-h-full object-contain transition-all duration-300" />
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
import axios from 'axios'

const partners = ref([])

onMounted(async () => {
  try {
    const response = await axios.get('http://127.0.0.1:8000/api/partners')
    partners.value = response.data.data
  } catch (error) {
    console.error('Failed to fetch partners:', error)
  }
})

const duplicatedPartners = computed(() => [...partners.value, ...partners.value])
</script>

<style scoped>
@keyframes scroll {
  0% {
    transform: translateX(0);
  }

  100% {
    transform: translateX(-50%);
  }
}

.animate-scroll {
  animation: scroll 25s linear infinite;
}

.animate-scroll:hover {
  animation-play-state: paused;
}
</style>
