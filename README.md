##### [ <i>Alert:  Due to copyright issue, some necessary files have been kept hide</i> ]
<br>


<p align="center"><img src="https://snipboard.io/2Sn5MK.jpg" width="400"></p>



## About

#### <i>Released in CodeCanyon: 12 November 2020</i>

PeoplePro HRM, Payroll & Project Management system is a comprehensive and cutting-edge software solution designed to streamline and optimize human resource management and project management processes within organizations. With its wide range of features and user-friendly interface, it empowers businesses to efficiently manage their workforce and projects, leading to increased productivity and improved overall performance. Manage multiple companies, departments, employees, projects and much more from an intuitive admin panel that you’ll love to use. No matter what is the size of your company, PeoplePro is capable of handling all your HR related tasks.


## Technologies
- PHP - 8.1
- Laravel - 10
- jQuery 
- Ajax  
- MySQL 
- Bootstrap
- HTML 
- CSS

## Features & Functionality
- Employee Management
- Email sending and notification
- Role & Permission
- Manage of Company, Department, Designation, Location, Office Shift.
- Multi language
- IP based Attendance / general attendance
- Holiday and Leave Manaagement
- Payroll Management
- Job Post, Job Candidate, Job Interview.
- Project, Task, Client and Invoice Management.
- Various type of File Management.
- Event & Meeting Management
- Finanace Part Management (Account, Expense, Deposit, Payyer, Payee).
- Training Management
- Perforance (Goal Type, tracking, Indicator, Appraisal)
- Task Scheduling
- Reports
- Separated of Employee and Client Dashboard.


## My Role
Developed, maintained and client support for the Peoplepro HRM Laravel app since the last two years, contributing to its ongoing success and functionality. The app is designed to streamline human resource management processes and enhance organizational efficiency.

- Devloped IP Based Attendance System.
- Modified Role and Permission
- Updated Attendance System
- Updated and added new feature the full Leave Management system.
- Updated and added new feature - Payroll Management System.
- HR Reports
- Devloped Performance Feature (Goal Type, Goal Tracking, Indicator, Appraisal)
- Devloped Auto Update System
- Continously Add New Features
- Continously Bug Fixing
- Continously Client Support
- Try to write clean and maintaable code according to Industry best practice.

## Visit
Demo : https://peopleprohrm.com/demo/

CodeCanyon : https://codecanyon.net/item/peoplepro-hrm-payroll-project-management/29169229

## Credits 

- #### Author : [LION CODERS](https://lion-coders.com/)
- #### Template Design : [Tarik Iqbal](https://www.linkedin.com/in/tarik-iqbal-51046b34/)

-  #### Original Developer :  [Ashraf Shahadat](https://github.com/Ash-raf10) <small><i>[Till 2020]</i></small>

- #### Contributors : [Irfan Chowdhury](https://github.com/Irfan-Chowdhury) <small><i>[January, 2021 - Present]</i></small>

# Projeto testerh

Este projeto é um sistema Laravel com frontend em Vue.js, rodando totalmente em containers Docker.

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
   docker-compose exec app chmod -R 777 storage bootstrap/cache
   ```

5. **Rode as migrations do Laravel**
   ```bash
   docker-compose exec app php artisan migrate
   ```

6. **(Opcional) Rode os seeders**
   ```bash
   docker-compose exec app php artisan db:seed
   ```

7. **Build do frontend**
   O container `node` já executa `npm install` e `npm run dev` automaticamente.

## Como importar um banco de dados (dump SQL)

Se você possui um arquivo de dump SQL (ex: `rhteste_sistema.sql`), siga os passos abaixo para importar no MySQL do container:

1. **Copie o arquivo para dentro do container:**
   ```bash
   docker cp rhteste_sistema.sql testerh_db:/rhteste_sistema.sql
   ```

2. **Acesse o container do MySQL:**
   ```bash
   docker exec -it testerh_db bash
   ```

3. **Importe o banco:**
   ```bash
   mysql -u root -p < /rhteste_sistema.sql
   senha: root;
   ```
   (Troque os nomes conforme seu usuário, senha e banco)

4. **Saia do container:**
   ```bash
   exit
   ```

Pronto! O banco estará disponível para uso no Laravel.

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

Dúvidas? Abra uma issue ou entre em contato com o mantenedor.
