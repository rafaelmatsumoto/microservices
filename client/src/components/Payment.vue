<template>
  <div>
     <v-progress-circular
        v-show="indeterminate"
        :indeterminate="indeterminate"
        :rotate="rotate"
        :size="size"
        :value="value"
        :width="width"
        color="light-blue"
      ></v-progress-circular>
      <h1>Confirmar compra de: {{ movie.name }}</h1>
      <card class='stripe-card'
        :class='{ complete }'
        :stripe='stripeKey'
        @change='complete = $event.complete'
      />
      <v-btn class='mt-2' @click='pay' :disabled='!complete'>
        Comprar
      </v-btn>
  </div>
</template>

<script>
import { Card, createToken } from 'vue-stripe-elements-plus';

export default {
  data() {
    return {
      complete: false,
      indeterminate: false,
      rotate: 0,
      size: 32,
      value: 0,
      width: 4,
    };
  },

  props: ['movie'],

  computed: {
    stripeKey() {
      return process.env.VUE_APP_STRIPE_KEY;
    },
  },

  components: { Card },

  methods: {
    async pay() {
      this.indeterminate = true;
      const token = await createToken();
      console.log(token);
      setTimeout(() => {
        this.indeterminate = false;
      }, 5000);
    },
  },
};
</script>

<style>
.stripe-card {
  width: 300px;
  border: 1px solid grey;
}
.stripe-card.complete {
  border-color: green;
}
</style>
