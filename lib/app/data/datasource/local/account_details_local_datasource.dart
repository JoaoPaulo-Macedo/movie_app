import 'package:movie_app/app/domain/entities/account_details_entity.dart';

abstract class AccountDetailsLocalDataSource {
  Future saveDetails(AccountDetailsEntity details);
  Future<AccountDetailsEntity?> getDetails();
}