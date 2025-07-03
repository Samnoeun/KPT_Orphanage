<template>
  <div class="min-h-screen bg-gray-50 py-12">
    <div class="container mx-auto px-4 max-w-6xl">
      
      <!-- Enhanced Interactive Header Section -->
      <div class="text-center mb-12 relative overflow-hidden">
        <!-- Animated Background Elements -->
        <div class="absolute inset-0 pointer-events-none">
          <div 
            v-for="i in 6" 
            :key="i"
            class="absolute w-2 h-2 bg-teal-200 rounded-full opacity-30 animate-float"
            :style="{
              left: Math.random() * 100 + '%',
              top: Math.random() * 100 + '%',
              animationDelay: Math.random() * 3 + 's',
              animationDuration: (3 + Math.random() * 2) + 's'
            }"
          ></div>
        </div>

        <!-- Interactive Decorative Arrows -->
        <div class="flex justify-between items-start mb-8 relative z-10">
          <!-- Top Left Arrows -->
          <div 
            class="flex space-x-1 text-gray-300 hover:text-teal-500 transition-all duration-500 cursor-pointer transform hover:scale-110 hover:rotate-12"
            @mouseenter="animateArrows('left')"
            @click="triggerConfetti"
          >
            <svg 
              v-for="(arrow, index) in 3" 
              :key="'left-' + index"
              class="w-6 h-6 transition-all duration-300"
              :class="{ 'animate-bounce': arrowAnimation.left }"
              :style="{ animationDelay: index * 100 + 'ms' }"
              fill="currentColor" 
              viewBox="0 0 24 24"
            >
              <path d="M8.59 16.59L13.17 12 8.59 7.41 10 6l6 6-6 6-1.41-1.41z"/>
            </svg>
          </div>

          <!-- Top Right Arrows -->
          <div 
            class="flex space-x-1 text-gray-300 hover:text-teal-500 transition-all duration-500 cursor-pointer transform hover:scale-110 hover:-rotate-12"
            @mouseenter="animateArrows('right')"
            @click="triggerPulse"
          >
            <svg 
              v-for="(arrow, index) in 3" 
              :key="'right-' + index"
              class="w-6 h-6 transition-all duration-300"
              :class="{ 'animate-pulse': arrowAnimation.right }"
              :style="{ animationDelay: index * 100 + 'ms' }"
              fill="currentColor" 
              viewBox="0 0 24 24"
            >
              <path d="M8.59 16.59L13.17 12 8.59 7.41 10 6l6 6-6 6-1.41-1.41z"/>
            </svg>
          </div>
        </div>
        
        <!-- Interactive Title with Typing Effect -->
        <div class="relative">
          <h1 
            class="text-5xl font-bold text-gray-800 mb-4 relative inline-block cursor-pointer"
            @mouseenter="startTitleAnimation"
            @mouseleave="stopTitleAnimation"
          >
            <span 
              v-for="(letter, index) in titleLetters" 
              :key="index"
              class="inline-block transition-all duration-300 hover:text-teal-600 hover:scale-125 hover:-translate-y-2"
              :class="{ 'animate-bounce': titleAnimation && index === animatedLetterIndex }"
              :style="{ animationDelay: index * 50 + 'ms' }"
              @mouseenter="animateLetter(index)"
            >
              {{ letter === ' ' ? '\u00A0' : letter }}
            </span>
            
            <!-- Animated Cursor -->
            <span 
              v-if="showCursor"
              class="inline-block w-1 h-12 bg-teal-500 ml-1 animate-pulse"
            ></span>
          </h1>
          
          <!-- Hover Glow Effect -->
          <div 
            class="absolute inset-0 bg-gradient-to-r from-teal-400 to-blue-500 opacity-0 blur-xl transition-opacity duration-500 -z-10"
            :class="{ 'opacity-20': titleHovered }"
          ></div>
        </div>
        
        <!-- Interactive Description -->
        <div class="relative group">
          <p 
            class="text-gray-600 max-w-2xl mx-auto leading-relaxed transition-all duration-500 group-hover:text-gray-800 cursor-pointer"
            @click="cycleDescription"
          >
            {{ currentDescription }}
          </p>
          
          <!-- Progress Bar for Description -->
          <div class="w-24 h-1 bg-gray-200 mx-auto mt-4 rounded-full overflow-hidden">
            <div 
              class="h-full bg-gradient-to-r from-teal-500 to-blue-500 transition-all duration-300 rounded-full"
              :style="{ width: descriptionProgress + '%' }"
            ></div>
          </div>
        </div>
        
        <!-- Bottom Right Interactive Arrows -->
        <div class="flex justify-end mt-8 mr-12 relative z-10">
          <div 
            class="flex space-x-1 text-gray-300 hover:text-teal-500 transition-all duration-500 cursor-pointer transform hover:scale-110 hover:rotate-45"
            @mouseenter="animateArrows('bottom')"
            @click="createRipple"
          >
            <svg 
              v-for="(arrow, index) in 3" 
              :key="'bottom-' + index"
              class="w-6 h-6 transition-all duration-300"
              :class="{ 'animate-spin': arrowAnimation.bottom }"
              :style="{ animationDelay: index * 150 + 'ms' }"
              fill="currentColor" 
              viewBox="0 0 24 24"
            >
              <path d="M8.59 16.59L13.17 12 8.59 7.41 10 6l6 6-6 6-1.41-1.41z"/>
            </svg>
          </div>
        </div>

        <!-- Ripple Effect Container -->
        <div 
          v-for="ripple in ripples" 
          :key="ripple.id"
          class="absolute pointer-events-none"
          :style="{
            left: ripple.x + 'px',
            top: ripple.y + 'px',
            transform: 'translate(-50%, -50%)'
          }"
        >
          <div 
            class="w-4 h-4 border-2 border-teal-400 rounded-full animate-ping"
            :style="{ animationDuration: '1s' }"
          ></div>
        </div>
      </div>

      <!-- Enhanced Interactive Logo Section -->
      <div class="mb-16 relative">
        <div class="flex justify-center items-center space-x-12 opacity-60 group">
          <div 
            v-for="(logo, index) in logos" 
            :key="index"
            class="text-gray-400 font-semibold text-lg transition-all duration-500 cursor-pointer transform hover:scale-125 hover:text-teal-600 hover:-translate-y-2 hover:rotate-3"
            :class="{ 'animate-pulse': logoAnimation === index }"
            @mouseenter="animateLogo(index)"
            @click="selectLogo(index)"
          >
            {{ logo.name }}
            
            <!-- Logo Selection Indicator -->
            <div 
              class="w-full h-1 bg-gradient-to-r from-teal-500 to-blue-500 mt-2 rounded-full transition-all duration-300"
              :class="selectedLogo === index ? 'opacity-100 scale-100' : 'opacity-0 scale-0'"
            ></div>
          </div>
        </div>
        
        <!-- Logo Carousel Dots -->
        <div class="flex justify-center space-x-2 mt-6">
          <button 
            v-for="(logo, index) in logos" 
            :key="'dot-' + index"
            class="w-3 h-3 rounded-full transition-all duration-300"
            :class="selectedLogo === index ? 'bg-teal-500 scale-125' : 'bg-gray-300 hover:bg-gray-400'"
            @click="selectLogo(index)"
          ></button>
        </div>
      </div>

      <!-- Main Content Section -->
      <div class="grid lg:grid-cols-3 gap-8 mb-16">
        
        <!-- Contact Form -->
        <div class="lg:col-span-2">
          <form @submit.prevent="submitContactForm" class="space-y-6">
            <div class="grid md:grid-cols-2 gap-6">
              <div>
                <input
                  v-model="contactForm.email"
                  type="email"
                  placeholder="Email"
                  class="w-full px-4 py-4 bg-gray-200 rounded-lg border-0 text-gray-700 placeholder-gray-500 focus:bg-white focus:ring-2 focus:ring-teal-500 focus:outline-none transition-all"
                  required
                />
              </div>
              <div>
                <input
                  v-model="contactForm.phone"
                  type="tel"
                  placeholder="Phone"
                  class="w-full px-4 py-4 bg-gray-200 rounded-lg border-0 text-gray-700 placeholder-gray-500 focus:bg-white focus:ring-2 focus:ring-teal-500 focus:outline-none transition-all"
                  required
                />
              </div>
            </div>
            
            <div>
              <input
                v-model="contactForm.name"
                type="text"
                placeholder="Name"
                class="w-full px-4 py-4 bg-gray-200 rounded-lg border-0 text-gray-700 placeholder-gray-500 focus:bg-white focus:ring-2 focus:ring-teal-500 focus:outline-none transition-all"
                required
              />
            </div>
            
            <div>
              <textarea
                v-model="contactForm.message"
                rows="6"
                placeholder="Message"
                class="w-full px-4 py-4 bg-gray-200 rounded-lg border-0 text-gray-700 placeholder-gray-500 focus:bg-white focus:ring-2 focus:ring-teal-500 focus:outline-none resize-none transition-all"
                required
              ></textarea>
            </div>
            
            <button
              type="submit"
              :disabled="isSubmittingContact"
              class="bg-teal-600 hover:bg-teal-700 disabled:bg-teal-400 text-white font-semibold py-4 px-8 rounded-lg transition-colors duration-200 shadow-lg hover:shadow-xl disabled:cursor-not-allowed"
            >
              {{ isSubmittingContact ? 'Submitting...' : 'Submit Button' }}
            </button>
          </form>
        </div>

        <!-- Newsletter Signup -->
        <div class="bg-teal-600 rounded-lg p-8 text-white h-fit">
          <h3 class="text-xl font-bold mb-4">Our Newsletters</h3>
          <p class="text-teal-100 mb-6 text-sm leading-relaxed">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.
          </p>
          
          <form @submit.prevent="submitNewsletter" class="space-y-4">
            <input
              v-model="newsletterEmail"
              type="email"
              placeholder="Email Address"
              class="w-full px-4 py-3 rounded-lg border-0 text-gray-700 placeholder-gray-500 focus:ring-2 focus:ring-white focus:outline-none"
              required
            />
            <button
              type="submit"
              :disabled="isSubmittingNewsletter"
              class="w-full bg-white hover:bg-gray-100 disabled:bg-gray-300 text-teal-600 font-semibold py-3 px-6 rounded-lg transition-colors duration-200 disabled:cursor-not-allowed"
            >
              {{ isSubmittingNewsletter ? 'Submitting...' : 'Submit Button' }}
            </button>
          </form>
        </div>
      </div>

      <!-- Contact Information Cards -->
      <div class="grid md:grid-cols-3 gap-6 mb-12">
        <!-- Phone Card -->
        <div class="bg-teal-600 text-white p-6 rounded-lg hover:bg-teal-700 transition-colors cursor-pointer" @click="callPhone">
          <div class="flex items-center space-x-3 mb-2">
            <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
              <path d="M6.62 10.79c1.44 2.83 3.76 5.14 6.59 6.59l2.2-2.2c.27-.27.67-.36 1.02-.24 1.12.37 2.33.57 3.57.57.55 0 1 .45 1 1V20c0 .55-.45 1-1 1-9.39 0-17-7.61-17-17 0-.55.45-1 1-1h3.5c.55 0 1 .45 1 1 0 1.25.2 2.45.57 3.57.11.35.03.74-.25 1.02l-2.2 2.2z"/>
            </svg>
            <span class="font-semibold">+855 62 961 234</span>
          </div>
          <p class="text-teal-100 text-sm">
            Call us directly for immediate assistance and support for our orphanage programs
          </p>
        </div>

        <!-- Email Card -->
        <div class="bg-gray-200 text-gray-700 p-6 rounded-lg hover:bg-gray-300 transition-colors cursor-pointer" @click="sendEmail">
          <div class="flex items-center space-x-3 mb-2">
            <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
              <path d="M20 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z"/>
            </svg>
            <span class="font-semibold">info@kampongthomorphanage.org</span>
          </div>
          <p class="text-gray-500 text-sm">
            Send us an email for detailed inquiries about donations and volunteer opportunities
          </p>
        </div>

        <!-- Location Card -->
        <div class="bg-gray-200 text-gray-700 p-6 rounded-lg hover:bg-gray-300 transition-colors cursor-pointer" @click="openLocation">
          <div class="flex items-center space-x-3 mb-2">
            <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
              <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/>
            </svg>
            <span class="font-semibold">Kampong Thom, Cambodia</span>
          </div>
          <p class="text-gray-500 text-sm">
            Visit us at Kampong Thom Orphanage, located in the heart of Cambodia
          </p>
        </div>
      </div>

      <!-- Interactive Map Section -->
      <div class="bg-white rounded-lg overflow-hidden shadow-lg">
        <div class="p-4 bg-gray-50 border-b">
          <div class="flex items-center justify-between">
            <div>
              <h3 class="text-lg font-semibold text-gray-800">Our Location</h3>
              <p class="text-sm text-gray-600">Kampong Thom Orphanage, Cambodia</p>
            </div>
            <div class="flex space-x-2">
              <button 
                @click="openInGoogleMaps"
                class="bg-teal-600 hover:bg-teal-700 text-white px-4 py-2 rounded-lg text-sm font-medium transition-colors flex items-center space-x-2"
              >
                <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/>
                </svg>
                <span>Get Directions</span>
              </button>
              <button 
                @click="toggleMapView"
                class="bg-gray-200 hover:bg-gray-300 text-gray-700 px-4 py-2 rounded-lg text-sm font-medium transition-colors"
              >
                {{ mapView === 'satellite' ? 'Map View' : 'Satellite' }}
              </button>
            </div>
          </div>
        </div>
        
        <div class="relative">
          <!-- Google Maps Embed -->
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
          
          <!-- Overlay with location info -->
          <div class="absolute top-4 left-4 bg-white rounded-lg shadow-lg p-4 max-w-xs">
            <div class="flex items-start space-x-3">
              <div class="w-3 h-3 bg-red-500 rounded-full mt-1 flex-shrink-0"></div>
              <div>
                <h4 class="font-semibold text-gray-800 text-sm">Kampong Thom Orphanage</h4>
                <p class="text-xs text-gray-600 mt-1">
                  Providing care and education for children in need since 2010
                </p>
                <button 
                  @click="openInGoogleMaps"
                  class="text-teal-600 hover:text-teal-700 text-xs font-medium mt-2 flex items-center space-x-1"
                >
                  <span>View in Google Maps</span>
                  <svg class="w-3 h-3" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M14 3v2h3.59l-9.83 9.83 1.41 1.41L19 6.41V10h2V3h-7z"/>
                  </svg>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'

