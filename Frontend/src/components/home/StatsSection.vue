<template>
  <section class="py-20 bg-gradient-to-r from-orange-500 via-yellow-400 to-yellow-300">
    <div class="container mx-auto px-6">
      <h2 class="text-3xl md:text-4xl font-bold text-center text-white mb-12 drop-shadow-lg">
        Our Impact in Numbers
      </h2>
      <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-8">
        <div
          v-for="stat in stats"
          :key="stat.id"
          class="bg-white/10 backdrop-blur-sm rounded-2xl p-8 text-center text-white shadow-lg hover:scale-105 transition-transform duration-300 border border-white/20"
        >
          <div class="text-5xl font-extrabold mb-2 drop-shadow">{{ stat.label }}</div>
          <div class="text-lg font-medium opacity-90">{{ stat.value }}</div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const stats = ref([])

onMounted(async () => {
  try {
    const response = await axios.get('http://localhost:8000/api/impacts') // adjust URL as needed
    stats.value = response.data.data
  } catch (error) {
    console.error('Failed to fetch impact stats:', error)
  }
})
</script>
