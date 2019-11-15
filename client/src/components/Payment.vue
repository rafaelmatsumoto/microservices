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
      <h1>Please give us your payment details:</h1>
      <card class='stripe-card'
        :class='{ complete }'
        :stripe='stripeKey'
        @change='complete = $event.complete'
      />
      <button class='pay-with-stripe' @click='pay' :disabled='!complete'>
        Pay with credit card
      </button>
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
