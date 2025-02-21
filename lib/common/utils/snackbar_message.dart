import 'package:flutter/material.dart';

void showCustomSnackBar(
  BuildContext context,
  String message, {
  SnackBarAction? action,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      action: action,
      duration: const Duration(seconds: 3),
    ),
  );
}
