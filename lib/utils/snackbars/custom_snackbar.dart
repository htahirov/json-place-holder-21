import 'package:flutter/material.dart';

class CustomSnackbar {
  CustomSnackbar._();

  static void showError(
    BuildContext context, {
    String message = 'Error Occured',
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );

  static void showNetworkError(
    BuildContext context, {
    String message = 'Network Error Occured',
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
}
