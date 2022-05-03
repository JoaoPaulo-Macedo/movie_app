import 'package:movie_app/app/domain/entities/account_details_entity.dart';

abstract class AccountDetailsRemoteDataSource {
  Future<AccountDetailsEntity?> call(String sessionId);
}
