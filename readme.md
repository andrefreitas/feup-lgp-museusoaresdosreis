### 1. Configuração do ambiente
Para criar um ambiente de desenvolvimento é necessário instalar o Git, o Ruby 2, o Rails 4, o MySQL, o Sublime Text e o MySQL Workbench.

#### 1.1 Ubuntu
*Ruby on Rails*

```
sudo apt-get install curl
curl -L get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm requirements
rvm install 2.1.1
rvm use 2.1.1
rvm --default use 2.1.1
gem install rails -v 4.0.4
```

*MySQL*

```
sudo apt-get install mysql-server
sudo apt-get install mysql-client
```

*Sublime Text 3*

```
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer
```
*GIT*

``` 
sudo apt-get install git 
```
*MySQL Workbench*

```

sudo apt-get install mysql-workbench
```
### 2. Configuração da Base de Dados
É necessário configurar as bases de dados e os utilizadores.

```
mysql -u root -p
CREATE USER 'museusoaresreis'@'localhost' IDENTIFIED BY 'fhhjg54dfghu6';
GRANT ALL PRIVILEGES ON museusoaresreis_development.* To 'museusoaresreis'@'localhost';
GRANT ALL PRIVILEGES ON museusoaresreis_test.* To 'museusoaresreis'@'localhost';
GRANT ALL PRIVILEGES ON museusoaresreis_production.* To 'museusoaresreis'@'localhost';
```
### 3. Perguntas frequentes
#### 3.1 Como crio um modelo novo no RoR?
```
rails generate model Administrator name:string email:string password:string
rake db:migrate
```
#### 3.1 Como atualizar a base de dados MySQL quando o modelo é alterado?
```
rake db:reset
```

### 3. Comandos de Rails
Iniciar o servidor

```
rails server
```

Criar um modelo

```
rails g model Administrator name:string email:string password:string
```
