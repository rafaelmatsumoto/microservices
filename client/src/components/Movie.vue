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
        <h2>Preço: 5 USD</h2>
      </div>
    </v-row>
    <v-btn color="green" @click="purchase">Comprar</v-btn>
  </div>
</template>

<script>
import moviesActions from '@/api/moviesActions';

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
      const response = await moviesActions.getMovie(this.id);
      this.movie = response.data;
    },

    purchase() {
      this.$router.push({ name: 'pay', params: { movie: this.movie } });
    },
  },
};
</script>

<style scoped>
</style>
