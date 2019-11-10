<template>
  <div>
    <v-row align="center" justify="center">
      <v-img
        src="https://picsum.photos/id/11/500/300"
        lazy-src="https://picsum.photos/id/11/10/6"
        aspect-ratio="1"
        class="grey lighten-2"
        max-height="300"
      ></v-img>
    </v-row>
    <v-row align="center">
      <div class="movie ml-5">
        <h1>Movie title</h1>
        <h2>Movie Description</h2>
        <span>Movie pricing</span>
      </div>
    </v-row>
  </div>
</template>

<script>
export default {
  name: 'Movie',
  props: ['id'],
};
</script>

<style scoped>
</style>
