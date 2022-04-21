import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
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

    controller = GetIt.instance.get<FavoritesController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text(
          'You have no favorites yet :(',
          style: TextStyle(fontSize: 20),
        ),
      ),
      /* body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                padding: EdgeInsets.zero,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (_, listId) {
                  return Container(
                    height: 140,
                    decoration: BoxDecoration(color: Theme.of(context).cardColor),
                  );
                },
              ),
            ),
          ],
        ),
      ), */
    );
  }
}
