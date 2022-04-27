// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MoviesListController on _MoviesListController, Store {
  final _$moviesAtom = Atom(name: '_MoviesListController.movies');

  @override
  List<MovieEntity> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(List<MovieEntity> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  final _$_cachedMoviesAtom = Atom(name: '_MoviesListController._cachedMovies');

  @override
  Map<int, List<MovieEntity>>? get _cachedMovies {
    _$_cachedMoviesAtom.reportRead();
    return super._cachedMovies;
  }

  @override
  set _cachedMovies(Map<int, List<MovieEntity>>? value) {
    _$_cachedMoviesAtom.reportWrite(value, super._cachedMovies, () {
      super._cachedMovies = value;
    });
  }

  final _$listIdAtom = Atom(name: '_MoviesListController.listId');

  @override
  int get listId {
    _$listIdAtom.reportRead();
    return super.listId;
  }

  @override
  set listId(int value) {
    _$listIdAtom.reportWrite(value, super.listId, () {
      super.listId = value;
    });
  }

  final _$pageAtom = Atom(name: '_MoviesListController.page');

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

  final _$isLoadingAtom = Atom(name: '_MoviesListController.isLoading');

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

  final _$isSearchingAtom = Atom(name: '_MoviesListController.isSearching');

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

  final _$searchFocusAtom = Atom(name: '_MoviesListController.searchFocus');

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
      Atom(name: '_MoviesListController.textController');

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

  final _$_MoviesListControllerActionController =
      ActionController(name: '_MoviesListController');

  @override
  dynamic onSearch(String? value) {
    final _$actionInfo = _$_MoviesListControllerActionController.startAction(
        name: '_MoviesListController.onSearch');
    try {
      return super.onSearch(value);
    } finally {
      _$_MoviesListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic backPage(BuildContext context) {
    final _$actionInfo = _$_MoviesListControllerActionController.startAction(
        name: '_MoviesListController.backPage');
    try {
      return super.backPage(context);
    } finally {
      _$_MoviesListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic advancePage(BuildContext context) {
    final _$actionInfo = _$_MoviesListControllerActionController.startAction(
        name: '_MoviesListController.advancePage');
    try {
      return super.advancePage(context);
    } finally {
      _$_MoviesListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic openMoviePage(BuildContext context, MovieEntity movie) {
    final _$actionInfo = _$_MoviesListControllerActionController.startAction(
        name: '_MoviesListController.openMoviePage');
    try {
      return super.openMoviePage(context, movie);
    } finally {
      _$_MoviesListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movies: ${movies},
listId: ${listId},
page: ${page},
isLoading: ${isLoading},
isSearching: ${isSearching},
searchFocus: ${searchFocus},
textController: ${textController}
    ''';
  }
}
