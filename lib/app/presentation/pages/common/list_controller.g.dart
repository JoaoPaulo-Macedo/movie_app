// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListController on _ListController, Store {
  final _$moviesAtom = Atom(name: '_ListController.movies');

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

  final _$cachedMoviesAtom = Atom(name: '_ListController.cachedMovies');

  @override
  Map<int, List<MovieEntity>> get cachedMovies {
    _$cachedMoviesAtom.reportRead();
    return super.cachedMovies;
  }

  @override
  set cachedMovies(Map<int, List<MovieEntity>> value) {
    _$cachedMoviesAtom.reportWrite(value, super.cachedMovies, () {
      super.cachedMovies = value;
    });
  }

  final _$pageAtom = Atom(name: '_ListController.page');

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

  final _$isLoadingAtom = Atom(name: '_ListController.isLoading');

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

  final _$isSearchingAtom = Atom(name: '_ListController.isSearching');

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

  final _$isPaginatedAtom = Atom(name: '_ListController.isPaginated');

  @override
  bool get isPaginated {
    _$isPaginatedAtom.reportRead();
    return super.isPaginated;
  }

  @override
  set isPaginated(bool value) {
    _$isPaginatedAtom.reportWrite(value, super.isPaginated, () {
      super.isPaginated = value;
    });
  }

  final _$searchFocusAtom = Atom(name: '_ListController.searchFocus');

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

  final _$textControllerAtom = Atom(name: '_ListController.textController');

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

  @override
  String toString() {
    return '''
movies: ${movies},
cachedMovies: ${cachedMovies},
page: ${page},
isLoading: ${isLoading},
isSearching: ${isSearching},
isPaginated: ${isPaginated},
searchFocus: ${searchFocus},
textController: ${textController}
    ''';
  }
}
