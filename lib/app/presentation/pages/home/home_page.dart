import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/presentation/pages/drawer/app_drawer.dart';
import 'package:movie_app/app/presentation/components/app_card.dart';
import 'package:movie_app/app/presentation/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late HomeController controller;

  @override
  void initState() {
    super.initState();

    controller = GetIt.instance.get<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (controller.lists.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }

        return Scaffold(
          appBar: AppBar(),
          // key: _key,
          // appBar: AppBar(
          //   leading: IconButton(
          //     icon: const Icon(Icons.menu),
          //     onPressed: () {
          //       _key.currentState?.openDrawer();
          //     },
          //   ),
          // ),
          drawer: const AppDrawer(),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: controller.lists.length,
                    padding: EdgeInsets.zero,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (_, listId) {
                      return AppCard.list(
                        controller.lists[listId],
                        controller.openListPage,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
