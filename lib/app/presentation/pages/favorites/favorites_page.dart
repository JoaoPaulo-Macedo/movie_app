import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/app/domain/usecases/favorite_movies_list_usecase.dart';
import 'package:movie_app/app/presentation/components/app_list.dart';
import 'package:movie_app/app/presentation/components/pagination.dart';
import 'package:movie_app/app/presentation/components/search_appbar_action.dart';
import 'package:movie_app/app/presentation/pages/drawer/app_drawer.dart';
import 'package:movie_app/app/presentation/pages/favorites/favorites_controller.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late FavoritesController controller;

  @override
  void initState() {
    super.initState();

    controller = FavoritesController(
      context,
      GetIt.instance.get<FavoriteMoviesListUseCase>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (controller.isLoading) {
          return Scaffold(
            appBar: AppBar(),
            drawer: const AppDrawer(),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Stack(
                children: [
                  Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  if (controller.isPaginated)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Pagination2(
                          page: controller.page,
                          totalPages: controller.moviesList?.totalPages ?? 1,
                          backPage: () => controller.backPage(context),
                          advancePage: () => controller.advancePage(context),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        }

        if (controller.isListEmpty()) {
          return Scaffold(
            appBar: AppBar(),
            drawer: const AppDrawer(),
            body: Center(
              child: Text(
                'You have no favorites :(',
                style: GoogleFonts.lora(fontSize: 25),
              ),
            ),
          );
        }

        return GestureDetector(
          onTap: () {
            controller.searchFocus.unfocus();

            if (controller.textController.text.isEmpty) {
              controller.isSearching = false;
            }
          },
          child: Scaffold(
            appBar: AppBar(
              leading: controller.isSearching ? const SizedBox() : null,
              actions: [
                if (!controller.isSearching)
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      controller.isSearching = true;
                      controller.searchFocus.requestFocus();
                    },
                  ),
                if (controller.isSearching) SearchAppBarAction(controller: controller),
              ],
            ),
            drawer: const AppDrawer(),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Stack(
                children: [
                  AppList(
                    itemCount: controller.movies.length,
                    list: controller.movies,
                    onTap: controller.openMoviePage,
                    type: AppListType.movies,
                  ),
                  if (controller.isPaginated)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Pagination2(
                          page: controller.page,
                          totalPages: controller.moviesList?.totalPages ?? 1,
                          backPage: () => controller.backPage(context),
                          advancePage: () => controller.advancePage(context),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Pagination2 extends StatelessWidget {
  const Pagination2({
    Key? key,
    required this.page,
    required this.totalPages,
    required this.backPage,
    required this.advancePage,
  }) : super(key: key);

  final int page;
  final int totalPages;
  final Function backPage;
  final Function advancePage;

  @override
  Widget build(BuildContext context) {
    var cardColor = Theme.of(context).cardColor.withOpacity(0.85);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Material(
            color: cardColor, //TODO: make var cardcolor
            child: InkWell(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back_ios_new_outlined),
              ),
              onTap: () => backPage(),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            '$page/$totalPages',
            style: const TextStyle(fontSize: 22),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Material(
            color: cardColor,
            child: InkWell(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_forward_ios_rounded),
              ),
              onTap: () => advancePage(),
            ),
          ),
        ),
      ],
    );
  }
}
