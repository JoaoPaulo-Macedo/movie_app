import 'dart:convert';
import 'package:movie_app/data/datasource/favorites_movies_list_datasource.dart';
import 'package:movie_app/data/dtos/favorite_movies_list_dto.dart';
import 'package:movie_app/domain/entities/favorite_movies_list_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesMoviesListDataSourceImp extends FavoriteMoviesListDatasource {
  final _key = 'favorites_movies';

  @override
  Future<List<FavoriteMoviesListEntity>> getList() async {
    List<String> list = await _getCurrentList();
    List<FavoriteMoviesListEntity> movies = [];

    for (var e in list) {
      movies.add(FavoriteMoviesListDTO.fromJson(jsonDecode(e)));
    }

    return movies;
  }

  @override
  void saveList(moviesList) async {
    List<String> list = await _getCurrentList();

    bool alreadyInList = list.any((e) {
      var a = FavoriteMoviesListDTO.fromJson(jsonDecode(e));
      return a.id == moviesList.id;
    });

    if (alreadyInList) return;

    var value = jsonEncode(moviesList.toJson());

    list.add(value);

    _saveChanges(list);
  }

  @override
  void removeList(listId) async {
    List<String> list = await _getCurrentList();

    list.removeWhere((e) => jsonDecode(e)['listId'] == listId);

    _saveChanges(list);
  }

  @override
  clear() async {
    var prefs = await SharedPreferences.getInstance();

    prefs.clear();
  }

  Future<List<String>> _getCurrentList() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  void _saveChanges(list) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_key, list);
  }
}
