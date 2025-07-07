<template>
  <div class="min-h-screen bg-gradient-to-br from-blue-100 via-orange-50 to-yellow-50">
    <section class="relative h-screen overflow-hidden">
      <div class="absolute inset-0">
        <img
          src="../assets/image/bg-about.jpg"
          alt="Community development in Kompong Thom"
          class="object-cover w-full h-full"
        />
        <div class="absolute inset-0 bg-gradient-to-br from-black/60 to-black/30"></div>
      </div>

      <div class="absolute inset-0 opacity-15 z-10">
        <div
          class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 w-96 h-96 border-2 border-white/30 rounded-full animate-pulse"
        ></div>
        <div
          class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 w-80 h-80 border-2 border-white/20 rounded-full animate-pulse delay-200"
        ></div>
      </div>

      <div
        class="absolute top-0 right-0 w-2 h-full bg-gradient-to-b from-orange-500 to-orange-300 z-20"
      ></div>

      <div
        class="relative z-30 container mx-auto px-6 lg:px-12 h-full flex items-center justify-center"
      >
        <div class="max-w-5xl text-center">
          <h1
            class="text-4xl sm:text-5xl md:text-6xl lg:text-7xl font-extrabold mb-6 leading-tight text-white drop-shadow-md opacity-0 animate-fadeInUp"
          >
            <span class="text-yellow-300 block">Kampong Thom Orphanage</span>
          </h1>

          <p
            class="text-base sm:text-lg md:text-xl text-white mb-8 leading-relaxed max-w-3xl mx-auto drop-shadow opacity-0 animate-fadeInUp"
          >A place of compassion and opportunity, dedicated to providing a safe home, quality education, and a brighter future for children in need.</p>

          <button
            class="bg-yellow-400 hover:bg-yellow-500 text-black px-8 py-3 text-lg font-semibold rounded-full shadow-lg hover:shadow-xl transition-all duration-300 opacity-0 animate-fadeInUp"
          >Learn More</button>
        </div>
      </div>
    </section>

    <section class="relative bg-orange-50/80 py-24 overflow-hidden">
      <div class="container mx-auto px-6 lg:px-12 relative z-10">
        <div class="max-w-4xl mx-auto text-center">
          <!-- Styled "About us" heading with people/community icon -->
          <div class="text-center mb-12">
            <h2
              class="inline-flex items-center gap-2 px-6 py-3 rounded-full bg-orange-100 text-orange-600 font-extrabold text-2xl md:text-3xl mb-6"
              style="box-shadow: 0 4px 6px rgb(251 146 60 / 0.3);"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="w-6 h-6"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M17 20h5v-2a4 4 0 00-4-4h-1M9 20H4v-2a4 4 0 014-4h1m0-4a4 4 0 100-8 4 4 0 000 8zm10 0a4 4 0 100-8 4 4 0 000 8z"
                />
              </svg>
              About us
            </h2>
          </div>

          <h1
            class="text-3xl sm:text-4xl md:text-5xl font-extrabold text-gray-800 mb-8 leading-tight"
          >Boreykomar Kampong Thom</h1>
          <p class="text-lg md:text-xl text-gray-700 leading-relaxed max-w-3xl mx-auto">
            Boreykomar Kampong Thom (BKT) is a
            <span
              class="text-blue-500 hover:text-blue-600 cursor-pointer transition-colors"
            >community-based</span>,
            founded in 2010, operating in Kampong Thom province, Cambodia. We unlock the potential of
            underprivileged communities by empowering them with
            <span
              class="text-blue-500 hover:text-blue-600 cursor-pointer transition-colors"
            >sustainable development programs</span>.
          </p>
        </div>
      </div>
    </section>

    <section class="py-20 bg-white">
      <div class="container mx-auto px-6 lg:px-12">
        <div class="max-w-6xl mx-auto">
          <div class="grid md:grid-cols-2 gap-12 items-center">
            <div class="text-left">
              <h2 class="text-2xl md:text-3xl font-extrabold text-gray-800 mb-6">Who We Are</h2>
              <p class="text-lg text-gray-600 mb-6 leading-relaxed">
                Boreykomar Kampong Thom Organization is a dedicated community-based organization
                committed to the sustainable development and cultural preservation of Kampong Thom
                province in Cambodia. Founded with a vision to bridge traditional values with
                modern progress, we work tirelessly to improve the lives of local communities.
              </p>
              <p class="text-lg text-gray-600 leading-relaxed">
                Our organization focuses on education, healthcare, environmental conservation,
                and economic empowerment while honoring the rich cultural heritage of our region.
                We believe in grassroots development that comes from within the community itself.
              </p>
            </div>
            <div class="relative">
              <img
                src="../assets/image/child.jpg"
                alt="Boreykomar team working in the community"
                class="rounded-2xl shadow-lg w-full h-80 object-cover hover:scale-105 transition-transform duration-300"
              />
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="py-20 bg-white">
      <div class="container mx-auto px-6 lg:px-12">
        <div class="max-w-6xl mx-auto">
          <div class="text-center mb-12">
            <h2
              class="inline-flex items-center gap-2 px-6 py-3 rounded-full bg-orange-100 text-orange-600 font-extrabold text-2xl md:text-3xl mb-6"
              style="box-shadow: 0 4px 6px rgb(251 146 60 / 0.3);"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="w-6 h-6"
                fill="currentColor"
                viewBox="0 0 24 24"
                stroke="none"
              >
                <path
                  d="M5.5 4a2.5 2.5 0 00-2.45 2h-.05v12a1.5 1.5 0 001.5 1.5H7a2 2 0 002-2v-2a3 3 0 013-3h1a1 1 0 001-1V6a2 2 0 00-2-2H5.5z"
                />
              </svg>
              Our Mission
            </h2>
          </div>
          <div class="grid md:grid-cols-3 gap-8">
            <div
              class="text-center p-6 bg-white/90 rounded-xl shadow-md hover:shadow-lg transition-all duration-300"
            >
              <div
                class="bg-orange-100 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-6"
              >
                <svg
                  class="w-10 h-10 text-orange-500"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.746 0 3.332.477 4.5 1.253v13C19.832 18.477 18.246 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"
                  />
                </svg>
              </div>
              <h3 class="text-lg font-semibold text-gray-800 mb-4">Education & Learning</h3>
              <p class="text-gray-600 text-center">
                Providing quality education and skill development opportunities to empower
                individuals and strengthen communities.
              </p>
            </div>
            <div
              class="text-center p-6 bg-white/90 rounded-xl shadow-md hover:shadow-lg transition-all duration-300"
            >
              <div
                class="bg-blue-100 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-6"
              >
                <svg
                  class="w-10 h-10 text-blue-500"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"
                  />
                </svg>
              </div>
              <h3 class="text-lg font-semibold text-gray-800 mb-4">Community Health</h3>
              <p class="text-gray-600 text-center">
                Improving healthcare access and promoting wellness initiatives to ensure
                healthy, thriving communities.
              </p>
            </div>
            <div
              class="text-center p-6 bg-white/90 rounded-xl shadow-md hover:shadow-lg transition-all duration-300"
            >
              <div
                class="bg-green-100 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-6"
              >
                <svg
                  class="w-10 h-10 text-green-500"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9v-9m0-9v9"
                  />
                </svg>
              </div>
              <h3 class="text-lg font-semibold text-gray-800 mb-4">Cultural Preservation</h3>
              <p class="text-gray-600 text-center">
                Safeguarding and celebrating our rich cultural heritage while embracing
                sustainable development practices.
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="py-20 bg-gradient-to-br from-blue-50 to-orange-50">
      <div class="container mx-auto px-6 lg:px-12">
        <div class="max-w-6xl mx-auto">
          <div class="text-center mb-12">
            <h2
              class="inline-flex items-center gap-2 px-6 py-3 rounded-full bg-orange-100 text-orange-600 font-extrabold text-2xl md:text-3xl mb-6"
              style="box-shadow: 0 4px 6px rgb(251 146 60 / 0.3);"
            >
              <!-- Shield Check Icon -->
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="w-6 h-6"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M12 3l7.5 4.5v5c0 5-3.5 9.5-7.5 10-4-0.5-7.5-5-7.5-10v-5L12 3z"
                />
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M9 12l2 2 4-4"
                />
              </svg>
              Our Values
            </h2>
          </div>

          <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
            <div
              class="text-center bg-white/90 p-6 rounded-2xl shadow-md hover:shadow-xl transition-all duration-300 hover:-translate-y-2"
            >
              <div
                class="bg-orange-400 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4"
              >
                <svg
                  class="w-8 h-8 text-white"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"
                  />
                </svg>
              </div>
              <h3 class="text-lg font-semibold text-gray-800 mb-3">Community First</h3>
              <p
                class="text-gray-600 text-center"
              >We prioritize community needs and ensure local voices are heard in all our initiatives.</p>
            </div>
            <div
              class="text-center bg-white/90 p-6 rounded-2xl shadow-md hover:shadow-xl transition-all duration-300 hover:-translate-y-2"
            >
              <div
                class="bg-blue-400 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4"
              >
                <svg
                  class="w-8 h-8 text-white"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"
                  />
                </svg>
              </div>
              <h3 class="text-lg font-semibold text-gray-800 mb-3">Integrity</h3>
              <p
                class="text-gray-600 text-center"
              >We operate with transparency, honesty, and accountability in all our actions.</p>
            </div>
            <div
              class="text-center bg-white/90 p-6 rounded-2xl shadow-md hover:shadow-xl transition-all duration-300 hover:-translate-y-2"
            >
              <div
                class="bg-green-400 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4"
              >
                <svg
                  class="w-8 h-8 text-white"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M13 10V3L4 14h7v7l9-11h-7z"
                  />
                </svg>
              </div>
              <h3 class="text-lg font-semibold text-gray-800 mb-3">Innovation</h3>
              <p
                class="text-gray-600 text-center"
              >We embrace creative solutions and adapt to changing needs while respecting traditions.</p>
            </div>
            <div
              class="text-center bg-white/90 p-6 rounded-2xl shadow-md hover:shadow-xl transition-all duration-300 hover:-translate-y-2"
            >
              <div
                class="bg-purple-400 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4"
              >
                <svg
                  class="w-8 h-8 text-white"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M3.055 11H5a2 2 0 012 2v1a2 2 0 002 2 2 2 0 012 2v2.945M8 3.935V5.5A2.5 2.5 0 0010.5 8h.5a2 2 0 012 2 2 2 0 104 0 2 2 0 012-2h1.064M15 20.488V18a2 2 0 012-2h3.064M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
                  />
                </svg>
              </div>
              <h3 class="text-lg font-semibold text-gray-800 mb-3">Sustainability</h3>
              <p
                class="text-gray-600 text-center"
              >We focus on long-term solutions that protect our environment and future generations.</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="py-20 bg-white">
      <div class="container mx-auto px-6 lg:px-12">
        <div class="text-center mb-12 text-gray-800">
          <h2 class="text-3xl font-bold mb-4">Our Community in Action</h2>
          <p class="text-gray-600">Click any program to learn more</p>
        </div>

        <div class="grid md:grid-cols-3 gap-8">
          <!-- Education -->
          <router-link
            :to="{ name: 'ProgramDetail', params: { topic: 'education' } }"
            class="group relative overflow-hidden rounded-2xl shadow-lg hover:shadow-xl transition-all duration-300"
          >
            <img
              src="../assets/image/education.jpg"
              class="w-full h-64 object-cover group-hover:scale-105 transition-transform duration-300"
            />
            <div class="absolute inset-0 bg-gradient-to-t from-blue-500/50 to-transparent"></div>
            <div class="absolute bottom-4 left-4 text-white">
              <h3 class="text-lg font-semibold">Education Programs</h3>
              <p class="text-sm opacity-90">Empowering through learning</p>
            </div>
          </router-link>

          <!-- Healthcare -->
          <router-link
            :to="{ name: 'ProgramDetail', params: { topic: 'healthcare' } }"
            class="group relative overflow-hidden rounded-2xl shadow-lg hover:shadow-xl transition-all duration-300"
          >
            <img
              src="../assets/image/health.webp"
              class="w-full h-64 object-cover group-hover:scale-105 transition-transform duration-300"
            />
            <div class="absolute inset-0 bg-gradient-to-t from-blue-500/50 to-transparent"></div>
            <div class="absolute bottom-4 left-4 text-white">
              <h3 class="text-lg font-semibold">Healthcare Outreach</h3>
              <p class="text-sm opacity-90">Bringing care to communities</p>
            </div>
          </router-link>

          <!-- Cultural -->
          <router-link
            :to="{ name: 'ProgramDetail', params: { topic: 'cultural' } }"
            class="group relative overflow-hidden rounded-2xl shadow-lg hover:shadow-xl transition-all duration-300"
          >
            <img
              src="../assets/image/cultural.jpg"
              class="w-full h-64 object-cover group-hover:scale-105 transition-transform duration-300"
            />
            <div class="absolute inset-0 bg-gradient-to-t from-blue-500/50 to-transparent"></div>
            <div class="absolute bottom-4 left-4 text-white">
              <h3 class="text-lg font-semibold">Cultural Events</h3>
              <p class="text-sm opacity-90">Preserving our heritage</p>
            </div>
          </router-link>
        </div>
      </div>
    </section>

    <section class="py-20 text-black">
      <div class="container mx-auto px-6 lg:px-12 text-gray-800">
        <div class="max-w-4xl mx-auto text-center">
          <h2 class="text-2xl md:text-3xl font-extrabold mb-6">Join Our Mission</h2>
          <p
            class="text-lg mb-8 opacity-90 text-center"
          >Together, we can build a stronger, more prosperous future for Kampong Thom province</p>
          <div class="flex flex-col sm:flex-row gap-4 justify-center">
            <a
              href="/contact"
              class="bg-orange-200 font-extrabold text-orange-600 px-8 py-3 rounded-full hover:bg-orange-300 transition-all duration-300 inline-flex items-center gap-2"
            >
              <svg class="mr-2 h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"
                />
              </svg>
              Get In Touch
            </a>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap");

body {
  font-family: "Poppins", sans-serif;
}

h1,
h2,
h3 {
  font-family: "Poppins", sans-serif;
  font-weight: 800;
}

p {
  font-family: "Poppins", sans-serif;
  font-weight: 400;
}

button {
  font-family: "Poppins", sans-serif;
  transition: all 0.3s ease-in-out;
}

button:hover {
  transform: translateY(-2px);
}

/* Custom animations */
.animate-pulse {
  animation: pulse 3s infinite;
}

.animate-bounce-slow {
  animation: bounce 2s infinite;
}

@keyframes pulse {
  0%,
  100% {
    opacity: 0.3;
  }
  50% {
    opacity: 1;
  }
}

@keyframes bounce {
  0%,
  100% {
    transform: translateY(0);
  }
  50% {
    transform: translateY(-5px);
  }
}

.drop-shadow {
  filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.1));
}

.drop-shadow-md {
  filter: drop-shadow(0 4px 6px rgba(0, 0, 0, 0.1));
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.animate-fadeInUp {
  animation: fadeInUp 1s ease-out forwards;
}
</style>