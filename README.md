# Tela Login Vue

Aplicação Single Page Application (SPA) construída com Vue 3 e Vite, exibindo uma tela de login moderna e responsiva. As credenciais válidas são mantidas em memória (`root` / `root`).

## Pré-requisitos

- Node.js 18 ou superior
- npm 9 ou superior

## Como executar

1. Clone ou faça o download deste repositório e abra um terminal na pasta do projeto.
2. Instale as dependências do Node:

   ```bash
   npm install
   ```

   > Caso utilize um espelho de registro corporativo, garanta que ele tenha acesso aos pacotes `vue`, `vue-router` e `vite`.

3. Inicie o servidor de desenvolvimento:

   ```bash
   npm start
   ```

   ou, se preferir, execute diretamente:

   ```bash
   npm run dev
   ```

4. Abra o navegador em [http://localhost:5173](http://localhost:5173) para visualizar a aplicação.

### Executando com Docker

Caso prefira isolar o ambiente usando contêineres, o projeto já inclui um `Dockerfile` configurado para desenvolvimento. Com o Docker instalado na máquina host:

1. Construa a imagem:

   ```bash
   docker build -t tela-login-vue .
   ```

2. Instale as dependências (o comando roda dentro do contêiner e grava os arquivos no volume montado):

   ```bash
   docker run --rm -it -v "$(pwd)":/app tela-login-vue npm install
   ```

3. Suba o servidor de desenvolvimento expondo a porta do Vite e montando o diretório do projeto como volume para facilitar a edição do código:

   ```bash
   docker run --rm -it -p 5173:5173 -v "$(pwd)":/app tela-login-vue
   ```

4. Acesse [http://localhost:5173](http://localhost:5173) no navegador.

## Build para produção

```bash
npm run build
```

## Pré-visualizar build de produção

```bash
npm run preview
```

## Credenciais de teste

- **Usuário:** `root`
- **Senha:** `root`

Após autenticação bem-sucedida você será direcionado para uma tela de boas-vindas. Quando as credenciais forem inválidas, uma mensagem em forma de popup é apresentada.
