<template>
  <div>
      <v-overlay :value="indeterminate">
        <v-progress-circular
            v-show="indeterminate"
            :indeterminate="indeterminate"
            :rotate="rotate"
            :size="size"
            :value="value"
            :width="width"
            color="light-blue"
          ></v-progress-circular>
      </v-overlay>
      <h1>Confirmar compra de: {{ movie.name }}</h1>
      <v-text-field
        v-model="email"
        prepend-icon="mdi-email"
        class="email"
        label="Email"
      ></v-text-field>
      <card class='stripe-card'
        :class='{ complete }'
        :stripe='stripeKey'
        @change='complete = $event.complete'
      />
      <v-btn class='mt-2' @click='pay' :disabled='!complete && email !== null'>
        Confirmar
      </v-btn>
  </div>
</template>

<script>
import { Card, createToken } from 'vue-stripe-elements-plus';
import paymentActions from '@/api/paymentActions';

export default {
  data() {
    return {
      complete: false,
      indeterminate: false,
      rotate: 0,
      size: 32,
      value: 0,
      width: 4,
      email: null,
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
      const stripeToken = await createToken();
      const response = await paymentActions.charge(
        {
          token: stripeToken.token.id,
          amount: 2,
          movie: this.movie.id,
          email: this.email,
        },
      );
      this.indeterminate = false;
      this.showNotification(response.data.decline_code);
    },
    showNotification(errorCode) {
      if (!errorCode) {
        this.$swal.fire(
          {
            icon: 'success',
            title: 'Pagamento aprovado',
            text: 'Seu lugar está confirmado',
            showConfirmButton: false,
            timer: 3000,
          },
        );
        setTimeout(() => {
          this.$router.push({ path: '/' });
        }, 4000);
      } else {
        this.$swal.fire('Pagamento recusado', 'Por favor, tente novamente', 'error');
      }
    },
  },
};
</script>

<style>
.stripe-card {
  width: 300px;
  border: 1px solid grey;
}

.email {
  width: 300px;
}

.stripe-card.complete {
  border-color: green;
}
</style>
