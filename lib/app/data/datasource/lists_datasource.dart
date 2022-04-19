import 'package:movie_app/app/domain/entities/list_identifier_entity.dart';

abstract class ListsDataSource {
  Future<List<ListIdentifierEntity>> call(int amount);
}
