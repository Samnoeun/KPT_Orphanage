<template>
  <footer class="bg-gradient-to-r from-gray-50 to-gray-200 text-gray-700 py-12 mt-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 grid grid-cols-1 md:grid-cols-4 gap-8">

      <!-- Location -->
      <div>
        <h3 class="text-lg font-semibold mb-4 text-gray-900">Location</h3>
        <p>{{ location.name }}</p>
        <p>{{ location.address }}</p>
        <p>Phone: {{ location.phone }}</p>
        <p>
          Email:
          <a :href="`mailto:${location.email}`" class="text-blue-600 hover:underline">
            {{ location.email }}
          </a>
        </p>
      </div>

      <!-- Navigation Links -->
      <div>
        <h3 class="text-lg font-semibold mb-4 text-gray-900">Navigation</h3>
        <ul class="space-y-2">
          <li v-for="link in links" :key="link.to">
            <RouterLink :to="link.to" class="hover:text-blue-600 transition-colors" exact>
              {{ link.label }}
            </RouterLink>
          </li>
        </ul>
      </div>

      <!-- Sponsors -->
      <div>
        <h3 class="text-lg font-semibold mb-4 text-gray-900">Our Sponsors</h3>
        <ul class="space-y-2">
          <li v-for="sponsor in sponsors" :key="sponsor" class="text-gray-600">
            {{ sponsor }}
          </li>
        </ul>
      </div>

      <!-- Social Media -->
      <div>
        <h3 class="text-lg font-semibold mb-4 text-gray-900">Follow Us</h3>
        <div class="flex space-x-4">
          <a v-for="social in socials" :key="social.name" :href="social.url" target="_blank" rel="noopener"
            class="text-gray-500 hover:text-blue-600 text-2xl transition-colors">
            <i :class="social.icon"></i>
          </a>
        </div>
      </div>
    </div>

    <div class="mt-8 border-t border-gray-300 pt-4 text-center text-sm text-gray-500">
      © 2025 Kampong Thom Orphanage. All rights reserved.
    </div>
  </footer>
</template>

<script setup>
defineProps({
  links: {
    type: Array,
    required: true
  },
  location: {
    type: Object,
    required: true
  },
  socials: {
    type: Array,
    required: true
  },
  sponsors: {
    type: Array,
    required: true
  }
})
</script>
