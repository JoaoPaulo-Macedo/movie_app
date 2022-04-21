import 'package:movie_app/app/data/datasource/lists_cache_datasource.dart';
import 'package:movie_app/app/data/datasource/movies_list_datasource.dart';
import 'package:movie_app/app/data/dtos/list_identifier_dto.dart';
import 'package:movie_app/app/data/dtos/movies_list_dto.dart';
import 'package:movie_app/app/domain/entities/list_identifier_entity.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/repositories/lists_repository.dart';

class ListsRepositoryImp extends ListsRepository {
  ListsRepositoryImp(this._dataSource, this._listsCache);

  final MoviesListDataSource _dataSource;
  final ListsCacheDataSource _listsCache;

  @override
  Future<List<ListIdentifierEntity>> call(int amount) async {
    List<ListIdentifierEntity> listOfLists = await _listsCache.getListsFromCache();
    if (listOfLists.isNotEmpty) return listOfLists;

    for (int list = 1; list <= amount; list++) {
      MoviesListEntity? listEntity = await _dataSource(list, 1);

      if (listEntity != null) {
        var listIdentifier = ListIdentifierDTO.fromJson(listEntity.toJson());

        listOfLists.add(listIdentifier);
      }
    }

    saveToCache(listOfLists);
    return listOfLists;
  }

  saveToCache(List<ListIdentifierEntity> lists) {
    _listsCache.saveListsToCache(lists);
  }
}
