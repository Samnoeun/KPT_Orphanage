<template>
  <div class="max-w-5xl mx-auto p-6 grid grid-cols-1 md:grid-cols-2 gap-8">
    <!-- Left Column -->
    <div class="flex flex-col items-center md:items-start text-center md:text-left space-y-4">
      <img
        src="../assets/image/photo_2025-07-03_10-46-38.jpg"
        alt="Support our cause"
        class="rounded-lg shadow w-full"
      />

      <!-- NEW Impact Text -->
      <p class="text-gray-700">
        Your donation makes a real difference. Every contribution helps provide food, shelter, education, and care to poor children and people living in orphanages. Together, we can bring hope and a brighter future to those who need it most.
      </p>

      <p class="text-gray-700">
        Your support helps us provide critical services to those in need.
      </p>

      <div class="flex flex-col items-center md:items-start">
        <img
          src="../assets/image/photo_2024-07-17_09-25-07.jpg"
          alt="Scan to Donate"
          class="w-32 h-32"
        />
        <p class="text-sm text-gray-500 mt-2">
          Scan this QR code to donate via your mobile device.
        </p>
      </div>
    </div>

    <!-- Right Column: Donation Form -->
    <div>
      <h1 class="text-3xl font-bold mb-4">Donate Now</h1>
      <form @submit.prevent="handleSubmit" class="space-y-4">
        <!-- Amount Selection -->
        <div>
          <label class="block mb-1 font-semibold">Donation Amount</label>
          <div class="flex gap-2 flex-wrap">
            <button
              v-for="preset in presets"
              :key="preset"
              type="button"
              class="px-4 py-2 bg-gray-200 rounded hover:bg-gray-300"
              :class="{ 'bg-blue-500 text-blue-500': amount === preset }"
              @click="amount = preset"
            >
              ${{ preset }}
            </button>
            <input
              type="number"
              min="1"
              placeholder="Custom"
              v-model.number="amount"
              class="border rounded px-2 py-1 w-24"
            />
          </div>
        </div>

        <!-- Donor Info -->
        <div>
          <label class="block mb-1 font-semibold">Full Name</label>
          <input
            type="text"
            v-model="name"
            class="w-full border rounded px-3 py-2"
            required
          />
        </div>
        <div>
          <label class="block mb-1 font-semibold">Email</label>
          <input
            type="email"
            v-model="email"
            class="w-full border rounded px-3 py-2"
            required
          />
        </div>
        <div>
          <label class="block mb-1 font-semibold">Bank Name</label>
          <input
            type="text"
            v-model="bankName"
            class="w-full border rounded px-3 py-2"
            required
          />
        </div>

        <button
          type="submit"
          class="w-full bg-green-600 text-white py-2 rounded hover:bg-green-700"
        >
          Donate ${{ amount }}
        </button>
      </form>
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

function handleSubmit() {
  if (!amount.value || !name.value || !email.value || !bankName.value) {
    alert('Please complete all fields.')
    return
  }
  // Process payment logic
  console.log('Processing donation:', {
    amount: amount.value,
    name: name.value,
    email: email.value,
    bankName: bankName.value
  })
}
</script>
