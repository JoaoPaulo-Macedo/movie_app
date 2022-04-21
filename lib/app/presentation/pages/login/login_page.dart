import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/presentation/components/login_form.dart';
import 'package:movie_app/app/presentation/components/logo.dart';
import 'package:movie_app/app/presentation/pages/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  @override
  void initState() {
    super.initState();

    controller = GetIt.instance.get<LoginController>();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.unfocus,
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Center(child: LoginForm(controller)),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 130),
                child: MediaQuery.of(context).viewInsets.bottom == 0
                    ? Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Logo(
                          key: const ValueKey('logo_key'),
                          height: MediaQuery.of(context).size.height / 9,
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
