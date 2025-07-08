<!-- StatsSection.vue -->
<template>
  <section class="py-20 bg-gradient-to-r from-orange-500 via-yellow-400 to-yellow-300">
    <div class="container mx-auto px-6">
      <h2 class="text-3xl md:text-4xl font-bold text-center text-white mb-12 drop-shadow-lg">
        Our Impact in Numbers
      </h2>
      <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-8">
        <div
          class="bg-white/10 backdrop-blur-sm rounded-2xl p-8 text-center text-white shadow-lg hover:scale-105 transition-transform duration-300 border border-white/20">
          <div class="text-5xl font-extrabold mb-2 drop-shadow">150+</div>
          <div class="text-lg font-medium opacity-90">Children Helped</div>
        </div>
        <div
          class="bg-white/10 backdrop-blur-sm rounded-2xl p-8 text-center text-white shadow-lg hover:scale-105 transition-transform duration-300 border border-white/20">
          <div class="text-5xl font-extrabold mb-2 drop-shadow">23+</div>
          <div class="text-lg font-medium opacity-90">Years of Service</div>
        </div>
        <div
          class="bg-white/10 backdrop-blur-sm rounded-2xl p-8 text-center text-white shadow-lg hover:scale-105 transition-transform duration-300 border border-white/20">
          <div class="text-5xl font-extrabold mb-2 drop-shadow">50+</div>
          <div class="text-lg font-medium opacity-90">Graduates</div>
        </div>
        <div
          class="bg-white/10 backdrop-blur-sm rounded-2xl p-8 text-center text-white shadow-lg hover:scale-105 transition-transform duration-300 border border-white/20">
          <div class="text-5xl font-extrabold mb-2 drop-shadow">100%</div>
          <div class="text-lg font-medium opacity-90">Love & Care</div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { defineProps } from 'vue'

const StatCard = {
  props: ['label', 'number'],
  template: `
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-8 text-center text-white shadow-lg hover:scale-105 transition-transform duration-300 border border-white/20">
      <div class="text-5xl font-extrabold mb-2 drop-shadow">{{ number }}</div>
      <div class="text-lg font-medium opacity-90">{{ label }}</div>
    </div>
  `
}
</script>
