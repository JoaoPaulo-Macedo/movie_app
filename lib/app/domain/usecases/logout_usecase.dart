import 'package:movie_app/app/domain/repositories/authentication_repository.dart';

abstract class LogoutUseCase {
  call();
}

class LogoutUseCaseImp extends LogoutUseCase {
  LogoutUseCaseImp(this._repository);

  final AuthenticationRepository _repository;
  
  @override
  call() async {
    await _repository.logoutUser();
  }
}
