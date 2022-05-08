import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/app/presentation/components/app_list.dart';
import 'package:movie_app/app/presentation/components/pagination.dart';
import 'package:movie_app/app/presentation/components/search_app_bar.dart';
import 'package:movie_app/app/presentation/pages/common/list_controller.dart';
import 'package:movie_app/app/presentation/pages/drawer/app_drawer.dart';
import 'package:movie_app/app/presentation/pages/theme.dart';

class ListPage extends StatelessWidget {
  const ListPage(this.controller, {Key? key}) : super(key: key);

  final ListController controller;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (controller.isLoading) {
          return Scaffold(
            appBar: AppBar(),
            drawer: const AppDrawer(),
            body: Padding(
              padding: kAppPagePadding,
              child: Stack(
                children: [
                  Center(
                    child: CircularProgressIndicator(color: Theme.of(context).primaryColor),
                  ),
                  Visibility(
                    visible: controller.isPaginated,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Pagination(
                        page: controller.page,
                        totalPages: controller.listEntity?.totalPages ?? 1,
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
            drawer: const AppDrawer(),
            body: Center(
              child: Text(
                'You have no favorites :(',
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
            drawer: const AppDrawer(),
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
                  Visibility(
                    visible: controller.isPaginated,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Pagination(
                        page: controller.page,
                        totalPages: controller.listEntity?.totalPages ?? 1,
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
