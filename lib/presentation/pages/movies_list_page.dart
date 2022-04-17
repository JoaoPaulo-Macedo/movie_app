import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
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
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();

    controller = GetIt.instance.get<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    var deleteController = TextEditingController();

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
          key: _key,
          appBar: AppBar(
            leading: Visibility(
              visible: !controller.isSearching,
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  _key.currentState?.openDrawer();
                },
              ),
            ),
            actions: [SearchAppBarAction(controller: controller)],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Drawer Header'),
                ),
                ListTile(
                  title: const Text('Favorites Lists'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Favorites Movies'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
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
