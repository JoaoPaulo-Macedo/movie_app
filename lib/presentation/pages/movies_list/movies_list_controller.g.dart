// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MoviesListController on _MoviesListController, Store {
  final _$moviesListAtom = Atom(name: '_HomeController.moviesList');

  @override
  MoviesListEntity? get moviesList {
    _$moviesListAtom.reportRead();
    return super.moviesList;
  }

  @override
  set moviesList(MoviesListEntity? value) {
    _$moviesListAtom.reportWrite(value, super.moviesList, () {
      super.moviesList = value;
    });
  }

  final _$_cachedMoviesListAtom = Atom(name: '_HomeController._cachedMoviesList');

  @override
  MoviesListEntity? get _cachedMoviesList {
    _$_cachedMoviesListAtom.reportRead();
    return super._cachedMoviesList;
  }

  @override
  set _cachedMoviesList(MoviesListEntity? value) {
    _$_cachedMoviesListAtom.reportWrite(value, super._cachedMoviesList, () {
      super._cachedMoviesList = value;
    });
  }

  final _$listIdAtom = Atom(name: '_HomeController.listId');

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

  final _$pageAtom = Atom(name: '_HomeController.page');

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

  final _$favoriteAtom = Atom(name: '_HomeController.favorite');

  @override
  bool get favorite {
    _$favoriteAtom.reportRead();
    return super.favorite;
  }

  @override
  set favorite(bool value) {
    _$favoriteAtom.reportWrite(value, super.favorite, () {
      super.favorite = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HomeController.isLoading');

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

  final _$isSearchingAtom = Atom(name: '_HomeController.isSearching');

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

  final _$searchFocusAtom = Atom(name: '_HomeController.searchFocus');

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

  final _$textControllerAtom = Atom(name: '_HomeController.textController');

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

  final _$fetchAsyncAction = AsyncAction('_HomeController.fetch');

  @override
  Future fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  dynamic onSearch(String value) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.onChanged');
    try {
      return super.onSearch(value);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic backPage() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.backPage');
    try {
      return super.backPage();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic advancePage() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.advancePage');
    try {
      return super.advancePage();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleFavorite() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.toggleFavorite');
    try {
      return super.toggleFavorite();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
moviesList: ${moviesList},
listId: ${listId},
page: ${page},
favorite: ${favorite},
isLoading: ${isLoading},
isSearching: ${isSearching},
searchFocus: ${searchFocus},
textController: ${textController}
    ''';
  }
}
