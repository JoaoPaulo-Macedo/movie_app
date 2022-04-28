// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/account_details_entity.dart';
import 'package:movie_app/app/domain/usecases/get_account_details_usecase.dart';
import 'package:movie_app/app/domain/usecases/logout_usecase.dart';
import 'package:movie_app/core/utils/routes_name.dart';

part 'app_drawer_controller.g.dart';

class AppDrawerController = _AppDrawerController with _$AppDrawerController;

abstract class _AppDrawerController with Store {
  _AppDrawerController(this._logOutUseCase, this._accountDetailsUseCase) {
    _fetch();
  }

  final LogoutUsecase _logOutUseCase;
  final GetAccountDetailsUseCase _accountDetailsUseCase;

  @observable
  AccountDetailsEntity? accountDetails;
  @observable
  bool isLoading = false;
  String? currentPage;

  _fetch() async {
    accountDetails = await _accountDetailsUseCase();
  }

  @action
  checkCurrentPage(BuildContext context) {
    currentPage = ModalRoute.of(context)!.settings.name;
  }

  @action
  logOut(BuildContext context) async {
    await _logOutUseCase();

    Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false);
  }

  @action
  onTap(BuildContext context, {required String routeName}) {
    if (currentPage == routeName)
      Navigator.pop(context);
    else
      Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
  }
}
