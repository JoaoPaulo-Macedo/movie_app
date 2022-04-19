import 'package:movie_app/domain/entities/list_identifier_entity.dart';

abstract class ListsRepository {
  Future<List<ListIdentifierEntity>> call(int amount);
}