// Add these to the existing script setup section
const titleLetters = ref('Contact Us'.split(''))
const titleAnimation = ref(false)
const titleHovered = ref(false)
const animatedLetterIndex = ref(-1)
const showCursor = ref(false)

const descriptions = [
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.",
  "Get in touch with us for any inquiries about our orphanage programs and how you can help make a difference.",
  "We're here to answer your questions and welcome you to join our mission of caring for children in need.",
  "Contact us today to learn about volunteer opportunities, donations, and ways to support our community."
]
const currentDescriptionIndex = ref(0)
const currentDescription = computed(() => descriptions[currentDescriptionIndex.value])
const descriptionProgress = computed(() => ((currentDescriptionIndex.value + 1) / descriptions.length) * 100)

const arrowAnimation = ref({
  left: false,
  right: false,
  bottom: false
})

const logos = ref([
  { name: 'LOGOIPSUM', active: false },
  { name: 'LOGOIPSUM', active: false },
  { name: 'LOGOIPSUM', active: false },
  { name: 'LOGOIPSUM', active: false }
])
const selectedLogo = ref(0)
const logoAnimation = ref(-1)

const ripples = ref([])
let rippleId = 0

// Animation methods
const animateArrows = (direction) => {
  arrowAnimation.value[direction] = true
  setTimeout(() => {
    arrowAnimation.value[direction] = false
  }, 1000)
}

