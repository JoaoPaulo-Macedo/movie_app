import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/app/data/datasource/account_details_datasource.dart';
import 'package:movie_app/app/data/dtos/account_details_dto.dart';
import 'package:movie_app/app/domain/entities/account_details_entity.dart';
import 'package:movie_app/app/domain/repositories/account_details_repository.dart';
import 'package:movie_app/app/external/datasource/local/account_details_local_datasource_imp.dart';
import 'package:movie_app/core/utils/debug.dart';
import 'package:movie_app/core/utils/failure.dart';

class AccountDetailsRepositoryImp extends AccountDetailsRepository {
  AccountDetailsRepositoryImp(this._remoteDataSource, this._localDataSource);

  final AccountDetailsDataSource _remoteDataSource;
  final AccountDetailsLocalDataSource _localDataSource;

  static AccountDetailsEntity? accountDetailsCache;

  @override
  Future<AccountDetailsEntity?> call() async {
    try {
      if (accountDetailsCache != null) return accountDetailsCache;

      //TODO: Remove Mocked data
      var json = jsonDecode(
        await rootBundle.loadString('assets/account_details.json'),
      );
      Debug.log(
        'json: ${json.toString()}',
        description: 'Account details from assets to avoid API overload',
        debugSource: DebugSource.mock,
      );
      accountDetailsCache = AccountDetailsDTO.fromJson(json);
      return accountDetailsCache;

      /* accountDetailsCache = await _localDataSource.getDetails();
      if (accountDetailsCache != null) return accountDetailsCache;

      accountDetailsCache = await _remoteDataSource();
      if (accountDetailsCache != null) _saveAccountDetails(accountDetailsCache!);

      return accountDetailsCache; */
    } catch (e) {
      throw Failure.unexpected(e);
    }
  }

  void _saveAccountDetails(AccountDetailsEntity accountDetails) {
    _localDataSource.saveDetails(accountDetails);
  }
}
