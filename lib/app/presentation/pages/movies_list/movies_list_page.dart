import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/domain/usecases/favorite_movies_list_usecase.dart';
import 'package:movie_app/app/domain/usecases/get_movies_list_usecase.dart';
import 'package:movie_app/app/presentation/components/movies_list_details.dart';
import 'package:movie_app/app/presentation/components/app_card.dart';
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
        if (controller.movies.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
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
                if (controller.isSearching)
                  SearchAppBarAction(controller: controller),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MoviesListDetails(controller: controller),
                  const SizedBox(height: 15),
                  Visibility(
                    visible: controller.isLoading,
                    child: const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !controller.isLoading,
                    child: Expanded(
                      child: ListView.separated(
                        itemCount: controller.movies.length,
                        padding: EdgeInsets.zero,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (_, index) {
                          return AppCard.movie(
                            controller.movies[index],
                            controller.openMoviePage,
                          );
                        },
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
