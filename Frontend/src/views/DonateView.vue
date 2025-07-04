<template>
  <div>
    <section class="relative h-screen flex items-center justify-center overflow-hidden">
      <div class="absolute inset-0 z-0">
        <img src="../assets/image/twochildren.jpg" alt="Orphanage" class="w-full h-full object-cover" />
        <div class="absolute inset-0 bg-gradient-to-r from-black/40 via-black/30 to-black/40"></div>
      </div>

      <div class="relative z-10 text-center px-4 max-w-4xl mx-auto">
        <div class="animate-fade-in-up">
          <h1 class="text-5xl md:text-7xl font-bold text-white mb-6 leading-tight">
            <!-- Donate Now -->
            <span class="block text-yellow-400 mt-2">Your donation changes lives forever.</span>
          </h1>
          <p class="text-xl md:text-1xl text-gray-200 mb-8 max-w-1xl mx-auto">
            Every gift you give helps provide warm meals, safe shelter, quality education, and loving care to vulnerable
            children and families in need. For many, your generosity is the difference between hunger and nourishment,
            fear and safety, despair and hope.

            When you donate, you become part of a community committed to bringing brighter futures to those who need it
            most. Together, we can offer every child the chance to grow up healthy, educated, and loved.

            Your kindness today creates lasting change and gives hope that tomorrow will be better.
          </p>
        </div>
      </div>
    </section>
    <div class="max-w-[92%] mx-auto mt-8">
      <h2 class="text-3xl md:text-4xl font-bold text-center text-black mb-12 drop-shadow-lg">
        Donation Details
      </h2>
      <div class="bg-white rounded-lg shadow-lg border border-gray-200 p-6">
        <div class="flex items-center mb-4">
          <i class="fas fa-info-circle text-orange-500 text-2xl mr-3"></i>
          <h2 class="text-xl font-semibold text-gray-800">
            Why We Collect Donor Information
          </h2>
        </div>
        <p class="text-gray-700 mb-3">
          Collecting donor details helps us ensure transparency and accountability.
          Your information allows us to:
        </p>
        <ul class="list-disc list-inside text-gray-700 space-y-1 mb-4">
          <li>Provide receipts for your donations.</li>
          <li>Keep you updated about the impact of your support.</li>
          <li>Comply with legal and tax reporting requirements.</li>
          <li>Recognize and thank you for your generosity.</li>
        </ul>
        <p class="text-gray-700">
          We value your privacy. All donor information is kept secure and is never
          shared without your consent.
        </p>


      </div>
    </div>

    <div class="max-w-[90rem] mx-auto p-6 grid grid-cols-1 md:grid-cols-2 gap-8">
      <div class="flex flex-col items-center md:items-start text-center md:text-left space-y-4">
        <img src="../assets/image/photo_2025-07-03_10-46-38.jpg" alt="Support our cause"
          class="rounded-lg shadow-lg w-full " />
      </div>
      <div class="bg-white p-8 rounded-lg shadow-lg">
        <h1 class="text-3xl font-bold mb-4">Donate Now</h1>
        <form @submit.prevent="handleSubmit" class="space-y-6">
          <div class="flex flex-col gap-2">
            <label class="block mb-2 font-semibold text-lg text-blue-600">Donation Amount</label>

            <div class="flex items-center gap-4">
              <div class="flex gap-2 flex-wrap">
                <button v-for="preset in presets" :key="preset" type="button"
                  class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition focus:outline-none"
                  :class="{ 'bg-blue-700': amount === preset }" @click="amount = preset">
                  ${{ preset }}
                </button>
                <input type="number" min="0" placeholder="Custom" v-model.number="amount"
                  class="border rounded px-2 py-1 w-28 text-center" />
              </div>
              <div>
                <!-- Replace with your QR code image/source -->
                <img src="../assets/image/photo_2024-07-17_09-25-07.jpg" alt="QR Code" class="h-2=40 w-40 rounded" />
              </div>
            </div>
          </div>

          <div class="flex gap-4">
            <div class="flex-1">
              <label class="block mb-1 font-semibold">Full Name</label>
              <input type="text" v-model="name"
                class="w-full border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" required />
            </div>
            <div class="flex-1">
              <label class="block mb-1 font-semibold">Email</label>
              <input type="email" v-model="email"
                class="w-full border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" required />
            </div>
          </div>

          <div class="flex gap-4">
            <div class="flex-1">
              <label class="block mb-1 font-semibold">Bank Name</label>
              <input type="text" v-model="bankName"
                class="w-full border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" required />
            </div>
            <div class="flex-1">
              <label class="block mb-1 font-semibold">Description (Optional)</label>
              <textarea v-model="description" placeholder="Add a message or note"
                class="w-full border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                rows="3"></textarea>
            </div>
          </div>

          <div class="flex justify-between items-center">
            <button type="submit"
              class="w-full bg-green-600 text-white py-2 rounded hover:bg-green-700 transition focus:outline-none">
              Donate ${{ amount }}
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const presets = [10, 25, 50]
const amount = ref(25)
const name = ref('')
const email = ref('')
const bankName = ref('')
const description = ref('')

function handleSubmit() {
  if (!amount.value || !name.value || !email.value || !bankName.value) {
    alert('Please complete all required fields.')
    return
  }
  // Process payment logic
  console.log('Processing donation:', {
    amount: amount.value,
    name: name.value,
    email: email.value,
    bankName: bankName.value,
    description: description.value
  })
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

.line-clamp-3 {
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
</style>