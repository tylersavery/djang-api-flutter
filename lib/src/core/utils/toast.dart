import 'package:flutter/material.dart';

class ToastService {
  static _show(BuildContext context, String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isError ? Colors.red.shade700 : null,
        content: Text(message),
      ),
    );
  }

  static message(BuildContext context, String message) {
    _show(context, message);
  }

  static error(BuildContext context, String message) {
    _show(context, message, isError: true);
  }
}
