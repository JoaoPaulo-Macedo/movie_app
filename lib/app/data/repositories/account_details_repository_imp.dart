import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:movie_app/app/data/datasource/local/account_details_local_datasource.dart';
import 'package:movie_app/app/data/datasource/local/session_id_datasource.dart';
import 'package:movie_app/app/data/datasource/remote/account_details_remote_datasource.dart';
import 'package:movie_app/app/data/dtos/account_details_dto.dart';
import 'package:movie_app/app/domain/entities/account_details_entity.dart';
import 'package:movie_app/app/domain/repositories/account_details_repository.dart';
import 'package:movie_app/core/utils/app_configs.dart';
import 'package:movie_app/core/utils/debug.dart';
import 'package:movie_app/core/utils/failure.dart';

class AccountDetailsRepositoryImp extends AccountDetailsRepository {
  AccountDetailsRepositoryImp(
    this._remoteDataSource,
    this._localDataSource,
    this._sessionIdDataSource,
  );

  final AccountDetailsRemoteDataSource _remoteDataSource;
  final AccountDetailsLocalDataSource _localDataSource;
  final SessionIdDataSource _sessionIdDataSource;

  String? sessionId;
  AccountDetailsEntity? accountDetails;

  @override
  Future<AccountDetailsEntity?> get() async {
    try {
      if (accountDetails != null) return accountDetails;

      if (AppConfigs.i!.environment == AppEnvironment.dev) return await _getFromAssets();

      accountDetails = await _localDataSource.getDetails();
      if (accountDetails != null) return accountDetails;

      sessionId ??= await _getSessionId();

      accountDetails = await _remoteDataSource(sessionId!);
      if (accountDetails != null) save(accountDetails!);

      return accountDetails;
    } catch (e) {
      throw Failure.unexpected(e);
    }
  }

  void save(AccountDetailsEntity accountDetails) {
    _localDataSource.saveDetails(accountDetails);
  }

  Future<String> _getSessionId() async {
    String? sessionId = await _sessionIdDataSource.getSessionId();

    return sessionId!;
  }

  Future<AccountDetailsEntity?> _getFromAssets() async {
    var json = jsonDecode(await rootBundle.loadString('assets/account_details.json'));

    Debug.log('json: ${json.toString()}');

    accountDetails = AccountDetailsDTO.fromJson(json);
    return accountDetails;
  }
}
