<template>
  <div class="min-h-screen">
    <div class="relative w-full h-[400px] overflow-hidden mb-12 shadow-lg">
      <transition name="fade" mode="out-in">
        <img :src="currentSlide" :key="currentSlide" alt="Slideshow banner"
          class="absolute inset-0 object-cover w-full h-full transition-opacity duration-1000" />
      </transition>
      <!-- Overlay Content -->
      <div class="absolute inset-0 flex flex-col items-center justify-center z-20 text-center"
        style="background: rgba(0,0,0,0.35);">
        <h1 class="text-4xl md:text-5xl font-extrabold text-white drop-shadow-lg mb-4 animate-fadein">
          Contact Us
        </h1>
        <p class="text-lg md:text-xl text-white/90 mb-6 max-w-2xl animate-fadein delay-200">
        </p>
        <button @click="openLocation"
          class="bg-orange-500 hover:bg-orange-600 text-white font-semibold px-8 py-3 rounded-full shadow-lg transition-all duration-300 animate-fadein delay-400">
          Visit Us
        </button>
      </div>
      <div class="absolute bottom-4 left-1/2 transform -translate-x-1/2 flex space-x-2 z-30">
        <button v-for="(slide, index) in slideImages" :key="index" class="w-3 h-3 rounded-full border-2 border-white"
          :class="currentSlideIndex === index ? 'bg-orange-500' : 'bg-white opacity-70'"
          @click="setSlide(index)"></button>
      </div>
    </div>
    <div class="container mx-auto px-4 max-w-7xl">

      <!-- Slideshow Banner with Overlay -->


      <!-- Interactive Info Cards -->
      <div class="grid md:grid-cols-3 gap-8 mb-16">
        <div
          class="group bg-white rounded-xl shadow-lg p-8 flex flex-col items-center transition-transform hover:-translate-y-2 hover:shadow-2xl cursor-pointer"
          @click="openLocation">
          <div class="bg-orange-100 rounded-full p-4 mb-4 transition-transform group-hover:scale-110">
            <svg width="36" height="36" fill="#F15A24" viewBox="0 0 24 24">
              <path
                d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z" />
            </svg>
          </div>
          <h3 class="font-bold uppercase mb-2 text-orange-600 tracking-wider">Visit Us</h3>
          <p class="text-gray-500 text-sm mb-2">
            Come see our center and meet the children and staff!
          </p>
          <span class="text-orange-700 font-semibold underline underline-offset-2">2 Elizabeth St. London, UK</span>
        </div>
        <div
          class="group bg-white rounded-xl shadow-lg p-8 flex flex-col items-center transition-transform hover:-translate-y-2 hover:shadow-2xl cursor-pointer"
          @click="callPhone">
          <div class="bg-orange-100 rounded-full p-4 mb-4 transition-transform group-hover:scale-110">
            <svg width="36" height="36" fill="#F15A24" viewBox="0 0 24 24">
              <path
                d="M6.62 10.79c1.44 2.83 3.76 5.14 6.59 6.59l2.2-2.2c.27-.27.67-.36 1.02-.24 1.12.37 2.33.57 3.57.57.55 0 1 .45 1 1V20c0 .55-.45 1-1 1-9.39 0-17-7.61-17-17 0-.55.45-1 1-1h3.5c.55 0 1 .45 1 1 0 1.25.2 2.45.57 3.57.11.35.03.74-.25 1.02l-2.2 2.2z" />
            </svg>
          </div>
          <h3 class="font-bold uppercase mb-2 text-orange-600 tracking-wider">Call Us</h3>
          <p class="text-gray-500 text-sm mb-2">
            We’re happy to answer your questions by phone.
          </p>
          <span class="text-orange-700 font-semibold underline underline-offset-2">+44 (0) 203 116 7711</span>
        </div>
        <div
          class="group bg-white rounded-xl shadow-lg p-8 flex flex-col items-center transition-transform hover:-translate-y-2 hover:shadow-2xl cursor-pointer"
          @click="sendEmail">
          <div class="bg-orange-100 rounded-full p-4 mb-4 transition-transform group-hover:scale-110">
            <svg width="36" height="36" fill="#F15A24" viewBox="0 0 24 24">
              <path
                d="M20 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z" />
            </svg>
          </div>
          <h3 class="font-bold uppercase mb-2 text-orange-600 tracking-wider">Contact Us</h3>
          <p class="text-gray-500 text-sm mb-2">
            Email us for more information or partnership opportunities.
          </p>
          <span class="text-orange-700 font-semibold underline underline-offset-2">noreply@inoland.com</span>
        </div>
      </div>

      <!-- Main Content Section -->
      <div class="grid lg:grid-cols-3 gap-8 mb-16">
        <!-- Contact Form -->
        <div class="lg:col-span-2">
          <form @submit.prevent="submitContactForm" class="space-y-6 bg-white rounded-xl shadow-lg p-8">
            <div class="grid md:grid-cols-2 gap-6">
              <div>
                <input v-model="contactForm.email" type="email" placeholder="Email"
                  class="w-full px-4 py-4 bg-gray-100 rounded-lg border-0 text-gray-700 placeholder-gray-500 focus:bg-white focus:ring-2 focus:ring-orange-500 focus:outline-none transition-all"
                  required />
              </div>
              <div>
                <input v-model="contactForm.phone" type="tel" placeholder="Phone"
                  class="w-full px-4 py-4 bg-gray-100 rounded-lg border-0 text-gray-700 placeholder-gray-500 focus:bg-white focus:ring-2 focus:ring-orange-500 focus:outline-none transition-all"
                  required />
              </div>
            </div>
            <div>
              <input v-model="contactForm.name" type="text" placeholder="Name"
                class="w-full px-4 py-4 bg-gray-100 rounded-lg border-0 text-gray-700 placeholder-gray-500 focus:bg-white focus:ring-2 focus:ring-orange-500 focus:outline-none transition-all"
                required />
            </div>
            <div>
              <textarea v-model="contactForm.message" rows="6" placeholder="Message"
                class="w-full px-4 py-4 bg-gray-100 rounded-lg border-0 text-gray-700 placeholder-gray-500 focus:bg-white focus:ring-2 focus:ring-orange-500 focus:outline-none resize-none transition-all"
                required></textarea>
            </div>
            <button type="submit" :disabled="isSubmittingContact"
              class="bg-orange-600 hover:bg-orange-700 disabled:bg-orange-400 text-white font-semibold py-4 px-8 rounded-lg transition-colors duration-200 shadow-lg hover:shadow-xl disabled:cursor-not-allowed">
              {{ isSubmittingContact ? 'Submitting...' : 'Submit' }}
            </button>
          </form>
        </div>

        <!-- Newsletter Signup -->
        <div class="bg-orange-600 rounded-xl p-8 text-white h-fit shadow-lg flex flex-col justify-center">
          <h3 class="text-xl font-bold mb-4">Our Newsletters</h3>
          <p class="text-orange-100 mb-6 text-sm leading-relaxed">
            Subscribe to get the latest updates and stories from our orphanage.
          </p>
          <form @submit.prevent="submitNewsletter" class="space-y-4">
            <input v-model="newsletterEmail" type="email" placeholder="Email Address"
              class="w-full px-4 py-3 rounded-lg border-0 text-gray-700 placeholder-gray-500 focus:ring-2 focus:ring-white focus:outline-none"
              required />
            <button type="submit" :disabled="isSubmittingNewsletter"
              class="w-full bg-white hover:bg-gray-100 disabled:bg-gray-300 text-orange-600 font-semibold py-3 px-6 rounded-lg transition-colors duration-200 disabled:cursor-not-allowed">
              {{ isSubmittingNewsletter ? 'Submitting...' : 'Subscribe' }}
            </button>
          </form>
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
            <button @click="openInGoogleMaps" class="bg-orange-600 text-white px-4 py-2 rounded-lg hover:bg-orange-700">
              Get Directions
            </button>
          </div>
        </div>
        <iframe :src="mapEmbedUrl" width="100%" height="400" style="border:0;" allowfullscreen="" loading="lazy"
          class="w-full"></iframe>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import contactBanner1 from '@/assets/image/contact_banner.jpg'
