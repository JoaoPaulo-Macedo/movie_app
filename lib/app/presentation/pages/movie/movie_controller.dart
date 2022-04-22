import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/usecases/favorite_movies_list_usecase.dart';

part 'movie_controller.g.dart';

class MovieController = _MovieController with _$MovieController;

// TODO: make favorites and home controller one
abstract class _MovieController with Store {
  _MovieController(this._favoriteUseCase, this.movie, {required this.favorite}) {
    _init();
  }

  final FavoriteMoviesListUseCase _favoriteUseCase;
  final MovieEntity movie;

  @observable
  bool favorite;
  @observable
  ValueNotifier<bool> loading = ValueNotifier(false);
  @observable
  int page = 1;

  BuildContext? _context;
  bool? _favoriteCache;
  bool _toggle = false;
  bool _close = false;

  _init() {
    _favoriteCache = favorite;

    loading.addListener(() {
      if (_toggle) {
        _toggle = false;
        _togglefavorite();
      }

      if (_close) _onClose(_context!);
    });
  }

  @action
  togglefavorite() {
    if (loading.value == true) return;

    _toggle = true;
    loading.value = true;
  }

  _togglefavorite() async {
    if (!favorite) {
      favorite = !favorite;
      await _favoriteUseCase.saveFavorite(movie, page);
    } else {
      favorite = !favorite;
      await _favoriteUseCase.removeFavorite(movie, page);
    }

    loading.value = false;
  }

  @action
  onClose(BuildContext context) {
    _context = context;
    _close = true;
    loading.value = true;
  }

  //TODO: gambiarras
  _onClose(BuildContext context) async {
    bool changed = _favoriteCache != favorite;
    loading.dispose();
    Navigator.pop(context, [changed]);
  }
}
