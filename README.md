### Dependências

- Ruby 2.5;
- Ruby on Rails 5.2;

### Instalação

Caso não tenha as ferramentas instaladas, siga as instruções no link:

**Instalação do RVM**
https://rvm.io/rvm/install

**Instalação do Ruby**

<pre>rvm install 2.5</pre>

Este comando é para que possamos utilizar a versão 2.4.4:

<pre>rvm use 2.5</pre>

**Instalação do Rails**

<pre>gem g install rails -v 5.2.0</pre>

**Instalação das bibliotecas**

<pre>bundle install</pre>

**Inicialização do servidor**

<pre>rails s -p 3001</pre>

**Abra o navegador no endereço**

<pre>http://localhost:3001</pre>

### Testes automatizados
**Para execução dos testes automatizados basta executar o comando**
<pre>rspec</pre>

### Testes de requisição via API

**Com o projeto inicializado na porta 3001**

Se não possuir nenhum cliente de requisições, pode instalar o Postman.

https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop?hl=en

### Testes de requisição via API

POST : http://localhost:3000/foods/cook_calculator

####Request 
**Header:**
Content-Type:application/json

**Body:**
{
	"cook_calculator" : {
		"time_cook" : 1,
		"time_hourglass_one" : 5,
		"time_hourglass_two" : 7
	}
}

####Response
{
    "time_cook": 1,
    "time_hourglass_one": 5,
    "time_hourglass_two": 7,
    "result_calculator": 15
}
