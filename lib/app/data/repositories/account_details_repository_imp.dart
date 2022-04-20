import 'package:movie_app/app/data/datasource/account_details_datasource.dart';
import 'package:movie_app/app/domain/entities/account_details_entity.dart';
import 'package:movie_app/app/domain/repositories/account_details_repository.dart';

class AccountDetailsRepositoryImp extends AccountDetailsRepository {
  AccountDetailsRepositoryImp(this._dataSource);

  final AccountDetailsDataSource _dataSource;

  @override
  Future<AccountDetailsEntity?> call() async {
    try {
      return await _dataSource();
    } catch (e) {
      rethrow;
    }
  }
}
