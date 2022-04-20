import 'dart:io';
import 'package:flutter/material.dart';
import 'package:movie_app/app/presentation/components/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: const [
            Text('Movies App'),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
