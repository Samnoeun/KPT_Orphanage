<script setup>
import HeroSection from '@/components/home/HeroSection.vue'
import History from '@/components/home/History.vue'
import StatsSection from '@/components/home/StatsSection.vue'
import DiscoverSection from '@/components/home/DiscoverSection.vue'
import WhatWeDoSection from '@/components/home/WhatWeDoSection.vue'
import TestimonialSection from '@/components/home/TestimonialSection.vue'
import PartnerSection from '@/components/home/PartnerSection.vue'
import CallToAction from '@/components/home/CallToAction.vue'
</script>

<template>
  <div class="min-h-screen">
    <HeroSection />
    <StatsSection />
    <DiscoverSection />
    <History />


    <WhatWeDoSection />
    <TestimonialSection />
    <PartnerSection />
    <CallToAction />
  </div>
</template>