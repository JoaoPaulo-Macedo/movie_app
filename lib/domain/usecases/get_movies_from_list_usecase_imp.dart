import 'package:movie_app/domain/repositories/movies_list_repository.dart';
import 'package:movie_app/domain/usecases/get_movies_from_list_usecase.dart';
import 'package:movie_app/domain/entities/movies_list_entity.dart';

class GetMoviesFromListUseCaseImp implements GetMoviesFromListUseCase {
  GetMoviesFromListUseCaseImp(this._repository);

  final MoviesListRepository _repository;

  @override
  Future<MoviesListEntity?> call({int list = 1, int page = 1}) async {
    return await _repository(list, page);
  }
}