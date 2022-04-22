// import 'dart:convert';

// import 'package:movie_app/app/data/datasource/favorite_movies_local_datasource.dart';
// import 'package:movie_app/app/data/dtos/favorite_movies_list_dto.dart';
// import 'package:movie_app/app/domain/entities/favorite_movies_list_entity.dart';
// import 'package:movie_app/core/domain/services/local_data_service.dart';

// class FavoriteMoviesLocalDataSourceImp extends FavoriteMoviesLocalDataSource {
//   FavoriteMoviesLocalDataSourceImp(this._service);

//   final LocalDataService _service;
//   final String _key = 'favorites';

//   @override
//   Future<FavoriteMoviesListEntity?> getFavorites(int page) async {
//     try {
//       String? jsonString = await _service.getString(
//         _key,
//         description:
//             'Get a favorite list corresponding to current pagination from cache',
//       );

//       if (jsonString == null) return null;

//       var list = FavoriteMoviesListDTO.fromJson(jsonDecode(jsonString));

//       if (list.page != page) return null;

//       return list;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<bool> updateList(FavoriteMoviesListEntity list) async {
//     return await _service.setString(
//       _key,
//       jsonEncode(list.toJson()),
//       description: 'Update list in cache',
//     );
//   }
// }
