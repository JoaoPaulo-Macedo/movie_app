import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/domain/usecases/get_list_usecase.dart';
import 'package:movie_app/app/presentation/components/app_snackbar.dart';
import 'package:movie_app/app/presentation/pages/list_page/list_page.dart';
import 'package:movie_app/app/presentation/pages/movies_list/movies_list_controller.dart';
import 'package:movie_app/core/utils/failure.dart';

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

    controller = MoviesListController(GetIt.I.get<GetListUseCase>(), listId: widget.listId);
  }

  @override
  Widget build(BuildContext context) {
    return ListPage(controller, type: ListPageType.common, errorMessage: 'No movies found!');
  }
}
