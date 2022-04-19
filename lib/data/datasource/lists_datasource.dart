import 'package:movie_app/domain/entities/list_identifier_entity.dart';
import 'package:movie_app/domain/entities/movies_list_entity.dart';

abstract class ListsDataSource {
  Future<List<ListIdentifierEntity>> call(int amount);
}