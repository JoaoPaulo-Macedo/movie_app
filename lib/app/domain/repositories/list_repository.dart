import 'package:movie_app/app/domain/entities/movies_list_entity.dart';

abstract class ListRepository {
  Future<List<ListEntity>> getAllLists();
  Future<ListEntity?> getList(int listId, int page);
}
