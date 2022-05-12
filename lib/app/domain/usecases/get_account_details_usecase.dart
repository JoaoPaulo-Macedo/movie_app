import 'package:movie_app/app/domain/entities/account_details_entity.dart';
import 'package:movie_app/app/domain/repositories/account_details_repository.dart';

abstract class GetAccountDetailsUseCase {
  Future<AccountDetailsEntity?> call();
}

class GetAccountDetailsUseCaseImp extends GetAccountDetailsUseCase {
  GetAccountDetailsUseCaseImp(this._repository);

  final AccountDetailsRepository _repository;

  @override
  Future<AccountDetailsEntity?> call() async {
    return await _repository.get();
  }
}
