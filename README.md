<h1 align="center"> Movie App </h1>

<div align="center">
:movie_camera: Aplicativo desenvolvido para fins de estudo e portfólio. :movie_camera:
</div>
<br>
<div align="center">
 <img src="" alt="movie" width="250"/>
</div>

---

* [Tecnologias](#computer-tecnologias)
* [Motivação](#muscle-motivação)
* [Arquitetura](#triangular_ruler-arquitetura)
  * [Gestão de Estado](#clapper-gestão-de-estado)
  * [Injeção de Dependências](#syringe-injeção-de-dependências)
* [Funcionalidades](#pencil-funcionalidades)

# :computer: Tecnologias
O projeto foi desenvolvido com **Flutter**, incluindo packages como **dio**, **lottie**, **shared_preferences**, **flutter_mobx**, **get_it** e **cached_network_image**.

# :muscle: Motivação
A ideia de desenvolver um aplicativo baseado na API do site [**The Movies DB**]() surgiu quando acompanhava os estudos de arquitetura Flutter no canal do YouTube do **Deivid Willyan**, com a playlist [**Curso Arquitetura no Flutter - 2022**](https://www.youtube.com/playlist?list=PLRpTFz5_57cvCYRhHUui2Bis-5Ybh78TS). No curso foi iniciada uma integração simples, que posteriormente ampliei nesse projeto para contemplar mais funcionalidades e integrações. As funcionalidades por mim implementadas foram:
* Login com email e senha (criar e armazenar sessão).
* Logout (deletar sessão).
* Favoritar filmes em uma conta logada.
* Navegar entre 10 listas de filmes fornecidas pela API.

# :triangular_ruler: Arquitetura
Em sua arquitetura, foi implementado o [**Clean Dart**](https://github.com/Flutterando/Clean-Dart) proposto pela **Flutterando** como implementação da **Clean Architecture** no Flutter. Esse modelo pode ser dividido do seguinte modo:
* Entities como regras de negócio da empresa ou organização.
* Usecases como regras de negócio da aplicação.
* Repositories e Datasources para comunicação com serviços e demais tratamentos.

Além disso, o Clean Architecture propõe o conjunto de princípios conhecido como **SOLID**.

## :clapper: Gestão de Estado
Para gestão de estado foi adotado o **Mobx** do package **flutter_mobx**. A escolha se deu devido à sua simplicidade e agilidade na implementação, além da sua crescente popularidade na comunidade Flutter.

## :syringe: Injeção de Dependências
A injeção de dependências foi implementada com o package **get_it**. Escolhido por ser um package simples que atende bem as demandas do aplicativo, contribuindo na implementação do princípio SOLID da inversão de dependências.

# :pencil: Funcionalidades
* Login com email e senha.
* Logout.
* Navegar entre 10 listas de filmes.
* Visualizar informações de filmes, como poster, descrição e outros.
* Favoritar filmes para sua conta.

Veja o vídeo exemplo a seguir:
[Video from YouTube]()
