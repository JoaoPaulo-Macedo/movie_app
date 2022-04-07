import 'package:get_it/get_it.dart';
import 'package:movie_app/core/data/services/dio_service_imp.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/features/movie/data/datasource/local/movies_local_datasource.dart';
import 'package:movie_app/features/movie/data/datasource/local/movies_local_datasource_imp.dart';
import 'package:movie_app/features/movie/data/datasource/movies_datasource.dart';
import 'package:movie_app/features/movie/data/datasource/remote/movies_datasource_imp.dart';
import 'package:movie_app/features/movie/data/repositories/movies_repository_imp.dart';
import 'package:movie_app/features/movie/domain/repositories/movies_repository.dart';
import 'package:movie_app/features/movie/domain/usecases/get_movies_usecase.dart';
import 'package:movie_app/features/movie/domain/usecases/get_movies_usecase_imp.dart';
import 'package:movie_app/features/movie/presentation/controllers/home_controller.dart';

class Inject {
  static init() {
    var getIt = GetIt.instance;

    getIt.registerLazySingleton<HttpService>(() => DioHttpServiceImp());

    getIt.registerLazySingleton<MoviesDataSource>(
      () => MoviesDatasourceImp(getIt()),
    );
    getIt.registerLazySingleton<MoviesLocalDataSourceDecorator>(
      () => MovicesLocalDataSourceDecoratorImp(getIt()),
    );

    getIt.registerLazySingleton<MoviesRepository>(
      () => MoviesRepositoryImp(getIt()),
    );

    getIt.registerLazySingleton<GetMoviesUseCase>(
      () => GetMoviesUseCaseImp(getIt()),
    );

    getIt.registerLazySingleton<HomeController>(() => HomeController(getIt()));
  }
}
