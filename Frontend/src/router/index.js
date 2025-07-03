import { createRouter, createWebHistory } from 'vue-router';
import HomeView from '@/views/HomeView.vue';
import AboutView from '@/views/AboutView.vue';
import ContactView from '@/views/ContactView.vue';
import DonateView from '@/views/DonateView.vue';
import AdminView from '@/views/AdminView.vue';

const routes = [
  { path: '/', component: HomeView },
  { path: '/about', component: AboutView },
  { path: '/contact', component: ContactView },
  { path: '/donate', component: DonateView },
  { path: '/admin', component: AdminView }, // admin dashboard (future: protect this)
];

export default createRouter({
  history: createWebHistory(),
  routes,
});
