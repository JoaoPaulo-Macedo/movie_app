import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/app/presentation/pages/login/login_controller.dart';
import 'package:movie_app/app/presentation/pages/theme.dart';

class LoginForm extends StatefulWidget {
  const LoginForm(this.controller, {Key? key}) : super(key: key);

  final LoginController controller;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
                    obscureText: widget.controller.showPassword,
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
                          widget.controller.showPassword ? Icons.visibility_off : Icons.visibility,
                          color: widget.controller.showPassword ? Colors.white : theme.primaryColor,
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
                      onPressed: widget.controller.isSignInEnabled
                          ? () => widget.controller.logIn(context)
                          : null,
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
}
