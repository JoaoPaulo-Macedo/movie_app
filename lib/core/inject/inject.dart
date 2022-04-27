import 'package:get_it/get_it.dart';
import 'package:movie_app/app/data/datasource/account_details_datasource.dart';
import 'package:movie_app/app/data/datasource/auth_local_datasource.dart';
import 'package:movie_app/app/data/datasource/auth_remote_datasource.dart';
import 'package:movie_app/app/data/datasource/favorite_movies_local_datasource.dart';
import 'package:movie_app/app/data/datasource/favorite_movies_remote_datasource.dart';
import 'package:movie_app/app/data/datasource/lists_cache_datasource.dart';
import 'package:movie_app/app/data/repositories/account_details_repository_imp.dart';
import 'package:movie_app/app/data/repositories/auth_repository_imp.dart';
import 'package:movie_app/app/data/repositories/favorite_movies_repository_imp.dart';
import 'package:movie_app/app/domain/repositories/account_details_repository.dart';
import 'package:movie_app/app/domain/repositories/auth_repository.dart';
import 'package:movie_app/app/domain/repositories/favorite_movies_repository.dart';
import 'package:movie_app/app/domain/usecases/get_account_details_usecase.dart';
import 'package:movie_app/app/domain/usecases/favorite_movies_list_usecase.dart';
import 'package:movie_app/app/domain/usecases/login_usecase.dart';
import 'package:movie_app/app/external/datasource/local/account_details_local_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/local/favorite_movies_local_darasource_imp.dart';
import 'package:movie_app/app/external/datasource/local/session_id_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/local/lists_cache_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/remote/account_details_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/remote/auth_remote_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/remote/favorite_movies_remote_datasource_imp.dart';
import 'package:movie_app/app/presentation/pages/drawer/app_drawer_controller.dart';
import 'package:movie_app/app/presentation/pages/favorites/favorites_controller.dart';
import 'package:movie_app/app/presentation/pages/login/login_controller.dart';
import 'package:movie_app/core/data/services/dio_service_imp.dart';
import 'package:movie_app/core/data/services/preferences_service_imp.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/app/data/datasource/movies_list_datasource.dart';
import 'package:movie_app/app/data/datasource/movies_list_local_datasource.dart';
import 'package:movie_app/app/data/repositories/lists_repository_imp.dart';
import 'package:movie_app/app/data/repositories/movies_list_repository_imp.dart';
import 'package:movie_app/app/domain/repositories/lists_repository.dart';
import 'package:movie_app/app/domain/repositories/movies_list_repository.dart';
import 'package:movie_app/app/domain/usecases/get_all_lists_usecase.dart';
import 'package:movie_app/app/domain/usecases/get_movies_list_usecase.dart';
import 'package:movie_app/app/external/datasource/local/movies_list_local_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/remote/movies_list_datasource_imp.dart';
import 'package:movie_app/app/presentation/pages/home/home_controller.dart';
import 'package:movie_app/core/domain/services/local_data_service.dart';

class Inject {
  static final GetIt _getIt = GetIt.instance;

  static reset() => _getIt.reset().then((_) => init());

  static init() {
    // Services
    _getIt.registerLazySingleton<HttpService>(() => DioHttpServiceImp());
    _getIt.registerLazySingleton<LocalDataService>(
      () => PreferencesServiceImp(),
    );

    // Remote DataSources
    _getIt.registerLazySingleton<MoviesListDataSource>(
      () => MoviesListDataSourceImp(_getIt()),
    );
    _getIt.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImp(_getIt()),
    );
    _getIt.registerLazySingleton<AccountDetailsDataSource>(
      () => AccountDetailsDataSourceImp(_getIt(), _getIt()),
    );
    _getIt.registerLazySingleton<FavoriteMoviesRemoteDataSource>(
      () => FavoriteMoviesRemoteDataSourceImp(_getIt(), _getIt(), _getIt()),
    );

    // Local DataSources
    _getIt.registerLazySingleton<MoviesListLocalDataSourceDecorator>(
      () => MoviesListLocalDataSourceDecoratorImp(_getIt(), _getIt()),
    );
    _getIt.registerLazySingleton<ListsCacheDataSource>(
      () => ListsCacheDataSourceImp(_getIt()),
    );
    _getIt.registerLazySingleton<SessionIdDataSource>(
      () => SessionIdDataSourceImp(_getIt()),
    );
    _getIt.registerLazySingleton<AccountDetailsLocalDataSource>(
      () => AccountDetailsLocalDataSource(_getIt()),
    );
    // _getIt.registerLazySingleton<FavoriteMoviesLocalDataSource>(
    //   () => FavoriteMoviesLocalDataSourceImp(_getIt()),
    // );

    // Repositories
    _getIt.registerLazySingleton<MoviesListRepository>(
      () => MoviesListRepositoryImp(_getIt()),
    );
    _getIt.registerLazySingleton<ListsRepository>(
      () => ListsRepositoryImp(_getIt(), _getIt()),
    );
    _getIt.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImp(_getIt(), _getIt()),
    );
    _getIt.registerLazySingleton<AccountDetailsRepository>(
      () => AccountDetailsRepositoryImp(_getIt(), _getIt()),
    );
    _getIt.registerLazySingleton<FavoriteMoviesRepository>(
      () => FavoriteMoviesRepositoryImp(_getIt()/* , _getIt() */),
    );

    // UseCases
    _getIt.registerLazySingleton<GetMoviesListUseCase>(
      () => GetMoviesListUseCaseImp(_getIt()),
    );
    _getIt.registerLazySingleton<GetAllListsUseCase>(
      () => GetAllListsUseCaseImp(_getIt()),
    );
    _getIt.registerLazySingleton<LoginUseCase>(
      () => LoginUserUseCaseImp(_getIt(), _getIt()),
    );
    _getIt.registerLazySingleton<GetAccountDetailsUseCase>(
      () => GetAccountDetailsUseCaseImp(_getIt()),
    );
    _getIt.registerLazySingleton<FavoriteMoviesListUseCase>(
      () => FavoriteMoviesListUseCaseImp(_getIt()),
    );

    // Controllers
    _getIt.registerLazySingleton<AppDrawerController>(
      () => AppDrawerController(_getIt(), _getIt()),
    );
  }
}
