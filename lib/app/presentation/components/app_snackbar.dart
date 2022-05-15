import 'package:flutter/material.dart';

class AppSnackBar {
  AppSnackBar._();

  factory AppSnackBar.error(BuildContext context, {required String message, String? description}) {
    AppSnackBar._show(context, message: message, color: Colors.red[600], description: description);

    return AppSnackBar._();
  }

  static _show(
    BuildContext context, {
    required String message,
    required Color? color,
    String? description,
  }) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        content: Text('$message ${description ?? ''}', style: const TextStyle(color: Colors.white)),
        duration: const Duration(seconds: 5),
      ));
    });
  }
}