const startTitleAnimation = () => {
  titleHovered.value = true
  showCursor.value = true
  titleAnimation.value = true
}

const stopTitleAnimation = () => {
  titleHovered.value = false
  showCursor.value = false
  titleAnimation.value = false
  animatedLetterIndex.value = -1
}

const animateLetter = (index) => {
  animatedLetterIndex.value = index
}

const cycleDescription = () => {
  currentDescriptionIndex.value = (currentDescriptionIndex.value + 1) % descriptions.length
}

const animateLogo = (index) => {
  logoAnimation.value = index
  setTimeout(() => {
    logoAnimation.value = -1
  }, 500)
}

const selectLogo = (index) => {
  selectedLogo.value = index
}

const triggerConfetti = () => {
  // Simple confetti effect simulation
  for (let i = 0; i < 10; i++) {
    setTimeout(() => {
      createRipple({ clientX: Math.random() * window.innerWidth, clientY: Math.random() * 200 })
    }, i * 100)
  }
}

const triggerPulse = () => {
  document.body.style.animation = 'pulse 0.5s ease-in-out'
  setTimeout(() => {
    document.body.style.animation = ''
  }, 500)
}

const createRipple = (event) => {
  const rect = event.target?.getBoundingClientRect() || { left: 0, top: 0 }
  const ripple = {
    id: rippleId++,
    x: (event.clientX || Math.random() * 100) - rect.left,
    y: (event.clientY || Math.random() * 100) - rect.top
  }
  
  ripples.value.push(ripple)
  
  setTimeout(() => {
    const index = ripples.value.findIndex(r => r.id === ripple.id)
    if (index > -1) {
      ripples.value.splice(index, 1)
    }
  }, 1000)
}

