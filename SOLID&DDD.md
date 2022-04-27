# Clean Architecture
* Não é uma arquitetura.
* Princípios para montar uma arquitetura.
---
# SOLID
* 5 princípios de design.
* Explora benefícios da OOP.
---
# DDD
* Princípios e práticas.
* Mindset.
* Ajuda encontrar um design.
* Não é arquitetura.
* Domain: 
  * Problema que a empresa deseja resolver.
  * Problema do cliente.
* Domain Model:
  * Converção do problema em código.
  * A sua solução.
* Domain Experts:
    * Cliente, usuário.
    * Pessoa(s) que entendem o negócio ou uma parte dele.
    * O projeto pode ter vários domínios para resolver, e diferentes domain experts.
* Modelar domínio é o principal foco.

## Problemas
* Requerimentos sem estudo detalhado.
* Inicia no banco de dados (focando em ferramenta e não em solução).
* Inicia na UI.

## Princípios
* Ubiquitous language (linguagem onipresente).
    * Domain experts and software developers devem se entender.
    * Não é cada um em seu quadrado.
    * Devs e Clientes devem gostar da interação social.
    * Reuniões, conversas, documentação, emails para aprender a se comunicarem.
* Bounded Context:
    * Um Pattern.
    * Divide um Model grande em contextos diferentes.
---
# Clean Dart:
* Page -> Controller -> UseCase -> Repository -> DataSource -> Service.
* Controller
  * State
  * Variables
* UseCase
  * Bem específico o nome e ação
  * O mais lixo
  * Mais pra teste
  * Regra de negócio do uso dessa ação
  * Quase não faz nada
* Repository
  * Normalmente, Erros https
  * Viagemda
  * Try Catch é aqui
  * Mensagem de erro (servidor e/ou própria)
  * Exceptions delegam a lógica do erro para a classe responsável por conhecer as regras que podem ocasionar o erro.
* DataSource
  * Fazer chamada na api
  * fromJson aqui
* Layers != Modules (Core, App (layers)).
* Domain, Data and Presentation.
* Domain don't know other layers, imports are only from domain.
* Also, domain don't know how to mount data, like json and to json, that's why entities hasn't json treatments.
* Data can access domain layer and itself, but not external layers.
---
**DDD**
* Eric Evans começou o DDD.
* Recomendação de livro: Vernon.
* **Kiss**: keep it simple, stupid.
* **Yagni**: You aren't gonna need it. If you don't need, don't code.
* MVC não é muito clean.
---
**DIO**
* DioError
  * error = error + stacktrace
  * error.error = error (ex: Http status error 401)
  * error.response.data = json response
  * error.response.statusMessage = reason associated with error