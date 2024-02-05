## Introdução
Projeto construído para desafio técnico da Coffeebean Technology.

## Objetivo
Construir uma aplicação de autenticação que não envolva persistência de dados e nem utilize libs de autenticação como Devise, Warden ou semelhantes.

## Instalação de ambiente
- Faça um clone deste projeto
- Acesse seu diretório e rode o comando `bundle install`
- Em um console, inicialize o Redis com o comando `redis-server`
  - Caso não tenha o Redis instalado, instale-o com o comando `gem install redis`
- Abra o projeto com o comando `rails server`
- Acesse `http://127.0.0.1:3000/`
- Faça um registro clicando no botão Sign-up
- Após, faça o login na tela que será redirecionado
- Verifique que abriu uma tabela mostrando os dados relativos ao usuário e dados de geolocalização.

## Links
Você pode encontrar a solução em produção através deste link:
https://coffeebean-test-project-9beede92a757.herokuapp.com/

## Considerações
O projeto foi feito com duas abordagens: uma utilizando o usuário em memória pura e outra usando o Redis.
Isso se tornou necessário porque o Heroku mantém por poucos segundos alguns objetos na memória, além de fazer o deploy da aplicação de forma distribuída, destruindo os dados em memória em tempo não hábil para podermos manipular para o login.

Sendo assim, a aplicação na branch `main` está baseada no Redis e na branch `projeto-em-memoria` a solução está baseada completamente em memória.