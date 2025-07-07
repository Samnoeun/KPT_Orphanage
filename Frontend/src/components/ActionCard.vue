<template>
    <div class="container mx-auto px-6 lg:px-12 max-w-6xl">
      <div class="text-center mb-12">
        <h1 class="text-4xl md:text-5xl font-extrabold text-blue-700 mb-4 animate-fadeInSoft">
          {{ programData.title }}
        </h1>
        <p class="text-lg md:text-xl text-gray-600 max-w-3xl mx-auto animate-fadeInSoft delay-150">
          {{ programData.description }}
        </p>
      </div>

      <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-8">
        <div
          v-for="subject in programData.subjects"
          :key="subject.name"
          class="group bg-white rounded-2xl shadow-md hover:shadow-xl p-6 transition-all duration-300 transform hover:-translate-y-1 animate-fadeInSoft delay-300 cursor-pointer"
          @click="goToSubjectDetail(subject.name)"
        >
          <div class="flex items-center justify-center w-14 h-14 bg-orange-100 text-orange-500 rounded-full mb-4 shadow">
            <Icon :icon="subject.icon" class="w-6 h-6" />
          </div>
          <h3 class="text-xl font-semibold text-gray-800 mb-2">{{ subject.name }}</h3>
          <p class="text-gray-600">{{ subject.description }}</p>
        </div>
      </div>
    </div>
</template>

<script setup>
defineProps({
    programData: {
        type: Array,
        required: true
    }
})

</script>