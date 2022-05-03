// import 'dart:convert';
// import 'package:movie_app/app/data/datasource/lists_cache_datasource.dart';
// import 'package:movie_app/app/data/dtos/list_identifier_dto.dart';
// import 'package:movie_app/app/domain/entities/list_identifier_entity.dart';
// import 'package:movie_app/core/domain/services/local_data_service.dart';

// class ListsCacheDataSourceImp extends ListsCacheDataSource {
//   ListsCacheDataSourceImp(this._service);

//   final LocalDataService _service;

//   final _key = 'lists';

//   @override
//   Future<List<ListIdentifierEntity>> getListsFromCache() async {
//     // List values = jsonDecode(await rootBundle.loadString('assets/lists.json'));
//     List<String>? stringList = await _service.getStringList(
//       _key,
//       description: 'Get all lists from cache',
//     );
//     List<ListIdentifierEntity> lists = [];

//     if (stringList != null) {
//       for (var e in stringList) {
//         lists.add(ListIdentifierDTO.fromJson(jsonDecode(e)));
//       }
//     }

//     return lists;
//   }

//   @override
//   Future<bool> saveListsToCache(List<ListIdentifierEntity> lists) async {
//     List<String> stringList = [];

//     for (var e in lists) {
//       stringList.add(jsonEncode(e.toJson()));
//     }

//     return await _service.setStringList(
//       _key,
//       stringList,
//       description: 'Set all lists in cache',
//     );
//   }
// }
