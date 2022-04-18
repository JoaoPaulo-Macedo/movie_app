import 'package:movie_app/data/repositories/lists_repository_imp.dart';
import 'package:movie_app/domain/entities/list_identifier_entity.dart';
import 'package:movie_app/domain/repositories/lists_repository.dart';
import 'package:movie_app/domain/usecases/get_all_lists_usecase.dart';

class GetAllListsUseCaseImp extends GetAllListsUseCase {
  GetAllListsUseCaseImp(this._listsRepository);

  final ListsRepository _listsRepository;

  @override
  Future<List<ListIdentifierEntity>> call() async {
    return await _listsRepository();
  }
}
