import 'package:movie_app/app/domain/entities/list_identifier_entity.dart';
import 'package:movie_app/app/domain/repositories/lists_repository.dart';
import 'package:movie_app/app/domain/usecases/get_lists_usecase.dart';

class GetAllListsUseCaseImp extends GetAllListsUseCase {
  GetAllListsUseCaseImp(this._listsRepository);

  final ListsRepository _listsRepository;

  @override
  Future<List<ListIdentifierEntity>> call() async {
    int amount = 10;

    return await _listsRepository(amount);
  }
}
