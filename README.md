<h1 align="center"> Movie App </h1>

<div align="center">
:movie_camera: Aplicativo integrado à API do site The Movie DB para acesso ao seu acervo de filmes. :movie_camera: <br>
Desenvolvido para fins de estudo e portfólio.
</div>
<br>
<div align="center">
 <img src="https://user-images.githubusercontent.com/58576452/168867603-16477009-7a92-48c9-82af-84194244ebc5.png" alt="movie" width="250"/>
</div>

---

* [Tecnologias](#computer-tecnologias)
* [Motivação](#muscle-motivação)
* [Arquitetura](#triangular_ruler-arquitetura)
  * [Gestão de Estado](#clapper-gestão-de-estado)
  * [Injeção de Dependências](#syringe-injeção-de-dependências)

# :computer: Tecnologias
O projeto foi desenvolvido com **Flutter**, e inclui packages como **dio**, **lottie**, **shared_preferences**, **flutter_mobx**, **get_it** e **cached_network_image**.

# :muscle: Motivação
A ideia de desenvolver um aplicativo baseado na API do site [**The Movies DB**](https://www.themoviedb.org/) surgiu quando acompanhava os estudos de arquitetura Flutter no canal do YouTube do [**Deivid Willyan**](https://github.com/DeividWillyan), com a playlist [**Curso Arquitetura no Flutter - 2022**](https://www.youtube.com/playlist?list=PLRpTFz5_57cvCYRhHUui2Bis-5Ybh78TS). No curso foi iniciado uma integração simples, que mostrava uma lista de filmes vindo da API e recuperava informações desses filmes. Posteriormente ampliei o projeto para contemplar mais funcionalidades e integrações. As funcionalidades por mim implementadas foram:
* Login com e-mail e senha (criar e armazenar sessão).
* Logout (deletar sessão).
* Favoritar filmes em uma conta logada.
* Navegar entre 10 listas de filmes fornecidas pela API.

Veja o vídeo exemplo a seguir: [video from YouTube](https://youtu.be/Odb5Cv9kf24)

# :triangular_ruler: Arquitetura
Em sua arquitetura, foi implementado o [**Clean Dart**](https://github.com/Flutterando/Clean-Dart) proposto pela **Flutterando** como implementação da **Clean Architecture** no Flutter. Esse modelo pode ser dividido do seguinte modo:
* **Presentation** (UI, Flutter, Controllers, State Manager, etc).
* **Domain** (apenas regras de negócios).
  * Entities: regras de negócio da empresa.
  * Usecases: regras de negócio da aplicação.
  * Interfaces/contratos de Repositories.
* **Data**
  * Implementação de Repositories.
  * Tratamento dos dados externos.
  * Interfaces/contratos de DataSources.
* **External**
  * Implementação de DataSources.
  * Acessos externos que dependem de packages, drivers, APIs, etc.

Além disso, o Clean Architecture propõe o conjunto de princípios conhecido como **SOLID**.

## :clapper: Gestão de Estado
Para gestão de estado foi adotado o **Mobx** do package **flutter_mobx**. A escolha se deu devido à sua simplicidade e agilidade na implementação, além da sua crescente popularidade na comunidade Flutter.

## :syringe: Injeção de Dependências
A injeção de dependências foi implementada com o package **get_it**. Escolhido por ser um package simples que atende bem as demandas do aplicativo, contribuindo na implementação do princípio SOLID da inversão de dependências.
