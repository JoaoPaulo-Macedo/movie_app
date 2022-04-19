import 'package:movie_app/app/domain/repositories/movies_list_repository.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/usecases/get_movies_list_usecase.dart';

class GetMoviesListUseCaseImp implements GetMoviesListUseCase {
  GetMoviesListUseCaseImp(this._repository);

  final MoviesListRepository _repository;

  @override
  Future<MoviesListEntity?> call({int list = 1, int page = 1}) async {
    return await _repository(list, page);
  }
}