import contactBanner2 from '@/assets/image/contact_banner2.png'
import contactBanner3 from '@/assets/image/contact_banner3.jpg'
import contactBanner4 from '@/assets/image/contact_banner4.jpg'

// Contact form
const contactForm = ref({
  email: '',
  phone: '',
  name: '',
  message: ''
})
const isSubmittingContact = ref(false)

const submitContactForm = async () => {
  isSubmittingContact.value = true
  await new Promise(resolve => setTimeout(resolve, 1000))
  alert("Thank you for your message!")
  contactForm.value = { email: '', phone: '', name: '', message: '' }
  isSubmittingContact.value = false
}

// Newsletter
const newsletterEmail = ref('')
const isSubmittingNewsletter = ref(false)

const submitNewsletter = async () => {
  isSubmittingNewsletter.value = true
  await new Promise(resolve => setTimeout(resolve, 1000))
  alert("Subscribed successfully!")
  newsletterEmail.value = ''
  isSubmittingNewsletter.value = false
}

// Map
const mapEmbedUrl = ref('https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3634.8234567890123!2d104.8899123!3d12.7304171!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x310e732748de8a95%3A0xf9a1c165a5ef89bc!2sKampong%20Thom%20Orphanage!5e0!3m2!1sen!2skh!4v1640995200000!5m2!1sen!2skh')

const openInGoogleMaps = () => {
  window.open("https://goo.gl/maps/4M4y43Er5EN2", '_blank')
}
const callPhone = () => window.open('tel:+85562961234')
const sendEmail = () => window.open('mailto:info@kampongthomorphanage.org')
const openLocation = () => openInGoogleMaps()

// Slideshow
const slideImages = [
  contactBanner1,
  contactBanner2,
  contactBanner3,
  contactBanner4,
]
const currentSlideIndex = ref(0)
const currentSlide = computed(() => slideImages[currentSlideIndex.value])
onMounted(() => {
  setInterval(() => {
    currentSlideIndex.value = (currentSlideIndex.value + 1) % slideImages.length
  }, 4000)
})
const setSlide = (index) => {
  currentSlideIndex.value = index
}
</script>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.8s;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0.2;
}

/* Overlay animation */
.animate-fadein {
  animation: fadein 1s both;
}

.animate-fadein.delay-200 {
  animation-delay: 0.2s;
}

.animate-fadein.delay-400 {
  animation-delay: 0.4s;
}

@keyframes fadein {
  from {
    opacity: 0;
    transform: translateY(20px);
  }

  to {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>