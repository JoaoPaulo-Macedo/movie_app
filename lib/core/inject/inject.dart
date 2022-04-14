import 'package:get_it/get_it.dart';
import 'package:movie_app/core/data/services/dio_service_imp.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/data/datasource/local/movies_list_local_datasource.dart';
import 'package:movie_app/data/datasource/local/movies_list_local_datasource_imp.dart';
import 'package:movie_app/data/datasource/movies_list_datasource.dart';
import 'package:movie_app/data/datasource/remote/movies_list_datasource_imp.dart';
import 'package:movie_app/data/repositories/movies_list_repository_imp.dart';
import 'package:movie_app/domain/repositories/movies_list_repository.dart';
import 'package:movie_app/domain/usecases/get_movies_list_usecase.dart';
import 'package:movie_app/domain/usecases/get_movies_list_usecase_imp.dart';
import 'package:movie_app/presentation/controllers/home_controller.dart';

class Inject {
  static init() {
    var getIt = GetIt.instance;

    getIt.registerLazySingleton<HttpService>(() => DioHttpServiceImp());

    getIt.registerLazySingleton<MoviesListDataSource>(
      () => MoviesListDatasourceImp(getIt()),
    );
    getIt.registerLazySingleton<MoviesListLocalDataSourceDecorator>(
      () => MoviesListLocalDataSourceDecoratorImp(getIt()),
    );

    getIt.registerLazySingleton<MoviesListRepository>(
      () => MoviesListRepositoryImp(getIt()),
    );

    getIt.registerLazySingleton<GetMoviesListUseCase>(
      () => GetMoviesListUseCaseImp(getIt()),
    );

    getIt.registerLazySingleton<HomeController>(() => HomeController(getIt()));
  }
}
