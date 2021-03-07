# Ranking dos gastos dos Deputados

<p align="center">
  <img src="app_demo.gif" />
</p>

A aplicação foi hospedada no Heroku e pode ser vista funcionando [aqui](https://ae-desafio-backend.herokuapp.com/). No entanto, por limitações do banco de dados disponível gratuitamente, somente alguns registros foram incluídos, para visualizar o app funcionando com todos os dados o mesmo precisa rodar localmente (guia para isso logo abaixo). 

## Descrição do desafio

Você já ouviu falar da CEAP? A Cota para o Exercício da Atividade Parlamentar, custeia as despesas do mandato, como passagens aéreas e conta de celular. Algumas são reembolsadas, como as com os Correios, e outras são pagas por débito automático, como a compra de passagens. Nos casos de reembolso, os deputados têm três meses para apresentar os recibos. O valor mensal não utilizado fica acumulado ao longo do ano. Por esse motivo, em alguns meses o valor gasto pode ser maior que a média mensal. (Fonte: [Portal da Câmara dos Deputados](https://www2.camara.leg.br/transparencia/acesso-a-informacao/copy_of_perguntas-frequentes/cota-para-o-exercicio-da-atividade-parlamentar)). Através do portal da transparência, nós temos acesso a essas despesas e podemos saber como e onde os políticos estão gastando.

## Base de dados e explicações complementares

- [Fonte de dados (pegar o referente ao ano 2020 em formato CSV)](https://dadosabertos.camara.leg.br/swagger/api.html#staticfile)
- [Explicação dos campos do arquivo CSV](https://www2.camara.leg.br/transparencia/cota-para-exercicio-da-atividade-parlamentar/explicacoes-sobre-o-formato-dos-arquivos-xml)

## Rodando a aplicação localmente
### Requisitos

Para executar esse projeto você vai precisar do:
    
  1. Ruby 2.6.5
  2. Ruby on Rails 6.0.3
  3. PostgreSQL

### Clonando o repositório

Rode esses comandos para clonar e entrar no repositório:

```
  $ git clone https://github.com/gustavothecoder/desafio-backend.git

  $ cd desafio-backend
```

### Instalando as dependências

Rode esses comandos para instalar todas as dependências:

```
  $ bundle install
  
  $ yarn install
```

### Criando o banco de dados

Rode esses comandos para criar o banco de dados:

```
  $ rails db:create
  
  $ rails db:migrate && rails db:migrate RAILS_ENV=test
```

### Testando

Verifique se tudo está OK rodando a suíte de testes com o comando `rspec`.

### Finalmente, rodando o app

Com todas as dependências instaladas e o seu ambiente configurado você poderá rodar o app com:

```
  $ rails s
```

Após, abra o seu navegador e acesse __localhost:3000__.