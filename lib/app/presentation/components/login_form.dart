import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/presentation/pages/login/login_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm( this.controller, {Key? key}) : super(key: key);

  final LoginController controller;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Container(
          padding: const EdgeInsets.all(18),
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
                  // isDense: true,
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
                  // isDense: true,
                  labelText: 'Password',
                  labelStyle: Theme.of(context).textTheme.bodyText2,
                  counterText: '',
                ),
              ),
              Observer(
                builder: (_) => TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    ),
                  ),
                  onPressed: widget.controller.isSignInEnabled
                      ? () => widget.controller.logIn(context)
                      : null,
                  child: const Text('Sign In'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
