<template>
  <div class="login-container">
    <div class="decor-circle decor-circle--primary" aria-hidden="true"></div>
    <div class="decor-circle decor-circle--secondary" aria-hidden="true"></div>

    <div class="login-card" role="form" aria-labelledby="login-title">
      <header class="login-header">
        <span class="brand-icon" aria-hidden="true">🔒</span>
        <div>
          <h1 id="login-title">Acessar painel</h1>
          <p class="login-subtitle">Use suas credenciais para continuar</p>
        </div>
      </header>

      <form class="login-form" @submit.prevent="handleSubmit">
        <label class="field">
          <span class="field-label">Usuário</span>
          <input
            v-model.trim="username"
            name="username"
            type="text"
            autocomplete="username"
            placeholder="Informe o usuário"
            required
          />
        </label>

        <label class="field">
          <span class="field-label">Senha</span>
          <div class="password-wrapper">
            <input
              :type="showPassword ? 'text' : 'password'"
              v-model="password"
              name="password"
              autocomplete="current-password"
              placeholder="Informe a senha"
              required
            />
            <button type="button" class="toggle-visibility" @click="togglePasswordVisibility">
              <span v-if="showPassword">🙈</span>
              <span v-else>👁️</span>
              <span class="sr-only">{{ showPassword ? 'Ocultar senha' : 'Mostrar senha' }}</span>
            </button>
          </div>
        </label>

        <button type="submit" class="submit-button">Entrar</button>

        <p class="credentials-hint">
          Usuário de teste: <strong>root</strong> &bull; Senha: <strong>root</strong>
        </p>
      </form>
    </div>

    <transition name="fade">
      <div v-if="showError" class="popup" role="alertdialog" aria-live="assertive">
        <div class="popup-card">
          <h2>Ops!</h2>
          <p>Usuário e/ou senha inválidos.</p>
          <button type="button" class="popup-button" @click="closePopup">Tentar novamente</button>
        </div>
      </div>
    </transition>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';

const VALID_USERNAME = 'root';
const VALID_PASSWORD = 'root';

const username = ref('');
const password = ref('');
const showPassword = ref(false);
const showError = ref(false);

const router = useRouter();

const handleSubmit = () => {
  const isValid = username.value === VALID_USERNAME && password.value === VALID_PASSWORD;

  if (isValid) {
    sessionStorage.setItem('isAuthenticated', 'true');
    router.replace({ name: 'welcome' });
  } else {
    showError.value = true;
  }
};

const togglePasswordVisibility = () => {
  showPassword.value = !showPassword.value;
};

const closePopup = () => {
  showError.value = false;
};
</script>

<style scoped>
.login-container {
  position: relative;
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: clamp(1.5rem, 5vw, 4rem) clamp(1rem, 5vw, 3rem);
  overflow: hidden;
}

.login-card {
  position: relative;
  width: min(420px, 100%);
  padding: clamp(2.5rem, 5vw, 3.5rem);
  border-radius: 28px;
  background: rgba(255, 255, 255, 0.86);
  backdrop-filter: blur(18px);
  box-shadow: 0 35px 65px -25px rgba(31, 51, 109, 0.45);
  display: grid;
  gap: 2rem;
  z-index: 1;
}

.login-header {
  display: flex;
  align-items: center;
  gap: 1rem;
}

.brand-icon {
  display: grid;
  place-items: center;
  width: 56px;
  height: 56px;
  border-radius: 18px;
  background: linear-gradient(135deg, rgba(93, 95, 239, 0.15), rgba(70, 160, 255, 0.25));
  font-size: 1.75rem;
}

h1 {
  font-size: clamp(1.5rem, 2vw + 1.2rem, 2.3rem);
  color: #161a31;
  font-weight: 700;
}

.login-subtitle {
  color: #4f5b76;
  margin-top: 0.35rem;
}

.login-form {
  display: grid;
  gap: 1.25rem;
}

.field {
  display: grid;
  gap: 0.5rem;
}

.field-label {
  font-weight: 600;
  color: #3b4662;
}

input {
  width: 100%;
  padding: 0.85rem 1rem;
  border: 1px solid rgba(104, 118, 150, 0.2);
  border-radius: 14px;
  font-size: 1rem;
  background: rgba(255, 255, 255, 0.9);
  transition: border-color 0.2s ease, box-shadow 0.2s ease;
}

input:focus {
  outline: none;
  border-color: rgba(93, 95, 239, 0.5);
  box-shadow: 0 0 0 4px rgba(93, 95, 239, 0.15);
}

