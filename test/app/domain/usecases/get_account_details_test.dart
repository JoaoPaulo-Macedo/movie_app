import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/app/data/repositories/account_details_repository_imp.dart';
import 'package:movie_app/app/domain/entities/account_details_entity.dart';
import 'package:movie_app/app/domain/usecases/get_account_details_usecase.dart';
import 'package:movie_app/app/external/datasource/local/account_details_local_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/local/session_id_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/remote/account_details_remote_datasource_imp.dart';
import 'package:movie_app/core/utils/api_utils.dart';
import 'package:movie_app/core/utils/app_configs.dart';

import '../../../mockito.mocks.dart';

void main() {
  AppConfigs(AppEnvironment.prod);
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Get account details', () async {
    var dioMock = MockDioHttpServiceImp();
    var prefsMock = MockPreferencesServiceImp();

    var usecase = GetAccountDetailsUseCaseImp(
      AccountDetailsRepositoryImp(
        AccountDetailsRemoteDataSourceImp(dioMock),
        AccountDetailsLocalDataSource(prefsMock),
        SessionIdDataSourceImp(prefsMock),
      ),
    );

    // Local
    when(
      prefsMock.getString('sessionId', description: anyNamed('description')),
    ).thenAnswer((_) async => 'session_id_from_prefs_mock');

    when(
      prefsMock.getString('account_details', description: anyNamed('description')),
    ).thenAnswer((_) async => await accountDetails());

    // Remote
    when(
      dioMock.get(
        API.requestAccountDetails('session_id_from_prefs_mock'),
        description: anyNamed('description'),
      ),
    ).thenAnswer((_) async {
      return Response(
        data: jsonDecode(await accountDetails()),
        requestOptions: RequestOptions(path: ''),
      );
    });

    AccountDetailsEntity? details = await usecase();

    expect(details!.id, 12270139);
  });
}

Future<String> accountDetails() async => await rootBundle.loadString('assets/account_details.json');
