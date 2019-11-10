<template>
  <div>
    <span>Id</span>
    {{ id }}
  </div>
</template>

<script>
export default {
  name: 'Movie',
  props: ['id'],
};
</script>
