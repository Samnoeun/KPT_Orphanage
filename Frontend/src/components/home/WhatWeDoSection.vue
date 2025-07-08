<template>
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
          <img src="../../assets/images/students.jpg" alt="Students at orphanage"
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
</template>

<script setup>

</script>

<style scoped>
.tag {
  display: inline-block;
  background-color: #fcd34d;
  color: #111827;
  font-weight: 600;
  padding: 0.25rem 0.75rem;
  border-radius: 9999px;
  font-size: 0.875rem;
  margin-bottom: 0.5rem;
}

.title {
  font-size: 2.5rem;
  font-weight: 800;
  color: #1f2937;
  margin-bottom: 1rem;
}

.description {
  color: #4b5563;
  font-size: 1.125rem;
  max-width: 600px;
  margin: 0 auto;
}
</style>