.password-wrapper {
  position: relative;
}

.password-wrapper input {
  padding-right: 3.2rem;
}

.toggle-visibility {
  position: absolute;
  top: 50%;
  right: 0.65rem;
  transform: translateY(-50%);
  border: none;
  background: none;
  font-size: 1.1rem;
  cursor: pointer;
  color: #5a6480;
  display: inline-flex;
  align-items: center;
}

.toggle-visibility:focus {
  outline: none;
  color: #2e68ff;
}

.submit-button {
  margin-top: 0.5rem;
  border: none;
  border-radius: 999px;
  padding: 0.95rem 1.5rem;
  font-size: 1rem;
  font-weight: 600;
  color: #fff;
  cursor: pointer;
  background: linear-gradient(135deg, #5d5fef, #46a0ff);
  box-shadow: 0 20px 40px -18px rgba(46, 104, 255, 0.6);
  transition: transform 0.25s ease, box-shadow 0.25s ease;
}

.submit-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 25px 45px -20px rgba(46, 104, 255, 0.6);
}

.submit-button:active {
  transform: translateY(0);
}

.credentials-hint {
  text-align: center;
  font-size: 0.9rem;
  color: #626f8f;
}

.credentials-hint strong {
  color: #3e4a6a;
}

.popup {
  position: fixed;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 1.5rem;
  background: rgba(7, 20, 49, 0.35);
  z-index: 10;
}

.popup-card {
  background: #ffffff;
  padding: 2rem 2.5rem;
  border-radius: 22px;
  box-shadow: 0 20px 45px -25px rgba(31, 51, 109, 0.5);
  text-align: center;
  display: grid;
  gap: 0.75rem;
  max-width: min(320px, 100%);
}

.popup-card h2 {
  font-size: 1.5rem;
  color: #1a1a1a;
}

.popup-card p {
  color: #4f5b76;
  font-size: 1rem;
}

.popup-button {
  margin-top: 0.75rem;
  border: none;
  border-radius: 999px;
  padding: 0.75rem 1.25rem;
  font-weight: 600;
  background: linear-gradient(135deg, #f97794, #f54ea2);
  color: #fff;
  cursor: pointer;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.popup-button:hover {
  transform: translateY(-1px);
  box-shadow: 0 18px 35px -20px rgba(245, 78, 162, 0.6);
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.2s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

.decor-circle {
  position: absolute;
  border-radius: 50%;
  filter: blur(0px);
  opacity: 0.65;
}

.decor-circle--primary {
  width: clamp(220px, 45vw, 380px);
  height: clamp(220px, 45vw, 380px);
  background: radial-gradient(circle at 30% 30%, rgba(93, 95, 239, 0.45), transparent 70%);
  top: clamp(-120px, -10vw, -60px);
  left: clamp(-140px, -12vw, -70px);
}

.decor-circle--secondary {
  width: clamp(180px, 40vw, 320px);
  height: clamp(180px, 40vw, 320px);
  background: radial-gradient(circle at 70% 70%, rgba(70, 160, 255, 0.4), transparent 65%);
  bottom: clamp(-110px, -12vw, -60px);
  right: clamp(-130px, -10vw, -70px);
}

.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border: 0;
}

@media (max-width: 640px) {
  .login-card {
    padding: 2.25rem 1.75rem;
    gap: 1.5rem;
  }

  .credentials-hint {
    font-size: 0.85rem;
  }

  .popup-card {
    padding: 1.75rem 2rem;
  }
}

@media (prefers-color-scheme: dark) {
  :global(body) {
    color: #f5f7ff;
    background: radial-gradient(circle at top left, rgba(93, 95, 239, 0.5), transparent 50%),
      radial-gradient(circle at bottom right, rgba(70, 160, 255, 0.4), transparent 55%),
      linear-gradient(135deg, #11152c 0%, #1b233d 100%);
  }

  .login-card {
    background: rgba(18, 22, 43, 0.85);
    box-shadow: 0 35px 65px -25px rgba(7, 9, 22, 0.65);
  }

  h1 {
    color: #f5f7ff;
  }

  .login-subtitle,
  .field-label,
  .credentials-hint,
  .popup-card p {
    color: #d6dcff;
  }

  input {
    background: rgba(22, 27, 52, 0.9);
    border-color: rgba(125, 143, 255, 0.25);
    color: #f5f7ff;
  }

  .popup-card {
    background: rgba(18, 22, 43, 0.95);
    color: #f5f7ff;
  }
}
</style>
