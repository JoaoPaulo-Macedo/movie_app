import 'package:movie_app/app/domain/entities/list_identifier_entity.dart';
import 'package:movie_app/app/domain/repositories/lists_repository.dart';

abstract class GetAllListsUseCase {
  call();
}

class GetAllListsUseCaseImp extends GetAllListsUseCase {
  GetAllListsUseCaseImp(this._repository);

  final ListsRepository _repository;

  @override
  Future<List<ListIdentifierEntity>> call() async {
    int amount = 10;
    
    return await _repository(amount);
  }
}
