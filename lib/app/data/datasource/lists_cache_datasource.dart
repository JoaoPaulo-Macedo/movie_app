import 'package:movie_app/app/domain/entities/list_identifier_entity.dart';

abstract class ListsCacheDataSource {
  List<ListIdentifierEntity> getListsFromCache();
  Future<bool> saveListsToCache(List<ListIdentifierEntity> lists);
}
