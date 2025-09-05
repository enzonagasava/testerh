
## Pré-requisitos
- Docker
- Docker Compose

## Como iniciar o projeto

1. **Clone o repositório**
   ```bash
   git clone <url-do-repositorio>
   cd testerh
   ```

2. **Configure o arquivo `.env`**
   - Edite o arquivo `.env` conforme exemplo abaixo:
     ```env
     DB_CONNECTION=mysql
     DB_HOST=db
     DB_PORT=3306
     DB_DATABASE=testerh
     DB_USERNAME=testerh
     DB_PASSWORD=testerh
     APP_URL=http://localhost:8080
     APP_TIMEZONE=America/Sao_Paulo
     ```

3. **Suba os containers**
   ```bash
   docker-compose up --build
   ```
   - O backend estará disponível em http://localhost:8080
   - O banco MySQL estará disponível na porta 3307 para acesso externo.

4. **Ajuste permissões das pastas**
   ```bash
   docker exec -it testerh_db bash
   chmod -R 777 storage bootstrap/cache
   ```

5. **Rode Composer Install**
   ```bash
   composer install
   ```

6. **Build do frontend**
   O container `node` já executa `npm install` e `npm run dev` automaticamente.

## Como importar um banco de dados (dump SQL)

Se você possui um arquivo de dump SQL (ex: `rhteste_sistema.sql`), siga os passos abaixo para importar no MySQL do container:

1. **Copie o arquivo para dentro do container:**
   ```bash
   docker cp rhteste_sistema.sql testerh_db:/rhteste_sistemas.sql
   ```

2. **Acesse o container do MySQL:**
   ```bash
   docker exec -it testerh_db bash
   ```

3. **Importe o banco:**
   ```bash
   mysql -u root -p testerh < /rhteste_sistema.sql
   senha: root;
   ```
   (Troque os nomes conforme seu usuário, senha e banco)

4. **Saia do container:**
   ```bash
   exit
   ```

Pronto! O banco estará disponível para uso no Laravel.

5. **(Opcional) Rode os seeders**
   ```bash
   php artisan db:seed
   ```




## Acesso ao banco de dados
- Host: `localhost`
- Porta: `3307`
- Usuário: `testerh`
- Senha: `testerh`
- Banco: `testerh`

## Comandos úteis
- Parar containers:
  ```bash
  docker-compose down
  ```
- Ver logs:
  ```bash
  docker-compose logs app
  docker-compose logs db
  docker-compose logs node
  ```

## Observações
- Se aparecer erro de permissão no Node, execute:
  ```bash
  docker-compose exec node chmod -R 755 node_modules/.bin
  ```
- Para atualizar dependências do Node:
  ```bash
  docker-compose exec node npm install
  ```

---
