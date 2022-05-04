import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/repositories/list_repository.dart';

abstract class GetListUseCase {
  Future<ListEntity?> call({int list, int page});
}

class GetListUseCaseImp implements GetListUseCase {
  GetListUseCaseImp(this._repository);

  final ListRepository _repository;

  @override
  Future<ListEntity?> call({int list = 1, int page = 1}) async {
    return await _repository.getList(list, page);
  }
}