import 'package:movie_app/domain/entities/list_identifier_entity.dart';

abstract class GetAllListsUseCase {
  Future<List<ListIdentifierEntity>> call();
}
