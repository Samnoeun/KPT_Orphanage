<template>
  <div class="container mx-auto p-6 bg-yellow-80">
    <div class="flex flex-col md:flex-row justify-between items-start gap-6 p-6 bg-yellow-100">
      <div class="bg-yellow-200 text-black p-6 rounded-lg shadow-md w-full md:w-1/2">
        <h2 class="text-xl font-bold mb-2">Thank You to Our Donors</h2>
        <p class="mb-2">
          Your generosity continues to inspire and create real impact. Because of your support, countless lives are
          being transformed and hopeful futures are taking shape.
        </p>
        <p class="mb-2">
          We’re honored to have you as part of our community of changemakers. Your commitment fuels our mission every
          single day.
        </p>
        <p class="mb-4">
          From all of us, <strong>thank you for believing in this work and standing with us. Together, we’re achieving
            extraordinary things.</strong>
        </p>
        <a href="/donate" class="text-black underline hover:text-yellow-200">Donate here</a>
      </div>
      <div class="w-full md:w-1/2">
        <div class="text-black p-6 rounded-lg">
          <h2 class="text-xl font-bold mb-2">OUR OFFICE</h2>
          <p class="text-lg mb-2">
            Email:
            <a href="mailto:info@wyman.org" class="text-black underline hover:text-orange-500">info@wyman.org</a>
          </p>
          <p class="text-lg mb-2">
            Phone:
            <a href="tel:+8551234567" class="text-black underline hover:text-orange-500">+855 123-4567</a>
          </p>
          <p class="text-lg mb-2">
            Location:
            <a href="https://maps.google.com/maps?ll=12.729902,104.893444&z=16&t=m&hl=en&gl=KH&mapclient=embed&cid=17987871029014268348" class="text-black underline hover:text-orange-500">Achhar Leak Village, Achhar Commune, Stueng Saen City, Kampong Thom Province</a>
          </p>
        </div>
      </div>
    </div>

    <div class="flex items-center justify-center ">
      <div class="text-black p-6 rounded-lg">
        <h2 class="text-xl font-bold mb-2">CONTACT US</h2>
        <div class="flex space-x-4 mt-4">
          <a v-for="social in socialLinks" :key="social.name" :href="social.url" target="_blank"
            rel="noopener noreferrer">
            <span class="text-2xl" :class="social.iconClass"></span>
          </a>
        </div>
      </div>
    </div>

    <div class="mt-6 flex flex-col md:flex-row justify-between items-center border-t pt-6 gap-6">
      <div class="text-yellow-500 text-lg">
        <p class="mb-1">{{ copyrightText }}</p>
        <p class="mb-1">
          <a href="#" class="underline hover:text-yellow-700">{{ privacyText }}</a>
        </p>
        <p>
          <a href="/contact" class="underline hover:text-yellow-700">{{ locationsText }}</a>
        </p>
      </div>
      <!-- Footer Navbar -->
      <nav class="flex flex-wrap justify-center space-x-4">
        <a v-for="link in navLinks" :key="link.label" :href="link.to"
          class="flex items-center space-x-1 hover:underline hover:text-yellow-700">
          <span v-if="link.icon" :class="link.icon"></span>
          <span>{{ link.label }}</span>
        </a>
      </nav>
      <button @click="scrollToTop" class="bg-gray-300 p-2 rounded-md hover:bg-gray-400 transition duration-200 text-lg">
        {{ backToTopText }}
      </button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'FooterComponent',
  props: {
    socialLinks: {
      type: Array,
      default: () => [
        { name: 'LinkedIn', url: 'https://www.linkedin.com', iconClass: 'fab fa-linkedin' },
        { name: 'Twitter', url: 'https://www.twitter.com', iconClass: 'fab fa-twitter' },
        { name: 'Facebook', url: 'https://www.facebook.com', iconClass: 'fab fa-facebook' },
        { name: 'YouTube', url: 'https://www.youtube.com', iconClass: 'fab fa-youtube' }
      ]
    },
    navLinks: {
      type: Array,
      default: () => [
        { label: 'Home', to: '/' },
        { label: 'About', to: '/about' },
        { label: 'Contact', to: '/contact' },
        { label: 'Donate', to: '/donate', icon: 'fas fa-heart' }
      ]
    },
    copyrightText: {
      type: String,
      default: 'All rights reserved wyman.org'
    },
    privacyText: {
      type: String,
      default: 'Privacy policy'
    },
    locationsText: {
      type: String,
      default: 'Locations and contacts'
    },
    backToTopText: {
      type: String,
      default: 'BACK TO TOP'
    }
  },
  methods: {
    scrollToTop() {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    }
  }
};
</script>
