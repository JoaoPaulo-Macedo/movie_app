import 'package:movie_app/app/data/datasource/lists_datasource.dart';
import 'package:movie_app/app/domain/entities/list_identifier_entity.dart';
import 'package:movie_app/app/domain/repositories/lists_repository.dart';

class ListsRepositoryImp extends ListsRepository {
  ListsRepositoryImp(this._listsDataSource);

  final ListsDataSource _listsDataSource;

  @override
  Future<List<ListIdentifierEntity>> call(int amount) async {
    return await _listsDataSource(amount);
  }
}
