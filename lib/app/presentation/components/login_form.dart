import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/presentation/pages/login/login_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late LoginController controller;

  @override
  void initState() {
    super.initState();

    controller = GetIt.instance.get<LoginController>();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Login to The Movie DB',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            LabelFieldWidget(
              label: 'Username',
              hintText: 'Enter your username...',
              controller: controller.userNameController,
            ),
            LabelFieldWidget(
              label: 'Password',
              hintText: 'Enter your password',
              controller: controller.passwordController,
              isPasswordField: true,
            ),
            Observer(
              builder: (_) => TextButton(
                onPressed: controller.isSignInEnabled ? controller.logIn : null,
                child: const Text('Sign In'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LabelFieldWidget extends StatelessWidget {
  const LabelFieldWidget({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.isPasswordField = false,
  }) : super(key: key);

  final String label;
  final String hintText;
  final bool isPasswordField;

  final TextEditingController controller;

  final UnderlineInputBorder _enabledBorder = const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  );

  final UnderlineInputBorder _focusedBorder = const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.start,
          ),
          TextField(
            obscureText: isPasswordField,
            obscuringCharacter: '*',
            controller: controller,
            style: Theme.of(context).textTheme.headline6,
            decoration: InputDecoration(
              hintText: hintText,
              // hintStyle: Theme.of(context).textTheme.,
              focusedBorder: _focusedBorder,
              enabledBorder: _enabledBorder,
            ),
          ),
        ],
      ),
    );
  }
}
