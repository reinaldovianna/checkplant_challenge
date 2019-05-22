####Problema do Miojo:
João é um fanático por miojos; ele os adora, e, como era de se esperar, ele levou vários pacotes quando foi acampar com seus colegas. Como João só gosta de miojos feitos com o tempo exato, ele se deseperou ao perceber que havia esquecido seu relógio em casa.

Por sorte, ele conseguiu, no caminho, comprar duas ampulhetas de durações diferentes. Por exemplo, se o miojo precisa de 3 minutos para ficar pronto, e João tiver uma ampulheta de 5 minutos e outra de 7, uma possível forma de cozinhar o miojo é:

João começa virando as duas ampulhetas ao mesmo tempo. Quando a areia da ampulheta de 5 minutos se esgotar, João torna a virá-la. João começa a preparar o miojo quando a areia da ampulheta de 7 minutos acabar. João tira o miojo do fogo quando a ampulheta de 5 minutos acabar novamente. Dessa forma, o miojo ficará 3 minutos no fogo (do minuto 7 ao minuto 10).

Assim, apesar do miojo levar apenas três minutos para ser cozido, ele precisa de 10 minutos para ficar pronto.

**Faça um programa que, dado o tempo de preparo do miojo, e os tempos das duas ampulhetas (ambos maiores que o tempo do miojo), determina o tempo mínimo necessário para o miojo ficar pronto ou se não é possível cozinhar o miojo no tempo exato com as ampulhetas disponíveis.**

### Dependências

- Ruby 2.5;
- Ruby on Rails 5.2;

### Instalação

Caso não tenha as ferramentas instaladas, siga as instruções no link:

**Instalação do RVM**
https://rvm.io/rvm/install

**Instalação do Ruby**

<pre>rvm install 2.5</pre>

Este comando é para que possamos utilizar a versão 2.5:

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
