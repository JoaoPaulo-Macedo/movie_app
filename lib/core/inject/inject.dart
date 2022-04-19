import 'package:get_it/get_it.dart';
import 'package:movie_app/core/data/services/dio_service_imp.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/app/data/datasource/lists_datasource.dart';
import 'package:movie_app/app/data/datasource/movies_list_datasource.dart';
import 'package:movie_app/app/data/datasource/movies_list_local_datasource.dart';
import 'package:movie_app/app/data/repositories/lists_repository_imp.dart';
import 'package:movie_app/app/data/repositories/movies_list_repository_imp.dart';
import 'package:movie_app/app/domain/repositories/lists_repository.dart';
import 'package:movie_app/app/domain/repositories/movies_list_repository.dart';
import 'package:movie_app/app/domain/usecases/get_lists_usecase.dart';
import 'package:movie_app/app/domain/usecases/get_lists_usecase_imp.dart';
import 'package:movie_app/app/domain/usecases/get_movies_list_usecase.dart';
import 'package:movie_app/app/domain/usecases/get_movies_list_usecase_imp.dart';
import 'package:movie_app/app/external/datasource/local/lists_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/local/movies_list_local_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/remote/movies_list_datasource_imp.dart';
import 'package:movie_app/app/presentation/pages/home/home_controller.dart';

class Inject {
  static init() {
    var getIt = GetIt.instance;

    // Services
    getIt.registerLazySingleton<HttpService>(() => DioHttpServiceImp());

    // DataSources
    getIt.registerLazySingleton<MoviesListDataSource>(
      () => MoviesListDatasourceImp(getIt()),
    );
    getIt.registerLazySingleton<MoviesListLocalDataSourceDecorator>(
      () => MoviesListLocalDataSourceDecoratorImp(getIt()),
    );
    getIt.registerLazySingleton<ListsDataSource>(
      () => ListsDataSourceImp(getIt()),
    );

    // Repositories
    getIt.registerLazySingleton<MoviesListRepository>(
      () => MoviesListRepositoryImp(getIt()),
    );
    getIt.registerLazySingleton<ListsRepository>(
      () => ListsRepositoryImp(getIt()),
    );

    // UseCases
    getIt.registerLazySingleton<GetMoviesListUseCase>(
      () => GetMoviesListUseCaseImp(getIt()),
    );
    getIt.registerLazySingleton<GetAllListsUseCase>(
      () => GetAllListsUseCaseImp(getIt()),
    );

    // Controllers
    getIt.registerLazySingleton<HomeController>(
      () => HomeController(getIt()),
    );
  }
}
