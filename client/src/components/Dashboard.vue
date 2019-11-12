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
          v-for="movie in movies"
          :key="movie.id"
          class="my-2 mx-auto"
          max-width="344"
          @click="openMovieInfo(movie.id)"
        >
          <v-img class="white--text ma-2" max-height="300px" :src="movie.image"> </v-img>

          <v-card-text>
            <h2>{{ movie.name }}</h2>

            <div class="text--primary">{{ movie.description }}</div>
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
import moviesRepository from '@/api/moviesRepository';

export default {
  name: 'Dashboard',
  data() {
    return {
      movies: [],
    };
  },
  mounted() {
    this.getMovies();
  },
  methods: {
    openMovieInfo(id) {
      this.$router.push({ path: `movie/${id}` });
    },
    async getMovies() {
      const movies = await moviesRepository.get();
      this.movies = movies.data;
    },
  },
};
</script>
