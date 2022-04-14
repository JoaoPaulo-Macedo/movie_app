import 'package:movie_app/domain/repositories/movies_repository.dart';
import 'package:movie_app/domain/usecases/get_movies_usecase.dart';
import 'package:movie_app/domain/entities/movies_list.dart';

class GetMoviesUseCaseImp implements GetMoviesUseCase {
  GetMoviesUseCaseImp(this._repository);

  final MoviesRepository _repository;

  @override
  Future<MoviesListEntity?> call() async {
    return await _repository();
  }
}