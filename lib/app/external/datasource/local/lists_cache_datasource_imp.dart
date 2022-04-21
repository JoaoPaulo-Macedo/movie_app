import 'dart:convert';
import 'package:movie_app/app/data/datasource/lists_cache_datasource.dart';
import 'package:movie_app/app/data/dtos/list_identifier_dto.dart';
import 'package:movie_app/app/domain/entities/list_identifier_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListsCacheDataSourceImp extends ListsCacheDataSource {
  ListsCacheDataSourceImp();

  final _key = 'lists';

  @override
  Future<List<ListIdentifierEntity>> getListsFromCache() async {
    // List values = jsonDecode(await rootBundle.loadString('assets/lists.json'));
    final prefs = await SharedPreferences.getInstance();
    List<String>? stringList = prefs.getStringList(_key);
    List<ListIdentifierEntity> lists = [];

    if (stringList != null) {
      for (var e in stringList) {
        lists.add(ListIdentifierDTO.fromJson(jsonDecode(e)));
      }
    }

    return lists;
  }

  @override
  void saveListsToCache(List<ListIdentifierEntity> lists) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> stringList = [];

    for (var e in lists) {
      stringList.add(jsonEncode(e.toJson()));
    }

    prefs.setStringList(_key, stringList);
  }
}
