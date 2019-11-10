<template>
  <v-container>
    <v-row align="center" justify="center" class="grey lighten-5" style="height: 300px;">
      <div
        class="d-flex flex-wrap"
        color="grey lighten-2"
        align="center"
        justify="center"
        flat
        tile
      >
        <v-card
          v-for="n in 26"
          :key="n"
          class="my-2 mx-auto"
          max-width="344"
          @click="openMovieInfo(n)">
          <v-img
            class="white--text ma-2"
            max-height="300px"
            src="https://freeclassicimages.com/images/day-at-the-races-1937-french-movie-poster.jpg"
          >
          </v-img>

          <v-card-text>
            <h2>Day-at-the-races</h2>

            <div class="text--primary">Movie description</div>
          </v-card-text>

          <v-card-actions>
            <v-btn color="green" text>Comprar</v-btn>

            <v-btn color="black" text>Info</v-btn>
          </v-card-actions>
        </v-card>
      </div>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: 'Dashboard',
  methods: {
    openMovieInfo(id) {
      this.$router.push({ path: `movie/${id}` });
    },
  },
};
</script>
