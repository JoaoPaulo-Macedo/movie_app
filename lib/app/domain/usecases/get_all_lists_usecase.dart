import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/repositories/list_repository.dart';

abstract class GetAllListsUseCase {
  Future<List<ListEntity>> call();
}

class GetAllListsUseCaseImp extends GetAllListsUseCase {
  GetAllListsUseCaseImp(this._repository);

  final ListRepository _repository;

  @override
  Future<List<ListEntity>> call() async {
    return await _repository.getAllLists();
  }
}