// Contact form data
const contactForm = ref({
  email: '',
  phone: '',
  name: '',
  message: ''
})

// Newsletter form data
const newsletterEmail = ref('')

// Loading states
const isSubmittingContact = ref(false)
const isSubmittingNewsletter = ref(false)

// Submit contact form
const submitContactForm = async () => {
  isSubmittingContact.value = true
  
  try {
    // Simulate API call
    await new Promise(resolve => setTimeout(resolve, 1000))
    
    console.log('Contact form submitted:', contactForm.value)
    alert('Thank you for your message! We\'ll get back to you soon.')
    
    // Reset form
    contactForm.value = {
      email: '',
      phone: '',
      name: '',
      message: ''
    }
  } catch (error) {
    console.error('Error submitting contact form:', error)
    alert('There was an error submitting your message. Please try again.')
  } finally {
    isSubmittingContact.value = false
  }
}

// Submit newsletter form
const submitNewsletter = async () => {
  isSubmittingNewsletter.value = true
  
  try {
    // Simulate API call
    await new Promise(resolve => setTimeout(resolve, 1000))
    
    console.log('Newsletter signup:', newsletterEmail.value)
    alert('Thank you for subscribing to our newsletter!')
    
    // Reset form
    newsletterEmail.value = ''
  } catch (error) {
    console.error('Error submitting newsletter:', error)
    alert('There was an error subscribing. Please try again.')
  } finally {
    isSubmittingNewsletter.value = false
  }
}

