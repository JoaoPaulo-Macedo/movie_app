import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/domain/usecases/get_all_lists_usecase.dart';
import 'package:movie_app/app/presentation/components/app_lists.dart';
import 'package:movie_app/app/presentation/components/app_snackbar.dart';
import 'package:movie_app/app/presentation/consts.dart';
import 'package:movie_app/app/presentation/pages/drawer/app_drawer.dart';
import 'package:movie_app/app/presentation/pages/home/home_controller.dart';
import 'package:movie_app/core/utils/failure.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();

    controller = HomeController(GetIt.instance.get<GetAllListsUseCase>(), snackBar: snackBar);
  }

  snackBar(Failure f) {
    AppSnackBar.show(
      context,
      message: f.message,
      description: f.description,
      type: AppSnackBarType.error,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (controller.error != null) {
          snackBar(controller.error!);

          controller.error = null;
        }

        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }

        return Scaffold(
          appBar: AppBar(),
          drawer: const AppDrawer(),
          body: Padding(
            padding: kAppPagePadding,
            child: Column(
              children: [
                Expanded(child: HomeList(controller)),
              ],
            ),
          ),
        );
      },
    );
  }
}
