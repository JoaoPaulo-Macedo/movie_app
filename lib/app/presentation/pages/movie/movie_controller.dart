import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/usecases/get_favorites_usecase.dart';
import 'package:movie_app/app/domain/usecases/remove_favorite_usecase.dart';
import 'package:movie_app/app/domain/usecases/save_favorite_usecase.dart';
import 'package:movie_app/app/presentation/components/app_snackbar.dart';
import 'package:movie_app/core/utils/failure.dart';

part 'movie_controller.g.dart';

class MovieController = _MovieController with _$MovieController;

abstract class _MovieController with Store {
  _MovieController(
    BuildContext this._context,
    this._getFavoritesUseCase,
    this._saveFavoriteUseCase,
    this._removeFavoriteUseCase,
    this.movie,
  ) {
    _init();
  }

  final GetFavoritesUseCase _getFavoritesUseCase;
  final SaveFavoriteUseCase _saveFavoriteUseCase;
  final RemoveFavoriteUseCase _removeFavoriteUseCase;
  final MovieEntity movie;

  @observable
  bool isFavorite = false;
  @observable
  ValueNotifier<bool> loading = ValueNotifier(false);
  @observable
  int page = 1;
  @observable
  double offset = 0;

  ScrollController scrollController = ScrollController();

  BuildContext? _context;
  bool? _isFavoriteCache;
  bool _toggle = false;
  bool _close = false;

  _init() async {
    try {
      loading.value = true;

      var favorites = await _getFavoritesUseCase();

      isFavorite = favorites!.movies!.any((e) => e.id == movie.id);

      _isFavoriteCache = isFavorite;

      loading.addListener(() {
        if (_toggle) {
          _toggle = false;
          _togglefavorite();
        }

        if (_close) _onClose(_context!);
      });

      scrollController.addListener(() {
        double controllerOffset = scrollController.offset;

        if (controllerOffset < 0) return;

        offset = controllerOffset;
      });

      loading.value = false;
    } on Failure catch (e) {
      //TODO: Should the controller call a ui widget?
      AppSnackBar.show(
        _context!,
        message: e.message,
        description: e.description,
        type: AppSnackBarType.error,
      );
    }
  }

  @action
  togglefavorite() {
    if (loading.value == true) return;

    _toggle = true;
    loading.value = true;
  }

  _togglefavorite() async {
    if (!isFavorite) {
      isFavorite = !isFavorite;
      await _saveFavoriteUseCase(movie, page);
    } else {
      isFavorite = !isFavorite;
      await _removeFavoriteUseCase(movie, page);
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
    bool changed = _isFavoriteCache != isFavorite;
    loading.dispose();
    Navigator.pop(context, [changed]);
  }
}
