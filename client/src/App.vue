<template>
  <v-app>
    <v-app-bar
      app
      color="cyan"
      dark
    >
      <div class="d-flex align-center homepage" @click="goHome">
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
        @click="drawer = !drawer"
        text
      >
        <v-icon>mdi-menu</v-icon>
      </v-btn>
    </v-app-bar>

     <v-navigation-drawer
      v-model="drawer"
      absolute
      temporary
      right
      >
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title class="title">
            Ticket Guru
          </v-list-item-title>
          <v-list-item-subtitle>
            A melhor bilheteria
          </v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>
    </v-navigation-drawer>

    <v-content>
      <router-view/>
    </v-content>
  </v-app>
</template>

<script>

export default {
  name: 'App',

  data: () => ({
    drawer: null,
  }),

  methods: {
    goHome() {
      this.$router.push({ path: '/' });
    },
  },
};
</script>

<style scoped>
.homepage {
  cursor: pointer;
}
</style>
