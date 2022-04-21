import 'package:get_it/get_it.dart';
import 'package:movie_app/app/data/datasource/auth_local_datasource.dart';
import 'package:movie_app/app/data/datasource/auth_remote_datasource.dart';
import 'package:movie_app/app/data/datasource/lists_local_datasource.dart';
import 'package:movie_app/app/data/repositories/auth_repository_imp.dart';
import 'package:movie_app/app/domain/repositories/auth_repository.dart';
import 'package:movie_app/app/domain/usecases/login_usecase.dart';
import 'package:movie_app/app/external/datasource/local/auth_local_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/local/lists_local_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/remote/auth_remote_datasource_imp.dart';
import 'package:movie_app/app/presentation/pages/login/login_controller.dart';
import 'package:movie_app/core/data/services/dio_service_imp.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/app/data/datasource/lists_remote_datasource.dart';
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
import 'package:movie_app/app/external/datasource/remote/lists_remote_datasource_imp.dart';
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
    getIt.registerLazySingleton<ListsLocalDataSource>(
      () => ListsLocalDataSourceImp(getIt()),
    );
    getIt.registerLazySingleton<ListsRemoteDataSource>(
      () => ListsRemoteDataSourceImp(getIt()),
    );
    getIt.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImp(getIt()),
    );
    getIt.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImp(),
    );

    // Repositories
    getIt.registerLazySingleton<MoviesListRepository>(
      () => MoviesListRepositoryImp(getIt()),
    );
    getIt.registerLazySingleton<ListsRepository>(
      () => ListsRepositoryImp(getIt()),
    );
    getIt.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImp(getIt(), getIt()),
    );

    // UseCases
    getIt.registerLazySingleton<GetMoviesListUseCase>(
      () => GetMoviesListUseCaseImp(getIt()),
    );
    getIt.registerLazySingleton<GetAllListsUseCase>(
      () => GetAllListsUseCaseImp(getIt()),
    );
    getIt.registerLazySingleton<LoginUseCase>(
      () => LoginUserUseCaseImp(getIt()),
    );

    // Controllers
    getIt.registerLazySingleton<HomeController>(
      () => HomeController(getIt()),
    );
    getIt.registerLazySingleton<LoginController>(
      () => LoginController(getIt()),
    );
  }
}
