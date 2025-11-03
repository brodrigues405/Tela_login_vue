<template>
  <div class="welcome-container">
    <div class="welcome-card">
      <h1>Bem-vindo!</h1>
      <p>Login realizado com sucesso.</p>
      <button type="button" @click="handleLogout">Sair</button>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router';

const router = useRouter();

const handleLogout = () => {
  sessionStorage.removeItem('isAuthenticated');
  router.replace({ name: 'login' });
};
</script>

<style scoped>
.welcome-container {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 2rem 1rem;
}

.welcome-card {
  width: min(420px, 100%);
  padding: 2.5rem 2rem;
  border-radius: 24px;
  background: rgba(255, 255, 255, 0.85);
  box-shadow: 0 25px 50px -20px rgba(28, 45, 94, 0.35);
  backdrop-filter: blur(12px);
  text-align: center;
  display: grid;
  gap: 1rem;
}

.welcome-card h1 {
  font-size: clamp(1.5rem, 3vw + 1rem, 2.4rem);
  color: #1a1a1a;
}

.welcome-card p {
  color: #445069;
  font-size: 1rem;
}

.welcome-card button {
  margin-top: 1.5rem;
  padding: 0.9rem 1.5rem;
  border: none;
  border-radius: 999px;
  background: linear-gradient(135deg, #5d5fef, #46a0ff);
  color: white;
  font-weight: 600;
  cursor: pointer;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.welcome-card button:hover {
  transform: translateY(-2px);
  box-shadow: 0 15px 30px -15px rgba(46, 104, 255, 0.6);
}

.welcome-card button:active {
  transform: translateY(0);
}
</style>
