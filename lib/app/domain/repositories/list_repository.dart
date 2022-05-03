import 'package:movie_app/app/domain/entities/list_identifier_entity.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';

abstract class ListRepository {
  Future<List<ListEntity>> getManyLists(int amount);
  Future<ListEntity?> getList(int listId, int page);
}
