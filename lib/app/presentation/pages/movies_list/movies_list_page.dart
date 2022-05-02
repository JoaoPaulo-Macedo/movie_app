import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/app/domain/usecases/favorite_movies_list_usecase.dart';
import 'package:movie_app/app/domain/usecases/get_movies_list_usecase.dart';
import 'package:movie_app/app/presentation/components/app_list.dart';
import 'package:movie_app/app/presentation/pages/favorites/favorites_page.dart';
import 'package:movie_app/app/presentation/pages/movies_list/components/movies_list_details.dart';
import 'package:movie_app/app/presentation/components/app_cards.dart';
import 'package:movie_app/app/presentation/components/search_appbar_action.dart';
import 'package:movie_app/app/presentation/pages/movies_list/movies_list_controller.dart';

class MoviesListPage extends StatefulWidget {
  const MoviesListPage({Key? key, required this.listId}) : super(key: key);

  final int listId;

  @override
  State<MoviesListPage> createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  late MoviesListController controller;

  @override
  void initState() {
    super.initState();

    controller = MoviesListController(
      context,
      GetIt.I.get<GetMoviesListUseCase>(),
      GetIt.I.get<FavoriteMoviesListUseCase>(),
      listId: widget.listId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (controller.isLoading) {
          return Scaffold(
            appBar: AppBar(),
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
            body: Center(
              child: Text(
                'No movies found :(',
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