// Map configuration
const mapView = ref('roadmap')
const googleMapsUrl = 'https://www.google.com/maps/place/Kampong+Thom+Orphanage/@12.7304171,104.8899123,713m/data=!3m1!1e3!4m10!1m2!2m1!1sKampong+Thom+Orphanage+!3m6!1s0x310e732748de8a95:0xf9a1c165a5ef89bc!8m2!3d12.7299024!4d104.893444!15sChZLYW1wb25nIFRob20gT3JwaGFuYWdlkgEJb3JwaGFuYWdlqgFOEAEqDSIJb3JwaGFuYWdlKAAyHxABIhuqKubRIictRiaEqxq7hl_HyPzslfAiP6YhFtkyGhACIhZrYW1wb25nIHRob20gb3JwaGFuYWdl4AEA!16s%2Fg%2F113fr65b0?authuser=0&entry=ttu&g_ep=EgoyMDI1MDYzMC4wIKXMDSoASAFQAw%3D%3D'

const mapEmbedUrl = computed(() => {
  const baseUrl = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3634.8234567890123!2d104.8899123!3d12.7304171!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x310e732748de8a95%3A0xf9a1c165a5ef89bc!2sKampong%20Thom%20Orphanage!5e'
  return `${baseUrl}${mapView.value === 'satellite' ? '1' : '0'}!3m2!1sen!2kh!4v1640995200000!5m2!1sen!2kh`
})

// Interactive methods
const openInGoogleMaps = () => {
  window.open(googleMapsUrl, '_blank')
}

const openLocation = () => {
  window.open(googleMapsUrl, '_blank')
}

const callPhone = () => {
  window.open('tel:+85562961234')
}

const sendEmail = () => {
  window.open('mailto:info@kampongthomorphanage.org')
}

const toggleMapView = () => {
  mapView.value = mapView.value === 'roadmap' ? 'satellite' : 'roadmap'
}
</script>

<style scoped>
@keyframes float {
  0%, 100% { transform: translateY(0px) rotate(0deg); }
  50% { transform: translateY(-20px) rotate(180deg); }
}

.animate-float {
  animation: float 3s ease-in-out infinite;
}

/* Custom hover effects */
.group:hover .group-hover\:text-gray-800 {
  transform: scale(1.02);
}

/* Custom focus styles */
input:focus,
textarea:focus {
  transform: translateY(-1px);
}

/* Smooth transitions */
input,
textarea,
button {
  transition: all 0.2s ease-in-out;
}

/* Hover effects for cards */
.bg-teal-600:hover,
.bg-gray-200:hover {
  transform: translateY(-2px);
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}
</style>
