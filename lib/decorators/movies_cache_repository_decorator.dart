import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/movies_list.dart';
import '../repositories/movies_repository.dart';
import 'movies_repository_decorator.dart';

class MoviesCacheRepositoryDecorator extends MoviesRepositoryDecorator {
  MoviesCacheRepositoryDecorator(MoviesRepository repository) : super(repository);

  final _key = 'movies_cache';

  @override
  Future<MoviesList?> getMovies() async {
    try {
      MoviesList? movies = await super.getMovies();
      if (movies != null) _saveInCache(movies);

      return movies;
    } catch (e) {
      print(e);
      try {
        return await _getInCache();
      } catch (e) {
        print(e);
        return null;
      }
    }
  }

  _saveInCache(MoviesList movies) async {
    var prefs = await SharedPreferences.getInstance();
    String moviesJsonString = jsonEncode(movies.toJson());

    prefs.setString(_key, moviesJsonString);
  }

  Future<MoviesList> _getInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var cachedMoviesJson = jsonDecode(prefs.getString(_key) ?? '');

    return MoviesList.fromJson(cachedMoviesJson);
  }
}
