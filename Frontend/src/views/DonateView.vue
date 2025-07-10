<template>
  <div>
    <!-- Hero Section -->
    <section class="relative h-screen flex items-center justify-center overflow-hidden">
      <div class="absolute inset-0 z-0">
        <img
          src="../assets/image/twochildren.jpg"
          alt="Children" class="w-full h-full object-cover" />
        <div class="absolute inset-0 bg-gradient-to-r from-black/40 via-black/30 to-black/40"></div>
      </div>
      <div class="relative z-10 text-center px-4 max-w-4xl mx-auto">
        <div class="animate-fade-in-up">
          <h1 class="text-5xl md:text-7xl font-bold text-white mb-6 leading-tight">
            <span class="block text-yellow-400 mt-2">Your donation changes lives forever.</span>
          </h1>
          <p class="text-xl md:text-2xl text-gray-200 mb-8 max-w-3xl mx-auto">
            Every gift you give helps provide warm meals, safe shelter, quality education, and loving care to vulnerable
            children and families in need. Your kindness today creates lasting change and gives hope that tomorrow will
            be better.
          </p>
        </div>
      </div>
    </section>

    <!-- Why We Collect Info Section -->
    <div class="min-h-screen bg-gray-50 flex items-center justify-center py-6 px-6">
      <!-- Main Card Container -->
      <div class="bg-white rounded-2xl  border border-gray-200 p-8 md:p-12">
        <div class="text-center mb-12">
          <h1 class="text-4xl md:text-5xl font-bold text-gray-900 mb-6 leading-tight">
            Why We Collect Donor Information
          </h1>
          <p class="text-gray-600 text-xl leading-relaxed max-w-4xl mx-auto">
            To ensure <span class="font-semibold text-orange-500">transparency and accountability</span>, your donor
            information helps us:
          </p>
        </div>

        <!-- Features Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          <!-- Official Receipts Card -->
          <div
            class="bg-gradient-to-br from-yellow-50 to-orange-50 rounded-xl p-6 text-center group hover:shadow-lg transition-all duration-300 border border-yellow-100">
            <div
              class="inline-flex items-center justify-center w-16 h-16 bg-yellow-200 rounded-full mb-6 shadow-md group-hover:shadow-lg transition-all duration-300 group-hover:scale-110">
              <svg class="w-8 h-8 text-yellow-700" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd"
                  d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4zm2 6a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm1 3a1 1 0 100 2h6a1 1 0 100-2H7z"
                  clip-rule="evenodd" />
              </svg>
            </div>
            <h3 class="text-xl font-bold text-gray-900 mb-3">Official Receipts</h3>
            <p class="text-gray-600 text-sm leading-relaxed">
              Track and report your donations effortlessly.
            </p>
          </div>

          <!-- Stay Informed Card -->
          <div
            class="bg-gradient-to-br from-blue-50 to-indigo-50 rounded-xl p-6 text-center group hover:shadow-lg transition-all duration-300 border border-blue-100">
            <div
              class="inline-flex items-center justify-center w-16 h-16 bg-blue-200 rounded-full mb-6 shadow-md group-hover:shadow-lg transition-all duration-300 group-hover:scale-110">
              <svg class="w-8 h-8 text-blue-700" fill="currentColor" viewBox="0 0 20 20">
                <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z" />
                <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z" />
              </svg>
            </div>
            <h3 class="text-xl font-bold text-gray-900 mb-3">Stay Informed</h3>
            <p class="text-gray-600 text-sm leading-relaxed">
              Receive updates on how your donation makes an impact.
            </p>
          </div>

          <!-- Legal Compliance Card -->
          <div
            class="bg-gradient-to-br from-green-50 to-emerald-50 rounded-xl p-6 text-center group hover:shadow-lg transition-all duration-300 border border-green-100">
            <div
              class="inline-flex items-center justify-center w-16 h-16 bg-green-200 rounded-full mb-6 shadow-md group-hover:shadow-lg transition-all duration-300 group-hover:scale-110">
              <svg class="w-8 h-8 text-green-700" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd"
                  d="M2.166 4.999A11.954 11.954 0 0010 1.944 11.954 11.954 0 0017.834 5c.11.65.166 1.32.166 2.001 0 5.225-3.34 9.67-8 11.317C5.34 16.67 2 12.225 2 7c0-.682.057-1.35.166-2.001zm11.541 3.708a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                  clip-rule="evenodd" />
              </svg>
            </div>
            <h3 class="text-xl font-bold text-gray-900 mb-3">Legal Compliance</h3>
            <p class="text-gray-600 text-sm leading-relaxed">
              Helps us meet Cambodian legal and audit standards.
            </p>
          </div>

          <!-- Show Appreciation Card -->
          <div
            class="bg-gradient-to-br from-pink-50 to-rose-50 rounded-xl p-6 text-center group hover:shadow-lg transition-all duration-300 border border-pink-100">
            <div
              class="inline-flex items-center justify-center w-16 h-16 bg-pink-200 rounded-full mb-6 shadow-md group-hover:shadow-lg transition-all duration-300 group-hover:scale-110">
              <svg class="w-8 h-8 text-pink-700" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd"
                  d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z"
                  clip-rule="evenodd" />
              </svg>
            </div>
            <h3 class="text-xl font-bold text-gray-900 mb-3">Show Appreciation</h3>
            <p class="text-gray-600 text-sm leading-relaxed">
              Allows us to thank you for your generous support.
            </p>
          </div>
        </div>
      </div>
    </div>

    <!-- Donation Form Section -->
    <div class="bg-gray-50 py-4 px-4">
      <div class="max-w-6xl mx-auto">
        <!-- Progress Steps -->
        <div class="mb-8">
          <div class="flex items-center justify-center space-x-4 mb-4">
            <div v-for="step in 6" :key="step" class="flex items-center">
              <div :class="[
                'w-10 h-10 rounded-full flex items-center justify-center font-semibold',
                step <= 4 ? 'bg-blue-500 text-white' : 'bg-gray-300 text-gray-500'
              ]">
                {{ step }}
              </div>
              <div v-if="step < 6" :class="[
                'w-16 h-1 mx-2',
                step < 4 ? 'bg-blue-500' : 'bg-gray-300'
              ]"></div>
            </div>
          </div>
          <div class="text-center">
            <span class="text-sm font-medium text-blue-600 uppercase tracking-wide">DONATION AND PAYMENT</span>
          </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
          <!-- Main Form -->
          <div class="lg:col-span-2 space-y-6">
            <!-- Donation Details -->
            <div class="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
              <h3 class="text-lg font-semibold text-gray-800 mb-6 uppercase tracking-wide">DONATION DETAILS</h3>

              <!-- Preset Amounts -->
              <div class="mb-6">
                <div class="grid grid-cols-4 gap-3 mb-4">
                  <div v-for="preset in presets" :key="preset.amount" :class="[
                    'p-4 border-2 rounded-lg cursor-pointer text-center transition-all',
                    amount === preset.amount ? 'border-blue-500 bg-blue-50' : 'border-gray-200 hover:border-blue-300'
                  ]" @click="amount = preset.amount">
                    <div class="text-2xl mb-1">{{ preset.icon }}</div>
                    <div class="font-semibold text-gray-800">${{ preset.amount }}</div>
                    <div class="text-xs text-gray-500">{{ preset.label }}</div>
                  </div>
                </div>

                <!-- Custom Amount -->
                <div class="relative">
                  <label class="block text-sm font-medium text-gray-600 mb-2 uppercase tracking-wide">CUSTOM
                    AMOUNT</label>
                  <div class="relative">
                    <span class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-500 font-medium">$</span>
                    <input v-model.number="amount" type="number" min="1" placeholder="Enter amount"
                      class="w-full pl-8 pr-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:border-blue-500 bg-gray-50" />
                  </div>
                </div>
              </div>

              <!-- Donation Purpose -->
              <div class="mb-6">
                <label class="block text-sm font-medium text-gray-600 mb-2 uppercase tracking-wide">DONATION
                  PURPOSE</label>
                <select v-model="description" required
                  class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:border-blue-500 bg-gray-50">
                  <option disabled value="">Select a purpose</option>
                  <option value="education">Education Program</option>
                  <option value="healthcare">Healthcare Outreach</option>
                  <option value="cultural">Cultural Event</option>
                </select>
              </div>

              <!-- Recurring Donation -->
              <div class="flex items-center space-x-2">
                <input v-model="isRecurring" type="checkbox" id="recurring"
                  class="w-4 h-4 text-blue-600 border-gray-300 rounded focus:ring-blue-500" />
                <label for="recurring" class="text-sm text-gray-700">Make this a monthly recurring donation</label>
              </div>
            </div>

            <!-- Donor Information -->
            <div class="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
              <h3 class="text-lg font-semibold text-gray-800 mb-6 uppercase tracking-wide">DONOR DETAILS</h3>

              <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                  <label class="block text-sm font-medium text-gray-600 mb-2 uppercase tracking-wide">NAME</label>
                  <input v-model="name" type="text" required placeholder="Enter your full name"
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:border-blue-500 bg-gray-50" />
                </div>

                <div>
                  <label class="block text-sm font-medium text-gray-600 mb-2 uppercase tracking-wide">EMAIL</label>
                  <input v-model="email" type="email" required placeholder="Enter your email"
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:border-blue-500 bg-gray-50" />
                </div>

                <div>
                  <label class="block text-sm font-medium text-gray-600 mb-2 uppercase tracking-wide">PHONE</label>
                  <input v-model="phone" type="tel" placeholder="Enter your phone number"
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:border-blue-500 bg-gray-50" />
                </div>

                <div>
                  <label class="block text-sm font-medium text-gray-600 mb-2 uppercase tracking-wide">COUNTRY</label>
                  <select v-model="country"
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:border-blue-500 bg-gray-50">
                    <option value="">Select Country</option>
                    <option value="US">United States</option>
                    <option value="CA">Canada</option>
                    <option value="UK">United Kingdom</option>
                    <option value="AU">Australia</option>
                  </select>
                </div>
              </div>
            </div>
          </div>

          <!-- Sidebar -->
          <div class="space-y-4">
            <!-- Impact Calculator -->
            <div class="bg-white rounded-lg shadow-sm border border-gray-200">
              <button @click="showImpact = !showImpact"
                class="w-full px-4 py-3 text-left flex items-center justify-between text-sm font-medium text-gray-700 border-b border-gray-200">
                Your Impact
                <svg :class="['w-4 h-4 transition-transform', showImpact ? 'rotate-180' : '']" fill="none"
                  stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                </svg>
              </button>
              <div v-if="showImpact" class="p-4 text-sm text-gray-600">
                <div v-if="amount > 0">
                  Your ${{ amount }} donation can:
                  <ul class="mt-2 space-y-1 list-disc list-inside">
                    <li>Feed {{ Math.floor(amount / 5) }} families</li>
                    <li>Provide {{ Math.floor(amount / 10) }} school supplies</li>
                    <li>Support {{ Math.floor(amount / 25) }} medical checkups</li>
                  </ul>
                </div>
                <div v-else class="text-gray-400">
                  Enter an amount to see your impact
                </div>
              </div>
            </div>

            <!-- Donation Summary -->
            <div class="bg-white rounded-lg shadow-sm border border-gray-200 p-4">
              <h4 class="font-semibold text-gray-800 mb-3">DONATION SUMMARY</h4>
              <div class="space-y-2 text-sm">
                <div class="flex justify-between">
                  <span>Donation Amount:</span>
                  <span class="font-medium">${{ amount || 0 }}</span>
                </div>
                <div class="flex justify-between">
                  <span>Processing Fee:</span>
                  <span class="font-medium">$0</span>
                </div>
                <div class="border-t pt-2 flex justify-between font-semibold">
                  <span>Total:</span>
                  <span>${{ amount || 0 }}</span>
                </div>
              </div>
            </div>

            <!-- Submit Button -->
            <button @click="handleSubmit" :disabled="!isFormValid" :class="[
              'w-full py-4 px-6 rounded-lg font-semibold text-white transition-colors',
              isFormValid ? 'bg-blue-600 hover:bg-blue-700' : 'bg-gray-400 cursor-not-allowed'
            ]">
              COMPLETE DONATION
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'

