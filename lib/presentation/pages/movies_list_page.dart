import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/domain/usecases/get_movies_from_list_usecase.dart';
import 'package:movie_app/presentation/components/list_details.dart';
import 'package:movie_app/presentation/components/movie_card.dart';
import 'package:movie_app/presentation/components/search_appbar_action.dart';
import 'package:movie_app/presentation/controllers/home_controller.dart';

class MoviesListPage extends StatefulWidget {
  const MoviesListPage({Key? key}) : super(key: key);

  @override
  State<MoviesListPage> createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();

    controller = GetIt.instance.get<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.moviesList == null) {
        return const Center(
          child: CircularProgressIndicator(color: Colors.white),
        );
      }

      return GestureDetector(
        onTap: () {
          controller.searchFocus.unfocus();
          if (controller.textController.text.isEmpty) controller.isSearching = false;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: Visibility(
              visible: !controller.isSearching,
              child: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
            ),
            actions: [SearchAppBarAction(controller: controller)],
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
                        return MovieCard(
                          movie: controller.moviesList!.movies[index],
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
    });
  }
}
