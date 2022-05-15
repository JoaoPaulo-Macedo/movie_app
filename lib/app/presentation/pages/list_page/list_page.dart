import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/app/presentation/components/app_lists.dart';
import 'package:movie_app/app/presentation/components/app_snackbar.dart';
import 'package:movie_app/app/presentation/components/search_app_bar.dart';
import 'package:movie_app/app/presentation/pages/list_page/list_controller.dart';
import 'package:movie_app/app/presentation/pages/drawer/app_drawer.dart';
import 'package:movie_app/app/presentation/app_styles.dart';
import 'package:movie_app/core/utils/failure.dart';

enum ListPageType { common, favorite }

class ListPage extends StatelessWidget {
  const ListPage(
    this.controller, {
    Key? key,
    required this.type,
    required this.errorMessage,
  }) : super(key: key);

  final ListController controller;
  final ListPageType type;
  final String errorMessage;

  snackBar(BuildContext context, Failure f) {
    AppSnackBar.error(context, message: f.message, description: f.description);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (controller.isEmpty && controller.isLoading) {
          return Scaffold(
            appBar: AppBar(),
            drawer: type == ListPageType.common ? null : const AppDrawer(),
            body: Center(
              child: CircularProgressIndicator(color: Theme.of(context).primaryColor),
            ),
          );
        }

        if (controller.isEmpty && !controller.isLoading) {
          if (controller.error != null) {
            snackBar(context, controller.error!);

            controller.error = null;
          }

          return Scaffold(
            appBar: AppBar(),
            drawer: type == ListPageType.common ? null : const AppDrawer(),
            body: Center(
              child: Text(
                errorMessage,
                style: AppTextStyles.of(context).large,
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
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: SearchAppBar(controller),
            ),
            drawer: type == ListPageType.common ? null : const AppDrawer(),
            body: MoviesList(controller),
          ),
        );
      },
    );
  }
}
