import 'package:movie_app/app/domain/entities/account_details_entity.dart';

abstract class AccountDetailsDataSource {
  Future<AccountDetailsEntity?> call(String sessionId);
}
