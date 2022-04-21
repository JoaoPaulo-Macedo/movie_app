import 'package:movie_app/app/data/datasource/account_details_datasource.dart';
import 'package:movie_app/app/domain/entities/account_details_entity.dart';
import 'package:movie_app/app/domain/repositories/account_details_repository.dart';
import 'package:movie_app/app/external/datasource/local/account_details_local_datasource_imp.dart';

class AccountDetailsRepositoryImp extends AccountDetailsRepository {
  AccountDetailsRepositoryImp(this._remoteDataSource, this._localDataSource);

  final AccountDetailsDataSource _remoteDataSource;
  final AccountDetailsLocalDataSource _localDataSource;

  static AccountDetailsEntity? accountDetailsCache;

  @override
  Future<AccountDetailsEntity?> call() async {
    try {
      if (accountDetailsCache != null) return accountDetailsCache;

      accountDetailsCache = await _localDataSource.getDetails();
      if (accountDetailsCache != null) return accountDetailsCache;

      accountDetailsCache = await _remoteDataSource();
      if (accountDetailsCache != null) _saveAccountDetails(accountDetailsCache!);

      return accountDetailsCache;
    } catch (e) {
      rethrow;
    }
  }

  void _saveAccountDetails(AccountDetailsEntity accountDetails) {
    _localDataSource.saveDetails(accountDetails);
  }
}
