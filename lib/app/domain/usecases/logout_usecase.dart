import 'package:movie_app/app/domain/repositories/auth_repository.dart';

abstract class LogoutUsecase {
  call();
}

class LogoutUsecaseImp extends LogoutUsecase {
  LogoutUsecaseImp(this._repository);

  final AuthenticationRepository _repository;
  
  @override
  call() async {
    await _repository.logoutUser();
  }
}
