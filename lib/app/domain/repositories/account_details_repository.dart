import 'package:movie_app/app/domain/entities/account_details_entity.dart';

abstract class AccountDetailsRepository {
  Future<AccountDetailsEntity?> get();
}
