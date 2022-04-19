import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/domain/usecases/get_movies_list_usecase.dart';
import 'package:movie_app/app/presentation/components/list_details.dart';
import 'package:movie_app/app/presentation/components/app_card.dart';
import 'package:movie_app/app/presentation/components/search_appbar_action.dart';
import 'package:movie_app/app/presentation/pages/list/list_controller.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late ListController controller;

  @override
  Widget build(BuildContext context) {
    //TODO: fix it
    int listId = ModalRoute.of(context)!.settings.arguments as int;

    controller = ListController(
      GetIt.I.get<GetMoviesListUseCase>(),
      listId: listId,
    );

    return Observer(
      builder: (_) {
        if (controller.moviesList == null) {
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
                  ListDetails(
                    controller: controller,
                    function: () => controller.fetch(),
                  ),
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
                        itemCount: controller.moviesList!.movies.length,
                        padding: EdgeInsets.zero,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (_, index) {
                          return AppCard.movie(
                            controller.moviesList!.movies[index],
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
