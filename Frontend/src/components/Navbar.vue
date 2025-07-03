<template>
  <nav class="bg-gray-100 shadow-lg fixed top-0 left-0 w-full z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex justify-between h-16 items-center">
        <!-- Logo -->
        <div class="flex items-center space-x-3">
          <img
            class="h-10 w-auto"
            src="../../public/compressed_054c46e219b98b566cd4cb22af8c348e.webp"
            alt="Logo"
          />
          <span class="text-xl font-semibold text-gray-800">Kampong Thom Orphanage</span>
        </div>

        <!-- Navigation Links -->
        <div class="hidden md:flex space-x-4 items-center">
          <RouterLink
            v-for="link in links"
            :key="link.to"
            :to="link.to"
            :class="[
              'px-4 py-2 font-medium transition-colors duration-200',
              link.label === 'Donate'
                ? 'bg-orange-500 text-white hover:bg-orange-600 rounded-full'
                : 'text-gray-600 hover:text-gray-900 hover:bg-gray-200 rounded-md'
            ]"
            active-class="text-gray-900 font-semibold bg-gray-300"
            exact
            @click="scrollToTop"
          >
            {{ link.label }}
          </RouterLink>
          <img v-if="links.some(link => link.label === 'Donate')" class="h-9 w-9 ml-2" src="https://icons.veryicon.com/png/o/miscellaneous/intelligent-field-management-and-control/user-organization.png" alt="Donate Icon" />
        </div>

        <!-- Mobile Menu Button -->
        <div class="md:hidden flex items-center">
          <button
            class="text-gray-600 hover:text-gray-900 focus:outline-none focus:ring-2 focus:ring-gray-400 p-2 rounded-md"
            aria-label="Toggle menu"
          >
            <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7" />
            </svg>
          </button>
        </div>
      </div>
    </div>
  </nav>
</template>

<script setup>
defineProps({
  logo: {
    type: String,
    required: true
  },
  links: {
    type: Array,
    required: true
  }
})

const scrollToTop = () => {
  window.scrollTo({ top: 0, behavior: 'smooth' })
}
</script>

<style>
html {
  scroll-behavior: smooth;
}
</style>