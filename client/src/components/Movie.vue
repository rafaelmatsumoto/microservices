<template>
  <div>
    <v-row align="center" justify="center">
      <v-img
        :src="movie.image"
        :lazy-src="movie.image"
        aspect-ratio="1"
        class="grey lighten-2"
        max-height="300"
      ></v-img>
    </v-row>
    <v-row align="center">
      <div class="movie ml-5">
        <h1>{{ movie.name }}</h1>
        <h2>{{ movie.description }}</h2>
        <span>Movie pricing</span>
      </div>
    </v-row>
  </div>
</template>

<script>
import moviesRepository from '@/api/moviesRepository';

export default {
  name: 'Movie',
  props: ['id'],
  data() {
    return {
      movie: {},
    };
  },
  mounted() {
    this.getMovie();
  },
  methods: {
    async getMovie() {
      const response = await moviesRepository.getMovie(this.id);
      this.movie = response.data;
    },
  },
};
</script>

<style scoped>
</style>
