import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/domain/usecases/get_list_usecase.dart';
import 'package:movie_app/app/presentation/components/app_list.dart';
import 'package:movie_app/app/presentation/components/pagination.dart';
import 'package:movie_app/app/presentation/components/search_app_bar.dart';
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
      listId: widget.listId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (controller.isLoading) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
            body: Center(
              child: Text(
                'No movies found :(',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          );
        }

        return GestureDetector(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: SearchAppBar(controller),
            ),
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
          onTap: () {
            controller.searchFocus.unfocus();

            if (controller.textController.text.isEmpty) {
              controller.isSearching = false;
            }
          },
        );
      },
    );
  }
}
