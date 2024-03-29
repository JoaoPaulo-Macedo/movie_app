import 'package:movie_app/app/domain/entities/login_params_entity.dart';
import 'package:movie_app/app/domain/repositories/account_details_repository.dart';
import 'package:movie_app/app/domain/repositories/authentication_repository.dart';

abstract class LoginUseCase {
  Future call(String username, String password);
}

class LoginUseCaseImp extends LoginUseCase {
  LoginUseCaseImp(this._repository, this._accountDetailsRepository);

  final AuthenticationRepository _repository;
  final AccountDetailsRepository _accountDetailsRepository;

  @override
  call(String username, String password) async {
    await _repository.loginUser(
      LoginParamsEntity(username: username, password: password),
    );

    await _accountDetailsRepository.get();
  }
}
