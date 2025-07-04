<template>
  <section class="py-20 bg-gradient-to-br from-gray-50 via-white to-gray-100 text-gray-800">
    <div class="container mx-auto px-6 lg:px-12 max-w-6xl">
      <div class="text-center mb-12">
        <h1 class="text-4xl md:text-5xl font-extrabold text-blue-700 mb-4 animate-fadeInSoft">
          {{ programData.title }}
        </h1>
        <p class="text-lg md:text-xl text-gray-600 max-w-3xl mx-auto animate-fadeInSoft delay-150">
          {{ programData.description }}
        </p>
      </div>

      <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-8">
        <div
          v-for="subject in programData.subjects"
          :key="subject.name"
          class="group bg-white rounded-2xl shadow-md hover:shadow-xl p-6 transition-all duration-300 transform hover:-translate-y-1 animate-fadeInSoft delay-300 cursor-pointer"
          @click="goToSubjectDetail(subject.name)"
        >
          <div class="flex items-center justify-center w-14 h-14 bg-orange-100 text-orange-500 rounded-full mb-4 shadow">
            <Icon :icon="subject.icon" class="w-6 h-6" />
          </div>
          <h3 class="text-xl font-semibold text-gray-800 mb-2">{{ subject.name }}</h3>
          <p class="text-gray-600">{{ subject.description }}</p>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { Icon } from '@iconify/vue'

const route = useRoute()
const router = useRouter()
const topic = route.params.topic

const data = {
  education: {
    title: 'Education Program Details',
    description: 'Subjects we provide for a brighter future:',
    subjects: [
      { name: 'Math', description: 'Learn to solve problems and think logically.', icon: 'mdi:calculator' },
      { name: 'English', description: 'Improve communication and language skills.', icon: 'mdi:book-open-page-variant' },
      { name: 'Physics', description: 'Explore motion, forces, and the laws of nature.', icon: 'mdi:atom' },
      { name: 'Chemistry', description: 'Discover substances and their interactions.', icon: 'mdi:flask-outline' },
      { name: 'Biology', description: 'Understand life from cells to ecosystems.', icon: 'mdi:dna' },
      { name: 'Khmer', description: 'Preserve and develop Khmer literacy and culture.', icon: 'mdi:translate' },
      { name: 'Computer', description: 'Learn computer skills and digital literacy for the future.', icon: 'mdi:monitor' }
    ]
  },
  healthcare: {
    title: 'Healthcare Outreach Details',
    description: 'Here’s what we provide to improve community health:',
    subjects: [
      { name: 'Checkups', description: 'Routine checkups and screenings for all ages.', icon: 'mdi:stethoscope' },
      { name: 'Vaccinations', description: 'Essential vaccines and immunization awareness.', icon: 'mdi:syringe' },
      { name: 'First Aid Training', description: 'Basic emergency response for families.', icon: 'mdi:medical-bag' },
      { name: 'Nutrition Programs', description: 'Promoting healthy eating and habits.', icon: 'mdi:food-apple-outline' }
    ]
  },
  cultural: {
    title: 'Cultural Event Details',
    description: 'Programs that celebrate and preserve our traditions:',
    subjects: [
      { name: 'Traditional Dance', description: 'Learn and perform classical Khmer dances.', icon: 'mdi:gesture-tap' },
      { name: 'Folk Music', description: 'Enjoy and participate in cultural music.', icon: 'mdi:music-note' },
      { name: 'Festivals', description: 'Celebrate Khmer New Year and other events.', icon: 'mdi:party-popper' },
      { name: 'Art Workshops', description: 'Crafts, costumes, and heritage art classes.', icon: 'mdi:palette' }
    ]
  }
}

const programData = computed(() => data[topic] || {
  title: 'Program Not Found',
  description: 'Sorry, we couldn’t find that program.',
  subjects: []
})

function goToSubjectDetail(subjectName) {
  // Example: navigate to route named 'ActionDetail' with subject param
  router.push({ name: 'ActionDetail', params: { subject: subjectName.toLowerCase() } })
}
</script>

<style scoped>
@keyframes fadeInSoft {
  from {
    opacity: 0;
    transform: translateY(10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
.animate-fadeInSoft {
  animation: fadeInSoft 0.5s ease-out both;
}
.delay-150 {
  animation-delay: 0.15s;
}
.delay-300 {
  animation-delay: 0.3s;
}
</style>
