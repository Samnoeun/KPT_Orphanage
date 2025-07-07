<template>
  <nav class="bg-orange-100 shadow-lg fixed top-0 left-0 w-full z-50">
    <div class="relative h-16 flex items-center max-w-[90vw] mx-auto">
      <!-- Logo pinned to left -->
      <div class="flex items-center space-x-1 pl-2">
        <img
          class="h-28 w-auto"
          src="../assets/image/image-removebg-preview (3).png"
          alt="Logo"
        />
        <span class="text-center text-gray-800 font-serif">
          <p
            class="text-1.5xl font-normal tracking-widest uppercase border-b border-gray-400 pb-1"
            style="font-family: Georgia, 'Times New Roman', serif;"
          >
            Kampong Thom
          </p>
          <p
            class="text-sm tracking-wider pt-1"
            style="font-family: Georgia, 'Times New Roman', serif;"
          >
            Orphanage
          </p>
        </span>
      </div>

      <!-- Navigation links and Admin link grouped in one flex container -->
      <div class="hidden md:flex items-center ml-auto space-x-3 pr-4">
        <RouterLink
          v-for="link in links"
          :key="link.to"
          :to="link.to"
          :class="[
            'px-4 py-2 font-medium transition-colors duration-200',
            link.label === 'Donate'
              ? 'bg-orange-500 text-white hover:bg-orange-600 rounded-full'
              : 'text-gray-900 hover:text-gray-900 hover:bg-orange-200 rounded-md'
          ]"
          active-class="text-gray-900 font-semibold text-orange-600"
          exact
          @click="scrollToTop"
        >
          <i :class="link.icon"></i>
          {{ link.label }}
        </RouterLink>

        <!-- Admin Link stays on the far right with the same gap -->
        <router-link
          to="/admin/login"
          class="flex items-center space-x-1 hover:opacity-80 transition duration-150"
        >
          <img
            class="h-10 w-9"
            src="https://wallpapers.com/images/featured/admin-png-2ic0yzgeefmj9okw.jpg"
            alt="Admin Icon"
          />
          <span class="text-gray-700 font-medium">Admin</span>
        </router-link>
      </div>

      <!-- Mobile Menu Button -->
      <div class="md:hidden flex items-center absolute right-0 pr-4">
        <button
          class="text-gray-600 hover:text-gray-900 focus:outline-none focus:ring-2 focus:ring-gray-400 p-2 rounded-md"
          aria-label="Toggle menu"
        >
          <svg
            class="h-6 w-6"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M4 6h16M4 12h16m-7 6h7"
            />
          </svg>
        </button>
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
