<template>
  <RouterView />
</template>

<script setup>
import { RouterView } from 'vue-router';
</script>

<style scoped>
:global(body) {
  margin: 0;
}

:global(#app) {
  min-height: 100vh;
}
</style>
