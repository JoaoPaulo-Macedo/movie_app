// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritesController on _FavoritesController, Store {
  final _$moviesListAtom = Atom(name: '_FavoritesController.moviesList');

  @override
  FavoriteMoviesListEntity? get moviesList {
    _$moviesListAtom.reportRead();
    return super.moviesList;
  }

  @override
  set moviesList(FavoriteMoviesListEntity? value) {
    _$moviesListAtom.reportWrite(value, super.moviesList, () {
      super.moviesList = value;
    });
  }

  final _$_cachedMoviesAtom = Atom(name: '_FavoritesController._cachedMovies');

  @override
  Map<int, List<MovieEntity>> get _cachedMovies {
    _$_cachedMoviesAtom.reportRead();
    return super._cachedMovies;
  }

  @override
  set _cachedMovies(Map<int, List<MovieEntity>> value) {
    _$_cachedMoviesAtom.reportWrite(value, super._cachedMovies, () {
      super._cachedMovies = value;
    });
  }

  final _$pageAtom = Atom(name: '_FavoritesController.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_FavoritesController.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isSearchingAtom = Atom(name: '_FavoritesController.isSearching');

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  final _$searchFocusAtom = Atom(name: '_FavoritesController.searchFocus');

  @override
  FocusNode get searchFocus {
    _$searchFocusAtom.reportRead();
    return super.searchFocus;
  }

  @override
  set searchFocus(FocusNode value) {
    _$searchFocusAtom.reportWrite(value, super.searchFocus, () {
      super.searchFocus = value;
    });
  }

  final _$textControllerAtom =
      Atom(name: '_FavoritesController.textController');

  @override
  TextEditingController get textController {
    _$textControllerAtom.reportRead();
    return super.textController;
  }

  @override
  set textController(TextEditingController value) {
    _$textControllerAtom.reportWrite(value, super.textController, () {
      super.textController = value;
    });
  }

  final _$openMoviePageAsyncAction =
      AsyncAction('_FavoritesController.openMoviePage');

  @override
  Future openMoviePage(BuildContext context, MovieEntity movie) {
    return _$openMoviePageAsyncAction
        .run(() => super.openMoviePage(context, movie));
  }

  final _$_FavoritesControllerActionController =
      ActionController(name: '_FavoritesController');

  @override
  bool isListEmpty() {
    final _$actionInfo = _$_FavoritesControllerActionController.startAction(
        name: '_FavoritesController.isListEmpty');
    try {
      return super.isListEmpty();
    } finally {
      _$_FavoritesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSearch(String? value) {
    final _$actionInfo = _$_FavoritesControllerActionController.startAction(
        name: '_FavoritesController.onSearch');
    try {
      return super.onSearch(value);
    } finally {
      _$_FavoritesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic backPage() {
    final _$actionInfo = _$_FavoritesControllerActionController.startAction(
        name: '_FavoritesController.backPage');
    try {
      return super.backPage();
    } finally {
      _$_FavoritesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic advancePage() {
    final _$actionInfo = _$_FavoritesControllerActionController.startAction(
        name: '_FavoritesController.advancePage');
    try {
      return super.advancePage();
    } finally {
      _$_FavoritesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
moviesList: ${moviesList},
page: ${page},
isLoading: ${isLoading},
isSearching: ${isSearching},
searchFocus: ${searchFocus},
textController: ${textController}
    ''';
  }
}
