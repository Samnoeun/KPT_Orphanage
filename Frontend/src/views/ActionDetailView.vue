<!-- ProgramDetailView.vue -->
<template>
  <section class="py-20 bg-gradient-to-br from-gray-50 via-white to-gray-100 text-gray-800">
    <ActionCard />
  </section>
</template>

<script setup>
import { computed, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { Icon } from '@iconify/vue'
import ActionCard from '@/components/ActionCard.vue'

const route = useRoute()
const router = useRouter()
const topic = route.params.topic

const data = {
  education: {
    title: 'Education Program',
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
    title: 'Healthcare Outreach',
    description: 'Here’s what we provide to improve community health:',
    subjects: [
      { name: 'Checkups', description: 'Routine checkups and screenings for all ages.', icon: 'mdi:stethoscope' },
      { name: 'Vaccinations', description: 'Essential vaccines and immunization awareness.', icon: 'mdi:syringe' },
      { name: 'First Aid Training', description: 'Basic emergency response for families.', icon: 'mdi:medical-bag' },
      { name: 'Nutrition Programs', description: 'Promoting healthy eating and habits.', icon: 'mdi:food-apple-outline' }
    ]
  },
  cultural: {
    title: 'Cultural Event',
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

async function goToSubjectDetail(subjectName) {
  await router.push({ name: 'ActionDetail', params: { subject: subjectName.toLowerCase() } })
}

onMounted(() => {
  window.scrollTo({ top: 0, behavior: 'smooth' })
})
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
