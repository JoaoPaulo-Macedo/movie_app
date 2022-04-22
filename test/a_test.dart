import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/app/data/repositories/account_details_repository_imp.dart';
import 'package:movie_app/app/data/repositories/auth_repository_imp.dart';
import 'package:movie_app/app/data/repositories/movies_list_repository_imp.dart';
import 'package:movie_app/app/domain/entities/account_details_entity.dart';
import 'package:movie_app/app/domain/entities/login_params_entity.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/usecases/get_account_details_usecase.dart';
import 'package:movie_app/app/domain/usecases/login_usecase.dart';
import 'package:movie_app/app/external/datasource/local/account_details_local_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/local/session_id_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/remote/account_details_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/remote/auth_remote_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/remote/movies_list_datasource_imp.dart';
import 'package:movie_app/core/data/services/dio_service_imp.dart';
import 'package:movie_app/core/data/services/preferences_service_imp.dart';

void main() {
  // test('Get a movies list from api', () async {
  //   var usecase = GetMoviesListUseCaseImp(
  //     MoviesListRepositoryImp(MoviesListDatasourceImp(DioHttpServiceImp())),
  //   );

  //   MoviesListEntity? list = await usecase(list: 1, page: 1);

  //   expect(list, isInstanceOf<MoviesListEntity>());
  // });

  // test('viagem', () async {
  //   var usecase = LoginUserUseCaseImp(
  //     AuthenticationRepositoryImp(
  //       AuthenticationRemoteDataSourceImp(
  //         DioHttpServiceImp(),
  //       ),
  //       AuthenticationLocalDataSourceImp(),
  //     ),
  //   );

  //   // var params = LoginParamsEntity(userName: 'macedo.722', password: 'ninaekiara');

  //   var a = await usecase('macedo.722', 'ninaekiara');

  //   expect('a', a);
  // });

  // test('description', () async {
  //   var usecase = GetAccountDetailsUseCaseImp(
  //     AccountDetailsRepositoryImp(
  //       AccountDetailsDataSourceImp(
  //         DioHttpServiceImp(),
  //         AuthenticationLocalDataSourceImp(),
  //       ),
  //       AccountDetailsLocalDataSource(),
  //     ),
  //   );

  //   expect(await usecase(), 'a');
  // });
}
