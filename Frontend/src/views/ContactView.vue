<template>
  <div class="min-h-screen bg-gray-50 py-12">
    <div class="container mx-auto px-4 max-w-7xl">
      <!-- Header Section Without Animation -->
      <div class="text-center mb-12">
        <div class="mb-8">
          <h1 class="text-5xl font-bold text-gray-800 mb-4">
            Contact Us
          </h1>
          <p class="text-gray-600 max-w-2xl mx-auto leading-relaxed">
            Get in touch with us for any inquiries about our orphanage programs and how you can help make a difference.
          </p>
        </div>
      </div>

      <!-- Contact & Newsletter Section -->
      <div class="grid lg:grid-cols-3 gap-8 mb-16">
        <!-- Contact Form -->
        <div class="lg:col-span-2">
          <form @submit.prevent="submitContactForm" class="space-y-6">
            <div class="grid md:grid-cols-2 gap-6">
              <input v-model="contactForm.email" type="email" placeholder="Email" class="w-full px-4 py-4 bg-gray-200 rounded-lg" required />
              <input v-model="contactForm.phone" type="tel" placeholder="Phone" class="w-full px-4 py-4 bg-gray-200 rounded-lg" required />
            </div>
            <input v-model="contactForm.name" type="text" placeholder="Name" class="w-full px-4 py-4 bg-gray-200 rounded-lg" required />
            <textarea v-model="contactForm.message" rows="6" placeholder="Message" class="w-full px-4 py-4 bg-gray-200 rounded-lg resize-none" required></textarea>
            <button type="submit" :disabled="isSubmittingContact" class="bg-orange-600 text-white font-semibold py-4 px-8 rounded-lg">
              {{ isSubmittingContact ? 'Submitting...' : 'Submit Button' }}
            </button>
          </form>
        </div>

        <!-- Newsletter Signup -->
        <div class="bg-orange-600 rounded-lg p-8 text-white h-fit">
          <h3 class="text-xl font-bold mb-4">Our Newsletters</h3>
          <p class="text-orange-100 mb-6 text-sm">
            Subscribe to receive the latest updates and news from Kampong Thom Orphanage.
          </p>
          <form @submit.prevent="submitNewsletter" class="space-y-4">
            <input v-model="newsletterEmail" type="email" placeholder="Email Address" class="w-full px-4 py-3 rounded-lg text-gray-700" required />
            <button type="submit" :disabled="isSubmittingNewsletter" class="w-full bg-white text-orange-600 font-semibold py-3 px-6 rounded-lg">
              {{ isSubmittingNewsletter ? 'Submitting...' : 'Submit Button' }}
            </button>
          </form>
        </div>
      </div>

      <!-- Contact Info Cards -->
      <div class="grid md:grid-cols-3 gap-6 mb-12">
        <div class="bg-orange-600 text-white p-6 rounded-lg cursor-pointer" @click="callPhone">
          <div class="flex items-center space-x-3 mb-2">
            <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
              <path d="M6.62 10.79c1.44 2.83 3.76 5.14 6.59 6.59l2.2-2.2c.27-.27.67-.36 1.02-.24 1.12.37 2.33.57 3.57.57.55 0 1 .45 1 1V20c0 .55-.45 1-1 1-9.39 0-17-7.61-17-17 0-.55.45-1 1-1h3.5c.55 0 1 .45 1 1 0 1.25.2 2.45.57 3.57.11.35.03.74-.25 1.02l-2.2 2.2z"/>
            </svg>
            <span class="font-semibold">+855 62 961 234</span>
          </div>
          <p class="text-orange-100 text-sm">
            Call us directly for assistance and support for our orphanage programs.
          </p>
        </div>

        <div class="bg-gray-200 text-gray-700 p-6 rounded-lg cursor-pointer" @click="sendEmail">
          <div class="flex items-center space-x-3 mb-2">
            <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
              <path d="M20 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z"/>
            </svg>
            <span class="font-semibold">info@kampongthomorphanage.org</span>
          </div>
          <p class="text-gray-500 text-sm">
            Email us for donations, volunteer information, or general questions.
          </p>
        </div>

        <div class="bg-gray-200 text-gray-700 p-6 rounded-lg cursor-pointer" @click="openLocation">
          <div class="flex items-center space-x-3 mb-2">
            <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
              <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/>
            </svg>
            <span class="font-semibold">Kampong Thom, Cambodia</span>
          </div>
          <p class="text-gray-500 text-sm">
            Visit us at Kampong Thom Orphanage in the heart of Cambodia.
          </p>
        </div>
      </div>

      <!-- Embedded Map -->
      <div class="bg-white rounded-lg overflow-hidden shadow-lg">
        <div class="p-4 bg-gray-50 border-b">
          <div class="flex items-center justify-between">
            <div>
              <h3 class="text-lg font-semibold text-gray-800">Our Location</h3>
              <p class="text-sm text-gray-600">Kampong Thom Orphanage, Cambodia</p>
            </div>
            <button @click="openInGoogleMaps" class="bg-orange-600 text-white px-4 py-2 rounded-lg text-sm font-medium">
              Get Directions
            </button>
          </div>
        </div>
        <iframe
          :src="mapEmbedUrl"
          width="100%"
          height="400"
          style="border:0;"
          allowfullscreen=""
          loading="lazy"
          referrerpolicy="no-referrer-when-downgrade"
          class="w-full"
        ></iframe>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'

const contactForm = ref({ email: '', phone: '', name: '', message: '' })
const newsletterEmail = ref('')
const isSubmittingContact = ref(false)
const isSubmittingNewsletter = ref(false)

const submitContactForm = async () => {
  isSubmittingContact.value = true
  try {
    await new Promise(resolve => setTimeout(resolve, 1000))
    alert("Thank you for your message!")
    contactForm.value = { email: '', phone: '', name: '', message: '' }
  } catch (e) {
    alert("Error submitting the form")
  } finally {
    isSubmittingContact.value = false
  }
}

const submitNewsletter = async () => {
  isSubmittingNewsletter.value = true
  try {
    await new Promise(resolve => setTimeout(resolve, 1000))
    alert("Subscribed successfully!")
    newsletterEmail.value = ''
  } catch (e) {
    alert("Error subscribing")
  } finally {
    isSubmittingNewsletter.value = false
  }
}

const mapEmbedUrl = computed(() => 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3634.8234567890123!2d104.8899123!3d12.7304171!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x310e732748de8a95%3A0xf9a1c165a5ef89bc!2sKampong%20Thom%20Orphanage!5e0!3m2!1sen!2skh!4v1640995200000!5m2!1sen!2skh')
const openInGoogleMaps = () => window.open('https://www.google.com/maps/place/Kampong+Thom+Orphanage', '_blank')
const callPhone = () => window.open('tel:+85562961234')
const sendEmail = () => window.open('mailto:info@kampongthomorphanage.org')
const openLocation = () => openInGoogleMaps()
</script>

<style scoped>
input,
textarea,
button {
  transition: all 0.2s ease-in-out;
}
</style>
