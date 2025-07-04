<template>
  <div class="min-h-screen flex flex-col">
    <Navbar :links="navLinks" logo="/src/assets/image/image-removebg-preview (1).png" />
    <main class="pt-16">
      <RouterView />
    </main>
    <Footer :links="navLinks" :location="contactInfo" :socials="socialMedia" :sponsors="sponsorList" />
  </div>
</template>

<script setup>
import Footer from './components/Footer.vue'
import Navbar from './components/Navbar.vue'

const navLinks = [
  { label: 'Home', to: '/' },
  { label: 'About', to: '/about' },
  { label: 'Contact', to: '/contact' },
  { label: 'Donate', to: '/donate', icon: 'fas fa-heart' }
]

const contactInfo = {
  name: 'Kampong Thom Orphanage',
  address: '123 Main Street, Kampong Thom, Cambodia',
  phone: '+855 12 345 678',
  email: 'info@kampongthomorphanage.org'
}

const socialMedia = [
  { name: 'Facebook', icon: 'fab fa-facebook-f', url: 'https://facebook.com' },
  { name: 'Twitter', icon: 'fab fa-twitter', url: 'https://twitter.com' },
  { name: 'Instagram', icon: 'fab fa-instagram', url: 'https://instagram.com' },
  { name: 'YouTube', icon: 'fab fa-youtube', url: 'https://youtube.com' }
]

const sponsorList = [
  'Sponsor A',
  'Sponsor B',
  'Sponsor C'
]
</script>