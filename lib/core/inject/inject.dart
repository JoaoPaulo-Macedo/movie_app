import 'package:get_it/get_it.dart';
import 'package:movie_app/app/data/datasource/account_details_datasource.dart';
import 'package:movie_app/app/data/datasource/auth_local_datasource.dart';
import 'package:movie_app/app/data/datasource/auth_remote_datasource.dart';
import 'package:movie_app/app/data/datasource/favorite_movies_datasource.dart';
import 'package:movie_app/app/data/datasource/lists_cache_datasource.dart';
import 'package:movie_app/app/data/repositories/account_details_repository_imp.dart';
import 'package:movie_app/app/data/repositories/auth_repository_imp.dart';
import 'package:movie_app/app/data/repositories/favorite_movies_repository_imp.dart';
import 'package:movie_app/app/domain/repositories/account_details_repository.dart';
import 'package:movie_app/app/domain/repositories/auth_repository.dart';
import 'package:movie_app/app/domain/repositories/favorite_movies_repository.dart';
import 'package:movie_app/app/domain/usecases/get_account_details_usecase.dart';
import 'package:movie_app/app/domain/usecases/get_favorite_movies_list_usecase.dart';
import 'package:movie_app/app/domain/usecases/login_usecase.dart';
import 'package:movie_app/app/external/datasource/local/account_details_local_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/local/auth_local_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/local/lists_cache_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/remote/account_details_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/remote/auth_remote_datasource_imp.dart';
import 'package:movie_app/app/presentation/pages/drawer/app_drawer_controller.dart';
import 'package:movie_app/app/presentation/pages/favorites/favorites_controller.dart';
import 'package:movie_app/app/presentation/pages/login/login_controller.dart';
import 'package:movie_app/core/data/services/dio_service_imp.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/app/data/datasource/movies_list_datasource.dart';
import 'package:movie_app/app/data/datasource/movies_list_local_datasource.dart';
import 'package:movie_app/app/data/repositories/lists_repository_imp.dart';
import 'package:movie_app/app/data/repositories/movies_list_repository_imp.dart';
import 'package:movie_app/app/domain/repositories/lists_repository.dart';
import 'package:movie_app/app/domain/repositories/movies_list_repository.dart';
import 'package:movie_app/app/domain/usecases/get_lists_usecase.dart';
import 'package:movie_app/app/domain/usecases/get_movies_list_usecase.dart';
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
    getIt.registerLazySingleton<ListsCacheDataSource>(
      () => ListsCacheDataSourceImp(),
    );
    getIt.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImp(getIt()),
    );
    getIt.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImp(),
    );
    getIt.registerLazySingleton<AccountDetailsLocalDataSource>(
      () => AccountDetailsLocalDataSource(),
    );
    getIt.registerLazySingleton<AccountDetailsDataSource>(
      () => AccountDetailsDataSourceImp(getIt(), getIt()),
    );
    getIt.registerLazySingleton<FavoriteMoviesDataSource>(
      () => FavoriteMoviesDataSourceImp(getIt(), getIt(), getIt()),
    );

    // Repositories
    getIt.registerLazySingleton<MoviesListRepository>(
      () => MoviesListRepositoryImp(getIt()),
    );
    getIt.registerLazySingleton<ListsRepository>(
      () => ListsRepositoryImp(getIt(), getIt()),
    );
    getIt.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImp(getIt(), getIt()),
    );
    getIt.registerLazySingleton<AccountDetailsRepository>(
      () => AccountDetailsRepositoryImp(getIt(), getIt()),
    );
    getIt.registerLazySingleton<FavoriteMoviesRepository>(
      () => FavoriteMoviesRepositoryImp(getIt()),
    );

    // UseCases
    getIt.registerLazySingleton<GetMoviesListUseCase>(
      () => GetMoviesListUseCaseImp(getIt()),
    );
    getIt.registerLazySingleton<GetAllListsUseCase>(
      () => GetAllListsUseCaseImp(getIt()),
    );
    getIt.registerLazySingleton<LoginUseCase>(
      () => LoginUserUseCaseImp(getIt(), getIt()),
    );
    getIt.registerLazySingleton<GetAccountDetailsUseCase>(
      () => GetAccountDetailsUseCaseImp(getIt()),
    );
    getIt.registerLazySingleton<GetFavoriteMoviesListUseCase>(
      () => GetFavoriteMoviesListUseCaseImp(getIt()),
    );

    // Controllers
    getIt.registerLazySingleton<HomeController>(
      () => HomeController(getIt()),
    );
    getIt.registerLazySingleton<LoginController>(
      () => LoginController(getIt()),
    );
    getIt.registerLazySingleton<AppDrawerController>(
      () => AppDrawerController(getIt(), getIt()),
    );
    getIt.registerLazySingleton<FavoritesController>(
      () => FavoritesController(getIt()),
    );
  }
}
