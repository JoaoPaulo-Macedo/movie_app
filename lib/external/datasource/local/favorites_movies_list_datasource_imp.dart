import 'dart:convert';
import 'package:movie_app/data/datasource/favorites_movies_list_datasource.dart';
import 'package:movie_app/data/dtos/list_identifier_dto.dart';
import 'package:movie_app/domain/entities/list_identifier_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesMoviesListDataSourceImp extends FavoriteMoviesListDatasource {
  final _key = 'favorites_movies';

  @override
  Future<List<ListIdentifierEntity>> getList() async {
    List<String> list = await _getCurrentList();
    List<ListIdentifierEntity> movies = [];

    for (var e in list) {
      movies.add(ListIdentifierDTO.fromJson(jsonDecode(e)));
    }

    return movies;
  }

  @override
  void saveList(int listId) async {
    /* List<String> list = await _getCurrentList();

    bool alreadyInList = list.any((e) {
      var a = ListIdentifierDTO.fromJson(jsonDecode(e));
      return a.id == moviesList.id;
    });

    if (alreadyInList) return;

    var value = jsonEncode(moviesList.toJson());

    list.add(value);

    _saveChanges(list); */
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
