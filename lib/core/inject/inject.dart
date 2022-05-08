import 'package:get_it/get_it.dart';
import 'package:movie_app/app/data/datasource/local/account_details_local_datasource.dart';
import 'package:movie_app/app/data/datasource/local/assets_datasource.dart';
import 'package:movie_app/app/data/datasource/remote/account_details_remote_datasource.dart';
import 'package:movie_app/app/data/datasource/local/session_id_datasource.dart';
import 'package:movie_app/app/data/datasource/remote/authentication_remote_datasource.dart';
import 'package:movie_app/app/data/datasource/remote/favorites_datasource.dart';
import 'package:movie_app/app/data/repositories/account_details_repository_imp.dart';
import 'package:movie_app/app/data/repositories/authentication_repository_imp.dart';
import 'package:movie_app/app/data/repositories/favorite_repository_imp.dart';
import 'package:movie_app/app/domain/repositories/account_details_repository.dart';
import 'package:movie_app/app/domain/repositories/authentication_repository.dart';
import 'package:movie_app/app/domain/repositories/favorites_repository.dart';
import 'package:movie_app/app/domain/usecases/get_account_details_usecase.dart';
import 'package:movie_app/app/domain/usecases/get_favorites_usecase.dart';
import 'package:movie_app/app/domain/usecases/login_usecase.dart';
import 'package:movie_app/app/domain/usecases/logout_usecase.dart';
import 'package:movie_app/app/external/datasource/local/account_details_local_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/local/assets_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/local/session_id_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/remote/account_details_remote_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/remote/authentication_remote_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/remote/favorites_datasource_imp.dart';
import 'package:movie_app/app/presentation/pages/drawer/app_drawer_controller.dart';
import 'package:movie_app/core/data/services/dio_service_imp.dart';
import 'package:movie_app/core/data/services/preferences_service_imp.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/app/data/datasource/remote/movies_list_datasource.dart';
import 'package:movie_app/app/data/datasource/local/movies_list_local_datasource.dart';
import 'package:movie_app/app/data/repositories/list_repository_imp.dart';
import 'package:movie_app/app/domain/repositories/list_repository.dart';
import 'package:movie_app/app/domain/usecases/get_all_lists_usecase.dart';
import 'package:movie_app/app/domain/usecases/get_list_usecase.dart';
import 'package:movie_app/app/external/datasource/local/movies_list_local_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/remote/movies_list_datasource_imp.dart';
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
    _getIt.registerLazySingleton<AccountDetailsRemoteDataSource>(
      () => AccountDetailsRemoteDataSourceImp(_getIt()),
    );
    _getIt.registerLazySingleton<FavoritesDataSource>(
      () => FavoritesDataSourceImp(_getIt()),
    );

    // Local DataSources
    _getIt.registerLazySingleton<MoviesListLocalDataSourceDecorator>(
      () => MoviesListLocalDataSourceDecoratorImp(_getIt(), _getIt()),
    );
    _getIt.registerLazySingleton<SessionIdDataSource>(
      () => SessionIdDataSourceImp(_getIt()),
    );
    _getIt.registerLazySingleton<AccountDetailsLocalDataSource>(
      () => AccountDetailsLocalDataSourceImp(_getIt()),
    );
    _getIt.registerLazySingleton<AssetsDataSource>(
      () => AssetsDataSourceImp(),
    );

    // Repositories
    _getIt.registerLazySingleton<ListRepository>(
      () => ListRepositoryImp(_getIt(), _getIt()),
    );
    _getIt.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImp(_getIt(), _getIt()),
    );
    _getIt.registerLazySingleton<AccountDetailsRepository>(
      () => AccountDetailsRepositoryImp(_getIt(), _getIt(), _getIt()),
    );
    _getIt.registerLazySingleton<FavoritesRepository>(
      () => FavoritesRepositoryImp(_getIt(), _getIt(), _getIt()),
    );

    // UseCases
    _getIt.registerLazySingleton<LoginUseCase>(
      () => LoginUseCaseImp(_getIt(), _getIt()),
    );
    _getIt.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCaseImp(_getIt()),
    );
    _getIt.registerLazySingleton<GetAllListsUseCase>(
      () => GetAllListsUseCaseImp(_getIt()),
    );
    _getIt.registerLazySingleton<GetListUseCase>(
      () => GetListUseCaseImp(_getIt()),
    );
    _getIt.registerLazySingleton<GetAccountDetailsUseCase>(
      () => GetAccountDetailsUseCaseImp(_getIt()),
    );
    _getIt.registerLazySingleton<GetFavoritesUseCase>(
      () => GetFavoritesUseCaseImp(_getIt()),
    );

    // Controllers
    _getIt.registerLazySingleton<AppDrawerController>(
      () => AppDrawerController(_getIt(), _getIt()),
    );
  }
}
