import { createRouter, createWebHistory } from 'vue-router';

// Public layouts & pages
import PublicLayout from '@/components/Layouts/PublicLayout.vue';
import HomeView from '@/views/HomeView.vue';
import AboutView from '@/views/AboutView.vue';
import ContactView from '@/views/ContactView.vue';
import DonateView from '@/views/DonateView.vue';
import ActionDetailView from "@/views/ActionDetailView.vue";
import AboutKPTDetailView from '@/views/AboutKPTDetailView.vue';
// import PrivacyPolicy from '@/components/PrivacyPolicy.vue';

// Admin layouts & pages
import AdminLayout from '@/components/Layouts/AdminLayout.vue';
import AdminView from '@/views/AdminView.vue';

const routes = [
  // Public site (with navbar/footer)
  {
    path: '/',
    component: PublicLayout,
    children: [
      { path: '', component: HomeView },
      { path: 'about', component: AboutView },
      { path: 'contact', component: ContactView },
      { path: 'donate', component: DonateView },
      // { path: 'privacy', component: PrivacyPolicy },
      { path: 'about/program/:topic', name: 'ProgramDetail', component: ActionDetailView, props: true },
      { path: 'about/orphanage', name: 'KampongThomOrphanage', component: AboutKPTDetailView, props: true },
    ]
  },
  // Admin area (NO navbar/footer)
  {
    path: '/admin',
    component: AdminLayout,
    children: [
      { path: '', component: AdminView }, // e.g. /admin
      { 
        path: 'login',
        component: () => import('@/components/Admin/Login.vue')
      },
      {
        path: 'dashboard',
        component: () => import('@/components/Admin/Dashboard.vue')
      },
      {
        path: 'donors',
        component: () => import('@/components/Admin/Donors.vue')
      },
      {
        path: 'donations',
        component: () => import('@/components/Admin/Donations.vue')
      }
    ]
  }
];

export default createRouter({
  history: createWebHistory(),
  routes,
});
