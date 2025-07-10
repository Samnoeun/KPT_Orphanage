<template>
  <section class="py-20 px-4 bg-white">
    <div class="container mx-auto max-w-6xl">
      <!-- Section Header -->
      <div class="text-center mb-16">
        <div class="inline-flex items-center gap-2 bg-orange-100 text-orange-600 px-4 py-2 rounded-full font-semibold mb-4">
          <svg class="h-4 w-4" fill="currentColor" viewBox="0 0 24 24">
            <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z" />
          </svg>
          KPT Orphanage History
        </div>
        <h2 class="text-4xl md:text-5xl font-bold text-gray-900 mb-6">Our Journey</h2>
        <p class="text-xl text-gray-600 leading-relaxed max-w-4xl mx-auto">
          Tap on a year to explore key moments in our orphanage's history.
        </p>
      </div>

      <!-- Year Circles -->
      <div class="flex flex-wrap justify-center gap-6">
        <div
          v-for="item in history"
          :key="item.year"
          @click="openModal(item)"
          class="w-24 h-24 flex items-center justify-center rounded-full bg-orange-100 text-orange-700 font-bold text-lg shadow-md hover:shadow-xl hover:bg-orange-200 transition-all duration-300 cursor-pointer border-2 border-orange-200 hover:border-orange-400 transform hover:scale-105"
        >
          {{ item.year }}
        </div>
      </div>
    </div>

    <!-- Click-to-Close Modal -->
    <transition name="fade">
      <div
        v-if="selectedItem"
        @click.self="selectedItem = null"
        class="fixed inset-0 z-50 flex items-center justify-center bg-black/50 backdrop-blur-sm"
      >
        <div
          class="bg-white rounded-xl shadow-2xl max-w-xl w-full p-6 relative animate-fade-in-up"
          @click.stop
        >
          <h3 class="text-2xl font-semibold text-orange-600 mb-3 text-center">
            {{ selectedItem.year }}
          </h3>
          <p class="text-gray-700 text-base text-center">{{ selectedItem.detail }}</p>
        </div>
      </div>
    </transition>
  </section>
</template>

<script setup>
import { ref } from 'vue'

const selectedItem = ref(null)

const openModal = (item) => {
  selectedItem.value = item
}

const history = [
  { year: '2002', detail: 'The orphanage started. It was created to help children who lost their parents or came from poor families. The place was called Shelter of Love Center.' },
  { year: '2003', detail: 'They built the center on a big land (24 acres). There were three houses for the children to live in, a kitchen, bathrooms, and solar power for electricity.' },
  { year: '2005', detail: 'Some children started finishing high school. The orphanage helped them continue to college. This showed the center was doing a great job.' },
  { year: '2013', detail: 'About 57 children were living there. The children were happy and did fun activities like Christmas plays and learning together.' },
  { year: '2018', detail: 'Many children passed the national exam. 146 students were able to go to university. The orphanage gave them hope and a better future.' },
  { year: '2020–2025', detail: 'Some children who lived at the center are now adults. They are working as engineers, teachers, accountants, and some even studied in other countries.' },
]
</script>

<style scoped>
@keyframes fade-in-up {
  from {
    opacity: 0;
    transform: translateY(40px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
.animate-fade-in-up {
  animation: fade-in-up 0.3s ease-out;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
