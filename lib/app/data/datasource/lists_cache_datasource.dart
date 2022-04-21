import 'package:movie_app/app/domain/entities/list_identifier_entity.dart';

abstract class ListsCacheDataSource {
  Future<List<ListIdentifierEntity>> getListsFromCache();
  void saveListsToCache(List<ListIdentifierEntity> lists);
}
