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
  * Bem específico (mesmo) o nome e ação, praticamente só tem call
  * Principal a ser testado
  * Regra de negócio do uso dessa ação
  * Validação de formulário
* Repository
  * Normalmente, Erros https
  * Try Catch é aqui
  * Mensagem de erro (servidor e/ou própria)
  * Exceptions delegam a lógica do erro para a classe responsável por conhecer as regras que podem ocasionar o erro.
* DataSource
  * Fazer chamada na api
  * Chamada local
  * External
  * DTOs' fromJson aqui
* Layers != Modules (Core, App (layers)).
* Domain, Data and Presentation.
* Domain don't know other layers, imports are only from domain.
* Also, domain don't know how to mount data, like json and to json, that's why entities haven't json methods.
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
---
**Curiosities**
* const is set at compilation time (before the app is run).
* final is set at runtime (for example, final date = DateTime.now, at the moment of compilation it doesn't know 
the time, only when app is run).
* X.Y.Z = X - major.minor.patch
  * Java is still on version 1. since its creation in 90's, but for marketing purposes, they omit '1.'
  * Angular at its beginning was not following the semantic versioning, and every minor was bringing imcompatibilities.
* **Operadores Cascatas**: list..add()..add()..remove(); 
  * ".." returns the own object and not the return of the operation.
    * ex: the return from list.add() is void, but list..add() is the list itself.
* Passing objects is passing references, passing primitive variables is passing values:
  ```dart
    person1.name = 'first';
    person2 = person1;
    person1.name = 'second';
    print(person2.name); = second
    int x = 10;
    y = x;
    x = 20;
    print(y); = 10
  ```
  * Also works for functions, when an object is passed to a function, it can modify the object itself.

* **Mixin**: 
  * class A with B
  * class B
  * class A gains access to all features and properties from B.
* **Extension**:
  * class A
  * extension B on A
  * class A and B gains access to all features and properties from each other.
  * B can even access A's mixins.
  ```dart
    class Human with Helper {
      final name = 'João';
    }

    class Helper {
      final secondName = 'Paulo';
    }

    extension Voice on Human {
      void say() => print('$name $secondName');
    }
  ```