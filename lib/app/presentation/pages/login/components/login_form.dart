import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/app/presentation/components/app_snackbar.dart';
import 'package:movie_app/app/presentation/consts.dart';
import 'package:movie_app/app/presentation/pages/login/login_controller.dart';
import 'package:movie_app/app/presentation/routes_name.dart';
import 'package:movie_app/core/utils/failure.dart';

class LoginForm extends StatefulWidget {
  const LoginForm(this.controller, {Key? key}) : super(key: key);

  final LoginController controller;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  snackBar(Failure f) {
    AppSnackBar.show(
      context,
      message: f.message,
      description: f.description,
      type: AppSnackBarType.error,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(kCardBorderRadius),
            ),
            child: Column(
              children: [
                TextField(
                  focusNode: widget.controller.usernameFocus,
                  controller: widget.controller.usernameController,
                  style: theme.textTheme.bodyText2,
                  cursorColor: Colors.white,
                  maxLength: 40,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: theme.textTheme.bodyText2,
                    counterText: '',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: theme.primaryColor, width: 1.5),
                    ),
                  ),
                ),
                Observer(builder: (context) {
                  return TextField(
                    focusNode: widget.controller.passwordFocus,
                    obscureText: !widget.controller.showPassword,
                    obscuringCharacter: '*',
                    controller: widget.controller.passwordController,
                    style: theme.textTheme.bodyText2,
                    cursorColor: Colors.white,
                    maxLength: 80,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: theme.textTheme.bodyText2,
                      counterText: '',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: theme.primaryColor, width: 1.5),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          widget.controller.showPassword = !widget.controller.showPassword;
                        },
                        child: Icon(
                          widget.controller.showPassword ? Icons.visibility : Icons.visibility_off,
                          color: widget.controller.showPassword ? theme.primaryColor : Colors.white,
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 15),
                Observer(
                  builder: (_) {
                    if (widget.controller.isLoading) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 30,
                        ),
                        width: 28,
                        height: 28,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: theme.primaryColor,
                        ),
                      );
                    }

                    return TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        ),
                        foregroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                            if (states.contains(MaterialState.disabled)) {
                              return null;
                            }

                            return theme.primaryColor;
                          },
                        ),
                      ),
                      onPressed: widget.controller.isSignInEnabled ? login : null,
                      child: const Text('Log In', style: TextStyle(fontSize: 17)),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void login() async {
    var response = await widget.controller.logIn();

    if (response is Failure) {
      snackBar(response);
    } else {
      Navigator.popAndPushNamed(context, RoutesName.splash);
    }
  }
}