// Form data
const amount = ref(0)
const name = ref('')
const email = ref('')
const phone = ref('')
const country = ref('')
const description = ref('')
const isRecurring = ref(false)

// UI state
const showImpact = ref(false)

// Features data with inline SVG icons
const features = [
  {
    icon: '<path fill-rule="evenodd" d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4zm2 6a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm1 3a1 1 0 100 2h6a1 1 0 100-2H7z" clip-rule="evenodd" />',
    title: 'Official Receipts',
    description: 'Track and report your donations effortlessly.'
  },
  {
    icon: '<path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z" /><path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z" />',
    title: 'Stay Informed',
    description: 'Receive updates on how your donation makes an impact.'
  },
  {
    icon: '<path fill-rule="evenodd" d="M2.166 4.999A11.954 11.954 0 0010 1.944 11.954 11.954 0 0017.834 5c.11.65.166 1.32.166 2.001 0 5.225-3.34 9.67-8 11.317C5.34 16.67 2 12.225 2 7c0-.682.057-1.35.166-2.001zm11.541 3.708a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />',
    title: 'Legal Compliance',
    description: 'Helps us meet Cambodian legal and audit standards.'
  },
  {
    icon: '<path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd" />',
    title: 'Show Appreciation',
    description: 'Allows us to thank you for your generous support.'
  }
]

// Preset amounts
const presets = [
  { amount: 25, icon: '🍽️', label: 'Basic' },
  { amount: 50, icon: '📚', label: 'Standard' },
  { amount: 100, icon: '🏥', label: 'Premium' },
  { amount: 250, icon: '🎓', label: 'Sponsor' }
]

// Computed
const isFormValid = computed(() => {
  return amount.value > 0 && name.value.trim() && email.value.trim() && description.value
})

// Methods
const handleSubmit = () => {
  if (isFormValid.value) {
    const donationData = {
      amount: amount.value,
      name: name.value,
      email: email.value,
      phone: phone.value,
      country: country.value,
      description: description.value,
      isRecurring: isRecurring.value
    }

    console.log('Donation submitted:', donationData)
    alert(`Thank you ${name.value}! Your donation of $${amount.value} has been submitted.`)

    // Reset form
    amount.value = 0
    name.value = ''
    email.value = ''
    phone.value = ''
    country.value = ''
    description.value = ''
    isRecurring.value = false
  }
}
</script>

<style scoped>
@keyframes fade-in-up {
  from {
    opacity: 0;
    transform: translateY(30px);
  }

  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.animate-fade-in-up {
  animation: fade-in-up 1s ease-out;
}
</style>