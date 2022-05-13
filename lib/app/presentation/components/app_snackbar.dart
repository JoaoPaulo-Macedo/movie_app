import 'package:flutter/material.dart';

enum AppSnackBarType { error, success, warning }

class AppSnackBar {
  static show(
    BuildContext context, {
    required String message,
    required AppSnackBarType type,
    String? description,
  }) {
    Color? backgroundColor = Colors.white;
    Color? textColor = Colors.black;

    switch (type) {
      case AppSnackBarType.error:
        backgroundColor = Colors.red[600];
        textColor = Colors.white;
        break;
      case AppSnackBarType.success:
        backgroundColor = Colors.green[600];
        textColor = Colors.white;
        break;
      case AppSnackBarType.warning:
        backgroundColor = const Color.fromARGB(255, 205, 120, 0);
        textColor = Colors.white;
        break;
    }

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        content: Text('$message ${description ?? ''}', style: TextStyle(color: textColor)),
        duration: const Duration(seconds: 5),
      ));
    });
  }
}
