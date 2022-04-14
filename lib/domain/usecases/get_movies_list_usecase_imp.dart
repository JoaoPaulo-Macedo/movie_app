import 'package:movie_app/domain/repositories/movies_list_repository.dart';
import 'package:movie_app/domain/usecases/get_movies_list_usecase.dart';
import 'package:movie_app/domain/entities/movies_list_entity.dart';

class GetMoviesListUseCaseImp implements GetMoviesListUseCase {
  GetMoviesListUseCaseImp(this._repository);

  final MoviesListRepository _repository;

  @override
  Future<MoviesListEntity?> call() async {
    return await _repository();
  }
}