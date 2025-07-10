<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const testimonials = ref([])
const selectedTestimonial = ref(null)

const openTestimonial = (testimonial) => {
  selectedTestimonial.value = testimonial
}

const closeTestimonial = () => {
  selectedTestimonial.value = null
}

onMounted(async () => {
  try {
    const response = await axios.get('http://127.0.0.1:8000/api/testimonials')
    testimonials.value = response.data.data
  } catch (error) {
    console.error('Error fetching testimonials:', error)
  }
})
</script>

<template>
  <section class="py-20 px-4 bg-white">
    <div class="container mx-auto max-w-7xl">
      <!-- Header -->
      <div class="text-center mb-16">
        <div
          class="inline-flex items-center gap-2 bg-orange-100 text-orange-600 px-4 py-2 rounded-full font-semibold mb-4">
          <svg class="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
              d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.38-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z" />
          </svg>
          What we do
        </div>
        <h2 class="text-4xl md:text-5xl font-bold text-gray-900 mb-6">Our Testimonies</h2>
        <p class="text-xl text-gray-600 max-w-3xl mx-auto">
          Discover students' testimonies from our 4 centers!
        </p>
      </div>

      <!-- Testimonials Grid -->
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <div
          v-for="testimonial in testimonials"
          :key="testimonial.id"
          class="bg-white rounded-2xl shadow-lg overflow-hidden cursor-pointer transform transition-all duration-300 hover:scale-105 hover:shadow-xl"
          @click="openTestimonial(testimonial)"
        >
          <div class="relative">
            <div class="w-32 h-32 mx-auto mt-6 rounded-full overflow-hidden bg-orange-100">
              <img :src="testimonial.image" :alt="testimonial.name" class="w-full h-full object-cover" />
            </div>
            <div class="absolute bottom-0 left-1/2 transform -translate-x-1/2 translate-y-1/2">
              <div class="bg-blue-400 text-white px-4 py-1 rounded-full text-sm font-semibold">
                {{ testimonial.name }}
              </div>
            </div>
          </div>
          <div class="p-6 pt-8">
            <div class="flex items-start gap-2 mb-3">
              <svg class="h-6 w-6 text-gray-400 flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 24 24">
                <path
                  d="M14.017 21v-7.391c0-5.704 3.731-9.57 8.983-10.609l.995 2.151c-2.432.917-3.995 3.638-3.995 5.849h4v10h-9.983zm-14.017 0v-7.391c0-5.704 3.748-9.57 9-10.609l.996 2.151c-2.433.917-3.996 3.638-3.996 5.849h4v10h-10z" />
              </svg>
              <p class="text-gray-600 text-sm line-clamp-3">
                {{ testimonial.short_description }}
              </p>
            </div>
            <div class="flex justify-between items-center">
              <span class="text-xs text-gray-500">{{ testimonial.program }}</span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Popup Modal -->
    <transition name="fade">
      <div
        v-if="selectedTestimonial"
        class="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm"
        @click.self="closeTestimonial"
      >
        <div class="bg-white rounded-xl shadow-2xl max-w-xl w-full p-6 relative animate-fade-in-up" @click.stop>
          <h3 class="text-2xl font-bold text-orange-600 mb-4 text-center">
            {{ selectedTestimonial.name }}
          </h3>
          <p class="text-gray-500 text-center mb-1">{{ selectedTestimonial.program }} • {{ selectedTestimonial.year }}</p>

          <div class="w-32 h-32 mx-auto mb-4 rounded-full overflow-hidden bg-orange-100">
            <img :src="selectedTestimonial.image" class="w-full h-full object-cover" />
          </div>

          <div class="text-gray-700 space-y-4">
            <div>
              <p class="italic text-lg">"{{ selectedTestimonial.full_testimonial }}"</p>
            </div>
            <div>
              <h4 class="font-semibold text-gray-900">Background</h4>
              <p>{{ selectedTestimonial.background }}</p>
            </div>
            <div>
              <h4 class="font-semibold text-gray-900">Current Status</h4>
              <p>{{ selectedTestimonial.current_status }}</p>
            </div>
            <div>
              <h4 class="font-semibold text-gray-900">Future Goals</h4>
              <p>{{ selectedTestimonial.future_goals }}</p>
            </div>
          </div>

          <!-- Optional close button -->
          <button
            @click="closeTestimonial"
            class="absolute top-4 right-4 bg-gray-100 hover:bg-gray-200 rounded-full p-2 transition"
          >
            <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>
      </div>
    </transition>
  </section>
</template>

<style scoped>
.line-clamp-3 {
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

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
  animation: fade-in-up 0.4s ease-out;
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
