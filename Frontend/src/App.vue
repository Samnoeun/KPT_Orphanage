<template>
  <div class="min-h-screen flex flex-col">
    <!-- Navbar hidden if admin route -->
    <Navbar
      v-if="!isAdminRoute"
      :links="navLinks"
      logo="/src/assets/image/image-removebg-preview (1).png"
    />
    <main class="pt-16">
      <RouterView />
    </main>
    <!-- Footer hidden if admin route -->
    <Footer
      v-if="!isAdminRoute"
      :links="navLinks"
      :location="contactInfo"
      :socials="socialMedia"
      :sponsors="sponsorList"
    />
  </div>
</template>

<script setup>
import { computed } from 'vue'
import { useRoute } from 'vue-router'
import Footer from './components/Footer.vue'
import Navbar from './components/Navbar.vue'

const route = useRoute()

const isAdminRoute = computed(() => route.path.startsWith('/admin'))

const navLinks = [
  { label: 'Home', to: '/' },
  { label: 'About', to: '/about' },
  { label: 'Contact', to: '/contact' },
  { label: 'Donate', to: '/donate', icon: 'fas fa-heart' }
]

const socialMedia = [
  { name: 'Facebook', icon: 'fab fa-facebook-f', url: 'https://facebook.com' },
  { name: 'Twitter', icon: 'fab fa-twitter', url: 'https://twitter.com' },
  { name: 'Instagram', icon: 'fab fa-instagram', url: 'https://instagram.com' },
  { name: 'YouTube', icon: 'fab fa-youtube', url: 'https://youtube.com' }
]

// If you use contactInfo and sponsorList, define them here, e.g.:
const contactInfo = {
  address: '123 Example St.',
  phone: '(123) 456-7890',
  email: 'info@example.com'
}

const sponsorList = [
  { name: 'Sponsor A', logo: '/sponsor-a.png', url: '#' },
  { name: 'Sponsor B', logo: '/sponsor-b.png', url: '#' }
]
</script>
