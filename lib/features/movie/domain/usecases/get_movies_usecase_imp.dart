import 'package:movie_app/features/movie/domain/entities/movies_list.dart';
import 'package:movie_app/features/movie/domain/repositories/movies_repository.dart';
import 'package:movie_app/features/movie/domain/usecases/get_movies_usecase.dart';

class GetMoviesUseCaseImp implements GetMoviesUseCase {
  GetMoviesUseCaseImp(this._repository);

  final MoviesRepository _repository;

  @override
  Future<MoviesListEntity?> call() async {
    return await _repository();
  }
}

//domain don't know other layers, imports are only from domain.
//Also, domain don't know how to mount data, like json and to json, that's why
//entities hasn't json treatments.