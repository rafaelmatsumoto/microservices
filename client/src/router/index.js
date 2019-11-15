import Vue from 'vue';
import VueRouter from 'vue-router';
import Movie from '../components/Movie.vue';
import Dashboard from '../components/Dashboard.vue';
import Payment from '../components/Payment.vue';

Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'home',
    component: Dashboard,
  },
  {
    path: '/movie/:id',
    name: 'movie',
    props: true,
    component: Movie,
  },
  {
    path: '/pay',
    name: 'pay',
    props: true,
    component: Payment,
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue'),
  },
];

const router = new VueRouter({
  routes,
});

export default router;
