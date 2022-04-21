import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/app/presentation/pages/login/login_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm(this.controller, {Key? key}) : super(key: key);

  final LoginController controller;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                TextField(
                  focusNode: widget.controller.usernameFocus,
                  controller: widget.controller.usernameController,
                  style: Theme.of(context).textTheme.bodyText2,
                  cursorColor: Colors.white,
                  maxLength: 40,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    counterText: '',
                  ),
                ),
                TextField(
                  focusNode: widget.controller.passwordFocus,
                  obscureText: true,
                  obscuringCharacter: '*',
                  controller: widget.controller.passwordController,
                  style: Theme.of(context).textTheme.bodyText2,
                  cursorColor: Colors.white,
                  maxLength: 80,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    counterText: '',
                  ),
                ),
                const SizedBox(height: 15),
                Observer(
                  builder: (_) {
                    if (widget.controller.isLoading) {
                      return Container(
                        margin:
                            const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        width: 28,
                        height: 28,
                        child: const CircularProgressIndicator(strokeWidth: 2),
                      );
                    }

                    return TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        ),
                      ),
                      onPressed: widget.controller.isSignInEnabled
                          ? () => widget.controller.logIn(context)
                          : null,
                      child: const Text('Log In'),
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
