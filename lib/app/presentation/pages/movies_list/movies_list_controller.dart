import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/usecases/get_list_usecase.dart';
import 'package:movie_app/app/presentation/pages/list_page/list_controller.dart';
import 'package:movie_app/core/utils/failure.dart';

part 'movies_list_controller.g.dart';

class MoviesListController = _MoviesListController with _$MoviesListController;

abstract class _MoviesListController extends ListController with Store {
  _MoviesListController(this._moviesUseCase, {required this.listId}) {
    init();
  }

  final GetListUseCase _moviesUseCase;

  @observable
  int listId;

  @action
  @override
  init() async {
    isLoading = true;

    scrollController.addListener(() async {
      if (scrollController.position.atEdge && scrollController.offset != 0) {
        if (changePage()) {
          isLoading = true;

          var list = await fetchMovies();

          addMovies(list);
          cachedMovies = movies;

          isLoading = false;

          scrollController.jumpTo(scrollController.offset + 20);
        }
      }
    });

    try {
      listEntity = await _moviesUseCase(list: listId, page: 1);

      addMovies(listEntity?.movies);
      cachedMovies = movies;

      totalPages = listEntity?.totalPages ?? 1;

      isEmpty = false;
      isLoading = false;
    } on Failure catch (f) {
      isLoading = false;
      error = f;
    }
  }

  @action
  @override
  fetchMovies() async {
    try {
      var list = await _moviesUseCase(list: listId, page: page);

      return list?.movies;
    } on Failure catch (f) {
      isLoading = false;
      error = f;

      return null;
    }
  }
}
