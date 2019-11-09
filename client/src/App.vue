<template>
  <v-app>
    <v-app-bar
      app
      color="cyan"
      dark
    >
      <div class="d-flex align-center">
        <v-img
          alt="Vuetify Logo"
          class="shrink mr-2"
          contain
          src="@/assets/guru.svg"
          transition="scale-transition"
          width="40"
        />
        <h1>
          Ticket Guru
        </h1>
      </div>

      <v-spacer></v-spacer>

      <v-btn
        href="https://github.com/vuetifyjs/vuetify/releases/latest"
        target="_blank"
        text
      >
        <v-icon>mdi-menu</v-icon>
      </v-btn>
    </v-app-bar>

    <v-content>
      <Dashboard/>
    </v-content>
  </v-app>
</template>

<script>
import Dashboard from '@/components/Dashboard.vue';

export default {
  name: 'App',

  components: {
    Dashboard,
  },

  data: () => ({
    //
  }),
};
</script>
