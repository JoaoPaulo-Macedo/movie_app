import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/domain/usecases/login_usecase.dart';
import 'package:movie_app/app/presentation/pages/login/components/login_form.dart';
import 'package:movie_app/app/presentation/components/logo.dart';
import 'package:movie_app/app/presentation/pages/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;
  bool isKeyboardOpen = false;

  @override
  void initState() {
    super.initState();

    controller = LoginController(context, GetIt.instance.get<LoginUseCase>());
  }

  @override
  Widget build(BuildContext context) {
    //TODO: state on page
    isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return GestureDetector(
      onTap: controller.unfocus,
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Observer(
            builder: (context) {
              //TODO: solve it
              if (!controller.build) return const SizedBox();

              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  Center(child: LoginForm(controller)),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 130),
                    child: isKeyboardOpen
                        ? null
                        : Padding(
                            padding: const EdgeInsets.only(top: 35),
                            child: Logo(
                              key: const ValueKey('logo_key'),
                              height: MediaQuery.of(context).size.height / 9,
                            ),
                          ),
                    // : null,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
