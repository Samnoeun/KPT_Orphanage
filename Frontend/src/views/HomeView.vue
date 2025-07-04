<template>
  <div class="min-h-screen">
    <!-- Hero Section -->
    <section class="relative h-screen flex items-center justify-center overflow-hidden">
      <div class="absolute inset-0 z-0">
        <img src="../assets/images/orphanage.jpg" alt="Orphanage" class="w-full h-full object-cover" />
        <div class="absolute inset-0 bg-gradient-to-r from-black/60 via-black/40 to-black/60"></div>
      </div>

      <div class="relative z-10 text-center px-4 max-w-4xl mx-auto">
        <div class="animate-fade-in-up">
          <h1 class="text-5xl md:text-7xl font-bold text-white mb-6 leading-tight">
            Welcome to
            <span class="block text-yellow-400 mt-2">Kompong Thom Orphanage</span>
          </h1>
          <p class="text-xl md:text-2xl text-gray-200 mb-8 max-w-2xl mx-auto">
            A sanctuary of hope, education, and endless possibilities for children in need
          </p>
          <div class="flex flex-col sm:flex-row gap-4 justify-center">
            <RouterLink to="/about"
              class="inline-flex items-center justify-center bg-yellow-400 hover:bg-yellow-500 text-black font-semibold text-lg px-8 py-4 rounded-full transition-all duration-300 transform hover:scale-105">
              Discover Our Story
              <svg class="ml-2 h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
              </svg>
            </RouterLink>
            <RouterLink to="/donate"
              class="inline-flex items-center justify-center border-2 border-white text-white hover:bg-white hover:text-black font-semibold text-lg px-8 py-4 rounded-full transition-all duration-300 bg-transparent">
              Make a Difference
              <svg class="ml-2 h-5 w-5" fill="currentColor" viewBox="0 0 24 24">
                <path
                  d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z" />
              </svg>
            </RouterLink>
          </div>
        </div>
      </div>

      <!-- Scroll indicator -->
      <div class="absolute bottom-8 left-1/2 transform -translate-x-1/2 animate-bounce">
        <div class="w-6 h-10 border-2 border-white rounded-full flex justify-center">
          <div class="w-1 h-3 bg-white rounded-full mt-2 animate-pulse"></div>
        </div>
      </div>
    </section>

    <!-- Stats Section -->
    <section class="py-20 bg-gradient-to-r from-orange-500 via-yellow-400 to-yellow-300">
      <div class="container mx-auto px-6">
        <h2 class="text-3xl md:text-4xl font-bold text-center text-white mb-12 drop-shadow-lg">
          Our Impact in Numbers
        </h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-8">
          <div
            class="bg-white/10 backdrop-blur-sm rounded-2xl p-8 text-center text-white shadow-lg hover:scale-105 transition-transform duration-300 border border-white/20">
            <div class="text-5xl font-extrabold mb-2 drop-shadow">150+</div>
            <div class="text-lg font-medium opacity-90">Children Helped</div>
          </div>
          <div
            class="bg-white/10 backdrop-blur-sm rounded-2xl p-8 text-center text-white shadow-lg hover:scale-105 transition-transform duration-300 border border-white/20">
            <div class="text-5xl font-extrabold mb-2 drop-shadow">23+</div>
            <div class="text-lg font-medium opacity-90">Years of Service</div>
          </div>
          <div
            class="bg-white/10 backdrop-blur-sm rounded-2xl p-8 text-center text-white shadow-lg hover:scale-105 transition-transform duration-300 border border-white/20">
            <div class="text-5xl font-extrabold mb-2 drop-shadow">50+</div>
            <div class="text-lg font-medium opacity-90">Graduates</div>
          </div>
          <div
            class="bg-white/10 backdrop-blur-sm rounded-2xl p-8 text-center text-white shadow-lg hover:scale-105 transition-transform duration-300 border border-white/20">
            <div class="text-5xl font-extrabold mb-2 drop-shadow">100%</div>
            <div class="text-lg font-medium opacity-90">Love & Care</div>
          </div>
        </div>
      </div>
    </section>


    <!-- Discover Section -->
    <section class="py-20 px-4 bg-white">
      <div class="container mx-auto max-w-6xl">
        <div class="text-center mb-16">
          <div
            class="inline-flex items-center gap-2 bg-orange-100 text-orange-600 px-4 py-2 rounded-full font-semibold mb-4">
            <svg class="h-4 w-4" fill="currentColor" viewBox="0 0 24 24">
              <path
                d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z" />
            </svg>
            Our KPT Orphanage
          </div>
          <h2 class="text-4xl md:text-5xl font-bold text-gray-900 mb-6">Discover Kompong Thom Orphanage</h2>
          <p class="text-xl text-gray-600 leading-relaxed max-w-4xl mx-auto">
            Kompong Thom Orphanage is a sanctuary of hope and opportunity. Our mission is to provide education,
            shelter, and emotional support to underprivileged children across the province. Through community
            partnerships and dedicated volunteers, we empower children to build a brighter future.
          </p>
        </div>
      </div>
    </section>

    <!-- What We Do Section -->
    <section class="py-20 px-4 bg-gray-50">
      <div class="container mx-auto max-w-7xl">
        <div class="text-center mb-16">
          <div
            class="inline-flex items-center gap-2 bg-orange-100 text-orange-600 px-4 py-2 rounded-full font-semibold mb-4">
            <svg class="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
            </svg>
            What We Do
          </div>
          <h2 class="text-4xl md:text-5xl font-bold text-gray-900 mb-6">
            Supporting Orphaned Children with Care & Education
          </h2>
          <p class="text-xl text-gray-600 max-w-3xl mx-auto">
            Kompong Thom Orphanage provides a nurturing environment where children grow, learn, and thrive, offering
            every child a chance at a brighter future.
          </p>
        </div>

        <div class="grid lg:grid-cols-2 gap-12 items-center">
          <div class="relative">
            <img src="../assets/images/students.jpg" alt="Students at orphanage"
              class="rounded-2xl shadow-2xl w-full h-auto" />
            <div class="absolute -bottom-6 -right-6 bg-yellow-400 p-4 rounded-2xl shadow-lg">
              <svg class="h-8 w-8 text-black" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 14l9-5-9-5-9 5 9 5z" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z" />
              </svg>
            </div>
          </div>

          <div class="space-y-8">
            <h3 class="text-3xl font-bold text-gray-900 mb-8">Our Commitment to Children</h3>

            <!-- Quality Education Card -->
            <div
              class="border-l-4 border-l-orange-500 bg-white rounded-lg shadow-lg hover:shadow-xl transition-shadow duration-300 p-6">
              <div class="flex items-start gap-4">
                <div class="bg-orange-100 p-3 rounded-full">
                  <svg class="h-6 w-6 text-orange-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 14l9-5-9-5-9 5 9 5z" />
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z" />
                  </svg>
                </div>
                <div>
                  <h4 class="text-xl font-semibold text-gray-800 mb-3">Quality Education</h4>
                  <p class="text-gray-600 leading-relaxed">
                    We offer supplemental classes to help rural and orphaned children attend school, fostering a new
                    generation of community-minded leaders.
                  </p>
                </div>
              </div>
            </div>

            <!-- Healthy Environment Card -->
            <div
              class="border-l-4 border-l-green-500 bg-white rounded-lg shadow-lg hover:shadow-xl transition-shadow duration-300 p-6">
              <div class="flex items-start gap-4">
                <div class="bg-green-100 p-3 rounded-full">
                  <svg class="h-6 w-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
                  </svg>
                </div>
                <div>
                  <h4 class="text-xl font-semibold text-gray-800 mb-3">Healthy Environment, Food & Housing</h4>
                  <p class="text-gray-600 leading-relaxed">
                    We provide healthcare, nourishment, and shelter, creating a caring environment where children
                    can live fully despite common struggles in Cambodia.
                  </p>
                </div>
              </div>
            </div>

            <!-- Hope & Success Card -->
            <div
              class="border-l-4 border-l-blue-500 bg-white rounded-lg shadow-lg hover:shadow-xl transition-shadow duration-300 p-6">
              <div class="flex items-start gap-4">
                <div class="bg-blue-100 p-3 rounded-full">
                  <svg class="h-6 w-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.38-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z" />
                  </svg>
                </div>
                <div>
                  <h4 class="text-xl font-semibold text-gray-800 mb-3">Hope & Success</h4>
                  <p class="text-gray-600 leading-relaxed">
                    Our non-profit fosters greatness, supporting children to realize their potential with your
                    contributions to our ongoing mission.
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Testimonies Section -->
    <section class="py-20 px-4 bg-white">
      <div class="container mx-auto max-w-7xl">
        <div class="text-center mb-16">
          <div
            class="inline-flex items-center gap-2 bg-orange-100 text-orange-600 px-4 py-2 rounded-full font-semibold mb-4">
            <svg class="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.38-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z" />
            </svg>
            What we do
          </div>
          <h2 class="text-4xl md:text-5xl font-bold text-gray-900 mb-6">Our Testimonies</h2>
          <p class="text-xl text-gray-600 max-w-3xl mx-auto">
            Discover students' testimonies from our 4 centers!
          </p>
        </div>

        <!-- Testimonials Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          <div v-for="(testimonial, index) in testimonials" :key="index"
            class="bg-white rounded-2xl shadow-lg overflow-hidden cursor-pointer transform transition-all duration-300 hover:scale-105 hover:shadow-xl"
            @click="openTestimonial(testimonial)">
            <!-- Profile Image -->
            <div class="relative">
              <div class="w-32 h-32 mx-auto mt-6 rounded-full overflow-hidden bg-orange-100">
                <img :src="testimonial.image" :alt="testimonial.name" class="w-full h-full object-cover" />
              </div>
              <!-- Name Banner -->
              <div class="absolute bottom-0 left-1/2 transform -translate-x-1/2 translate-y-1/2">
                <div class="bg-blue-400 text-white px-4 py-1 rounded-full text-sm font-semibold whitespace-nowrap">
                  {{ testimonial.name }}
                </div>
              </div>
            </div>

            <!-- Card Content -->
            <div class="p-6 pt-8">
              <div class="flex items-start gap-2 mb-3">
                <svg class="h-6 w-6 text-gray-400 flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 24 24">
                  <path
                    d="M14.017 21v-7.391c0-5.704 3.731-9.57 8.983-10.609l.995 2.151c-2.432.917-3.995 3.638-3.995 5.849h4v10h-9.983zm-14.017 0v-7.391c0-5.704 3.748-9.57 9-10.609l.996 2.151c-2.433.917-3.996 3.638-3.996 5.849h4v10h-10z" />
                </svg>
                <p class="text-gray-600 text-sm line-clamp-3">
                  {{ testimonial.shortDescription }}
                </p>
              </div>

              <div class="flex justify-between items-center">
                <span class="text-xs text-gray-500">{{ testimonial.program }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Modal/Slide Panel -->
      <div v-if="selectedTestimonial" class="fixed inset-0 z-50 flex" @click="closeTestimonial">
        <!-- Backdrop -->
        <div class="absolute inset-0 bg-black bg-opacity-50 transition-opacity"></div>

        <!-- Slide Panel -->
        <div
          class="ml-auto w-full max-w-2xl bg-white h-full overflow-y-auto transform transition-transform duration-300 ease-in-out"
          :class="slideIn ? 'translate-x-0' : 'translate-x-full'" @click.stop>
          <!-- Close Button -->
          <button @click="closeTestimonial"
            class="absolute top-4 right-4 z-10 bg-gray-100 hover:bg-gray-200 rounded-full p-2 transition">
            <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>

          <!-- Content -->
          <div class="p-8">
            <!-- Profile Section -->
            <div class="text-center mb-8">
              <div class="w-40 h-40 mx-auto rounded-full overflow-hidden bg-orange-100 mb-4">
                <img :src="selectedTestimonial.image" :alt="selectedTestimonial.name"
                  class="w-full h-full object-cover" />
              </div>
              <h3 class="text-2xl font-bold text-gray-900 mb-2">{{ selectedTestimonial.name }}</h3>
              <p class="text-orange-600 font-semibold">{{ selectedTestimonial.program }}</p>
              <p class="text-gray-600">{{ selectedTestimonial.year }}</p>
            </div>

            <!-- Full Testimonial -->
            <div class="bg-gray-50 rounded-2xl p-6 mb-6">
              <svg class="h-8 w-8 text-orange-400 mb-4" fill="currentColor" viewBox="0 0 24 24">
                <path
                  d="M14.017 21v-7.391c0-5.704 3.731-9.57 8.983-10.609l.995 2.151c-2.432.917-3.995 3.638-3.995 5.849h4v10h-9.983zm-14.017 0v-7.391c0-5.704 3.748-9.57 9-10.609l.996 2.151c-2.433.917-3.996 3.638-3.996 5.849h4v10h-10z" />
              </svg>
              <p class="text-gray-700 text-lg leading-relaxed italic">
                "{{ selectedTestimonial.fullTestimonial }}"
              </p>
            </div>

            <!-- Additional Info -->
            <div class="space-y-4">
              <div>
                <h4 class="font-semibold text-gray-900 mb-2">Background</h4>
                <p class="text-gray-600">{{ selectedTestimonial.background }}</p>
              </div>
              <div>
                <h4 class="font-semibold text-gray-900 mb-2">Current Status</h4>
                <p class="text-gray-600">{{ selectedTestimonial.currentStatus }}</p>
              </div>
              <div>
                <h4 class="font-semibold text-gray-900 mb-2">Future Goals</h4>
                <p class="text-gray-600">{{ selectedTestimonial.futureGoals }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Partners Section -->
    <section class="py-20 px-4 bg-white">
      <div class="container mx-auto max-w-7xl">
        <div class="text-center mb-16">
          <div
            class="inline-flex items-center gap-2 bg-orange-100 text-orange-600 px-4 py-2 rounded-full font-semibold mb-4">
            <svg class="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
            </svg>
            What we do
          </div>
          <h2 class="text-4xl md:text-5xl font-bold text-gray-900 mb-6">Our Partners</h2>
          <p class="text-xl text-gray-600 max-w-3xl mx-auto">
            Whether through companies, corporate or individual foundations, NGOs, or institutions,
            Kompong Thom Orphanage is supported by numerous partners worldwide.
          </p>
        </div>

        <!-- Partners Grid -->
        <div class="grid grid-cols-2 md:grid-cols-4 gap-8 items-center justify-items-center">
          <div v-for="(partner, index) in partners" :key="index"
            class="bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300 p-6 w-full h-32 flex items-center justify-center">
            <img :src="partner.logo" :alt="partner.name"
              class="max-w-full max-h-full object-contain transition-all duration-300" />
          </div>
        </div>

      </div>
    </section>

    <!-- Call to Action Section -->
    <section class="relative py-20 overflow-hidden">
      <div class="absolute inset-0">
        <img :src="groupImage" alt="Group photo" class="w-full h-full object-cover" />
        <div class="absolute inset-0 bg-gradient-to-r from-black/70 via-black/50 to-black/70"></div>
      </div>

      <div class="relative z-10 container mx-auto px-4 text-center">
        <div class="max-w-4xl mx-auto">
          <h2 class="text-4xl md:text-5xl font-bold text-white mb-6">Ready to Make a Difference?</h2>
          <p class="text-xl text-gray-200 mb-8 max-w-2xl mx-auto">
            Join us in our mission to provide hope, education, and care to children in need. Every contribution makes
            a lasting impact.
          </p>

          <div class="flex flex-col sm:flex-row gap-6 justify-center">
            <RouterLink to="/contact"
              class="inline-flex items-center justify-center bg-orange-500 hover:bg-orange-600 text-white font-semibold text-lg px-8 py-4 rounded-full transition-all duration-300 transform hover:scale-105">
              <svg class="mr-2 h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
              </svg>
              Get in Touch
            </RouterLink>
            <RouterLink to="/donate"
              class="inline-flex items-center justify-center border-2 border-white text-white hover:bg-white hover:text-black font-semibold text-lg px-8 py-4 rounded-full transition-all duration-300 bg-transparent">
              <svg class="mr-2 h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
              Donate Now
            </RouterLink>
          </div>
        </div>
      </div>
    </section>

  </div>
</template>

<script setup>
import { ref, nextTick } from 'vue'
import { RouterLink } from 'vue-router'
import groupImage from '@/assets/images/group.jpg'
import gallery1 from '@/assets/images/gallery1.jpg'
import gallery2 from '@/assets/images/gallery2.jpg'
import gallery3 from '@/assets/images/gallery3.jpg'
import gallery4 from '@/assets/images/gallery4.jpg'
import partner1 from '@/assets/images/partner1.jpg'
import partner2 from '@/assets/images/partner2.jpg'
import partner3 from '@/assets/images/partner3.jpg'
import partner4 from '@/assets/images/partner4.jpg'

// Testimonials functionality
const selectedTestimonial = ref(null)
const slideIn = ref(false)

// Sample testimonials data
const testimonials = ref([
  {
    id: 1,
    name: 'Samnoeun',
    image: gallery1,
    program: 'Current Student PNH - Class of 2025',
    year: 'Class of 2025',
    shortDescription: 'I come from a poor family and if PNC had not offered me a chance, I would not have been able to continue studying...',
    fullTestimonial: 'I come from a poor family and if PNC had not offered me a chance, I would not have been able to continue studying because my family could not afford it. Thanks to PNC, I will be able to find a good job, earn a good salary, help my family, and contribute in turn to PNC.',
    background: 'Samnoeun comes from a rural village where educational opportunities were limited. His family struggled financially to support his education.',
    currentStatus: 'Currently excelling in his studies at PNC, maintaining high grades and actively participating in community service.',
    futureGoals: 'Plans to become a teacher and return to his village to help other children access quality education.'
  },
  {
    id: 2,
    name: 'Bunny',
    image: gallery2,
    program: 'Current Student PNH - Class of 2025',
    year: 'Class of 2025',
    shortDescription: 'As a PNPh student, my aspirations are vast. With the learning experience here in PNPh center and in school...',
    fullTestimonial: 'As a PNPh student, my aspirations are vast. With the learning experience here in PNPh center and in school, diving into public speaking, programming classes, and even enhancing our technical skills, it\'s challenging for me, yet I actually enjoy it at the same time.',
    background: 'Bunny discovered his passion for technology and public speaking through the programs at the orphanage.',
    currentStatus: 'Developing strong technical skills and leadership abilities through various programs and activities.',
    futureGoals: 'Aspires to work in technology sector and use his skills to create positive change in his community.'
  },
  {
    id: 3,
    name: 'Sreyneang',
    image: gallery3,
    program: 'Current Student PNH - Class of 2026',
    year: 'Class of 2026',
    shortDescription: 'The teachers and friends here have been a source of motivation, helping me to grow both personally and professionally...',
    fullTestimonial: 'The teachers and friends here have been a source of motivation, helping me to grow both personally and professionally. Despite being far from home and loved ones, I have learned how to face challenges, be independent, and take initiative.',
    background: 'Sreyneang had to leave his hometown to pursue better educational opportunities at the orphanage.',
    currentStatus: 'Learning independence and developing strong personal and academic skills away from family.',
    futureGoals: 'Wants to become a healthcare professional and serve communities in need of medical care.'
  },
  {
    id: 4,
    name: 'Channak',
    image: gallery4,
    program: 'Current Student PNH - Class of 2024',
    year: 'Class of 2024',
    shortDescription: 'What I like most here is that we live in a community. Living with other young people gives me personal experience...',
    fullTestimonial: 'What I like most here is that we live in a community. Living with other young people gives me personal experience and helps me grow. Thanks to PNM, I will have the chance to attend university and pursue higher education.',
    background: 'Channak values the community aspect of living at the orphanage and the relationships she has built.',
    currentStatus: 'Preparing for university entrance and developing leadership skills within the community.',
    futureGoals: 'Plans to pursue higher education and eventually work in social development to help other young people.'
  }
])

// Testimonials methods
const openTestimonial = async (testimonial) => {
  selectedTestimonial.value = testimonial
  await nextTick()
  slideIn.value = true
}

const closeTestimonial = () => {
  slideIn.value = false
  setTimeout(() => {
    selectedTestimonial.value = null
  }, 300)
}
// Partners data
const partners = ref([
  {
    id: 1,
    name: 'Partner 1',
    logo: partner1
  },
  {
    id: 2,
    name: 'Partner 2',
    logo: partner2
  },
  {
    id: 3,
    name: 'Partner 3',
    logo: partner3
  },
  {
    id: 4,
    name: 'Partner 4',
    logo: partner4
  }
])
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