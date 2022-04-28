import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/domain/usecases/favorite_movies_list_usecase.dart';
import 'package:movie_app/app/presentation/components/app_list.dart';
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
    return Observer(builder: (context) {
      if (controller.isLoading) {
        return Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        );
      }

      if (controller.isListEmpty()) {
        return const Center(
          child: Text(
            'You have no favorites :(',
            style: TextStyle(fontSize: 24),
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
              if (controller.isSearching)
                SearchAppBarAction(
                  controller: controller,
                  // textController: controller.textController,
                  // searchFocus: controller.searchFocus,
                  // onSearch: controller.onSearch,
                ),
            ],
          ),
          drawer: const AppDrawer(),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: AppList(
                    itemCount: controller.movies.length,
                    list: controller.movies,
                    onTap: controller.openMoviePage,
                    type: AppListType.movies,
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
