import 'dart:io';

import 'package:flutter/material.dart';

import '../data/services/verify_email_service.dart';
import '../utils/pager.dart';

enum RegisterStates { loading, success, error, networkError }

class RegisterProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // late RegisterStates currentState;

  void verifyEmail(BuildContext context) async {
    try {
      bool isSuccess =
          await VerifyEmailService.verifyEmail(emailController.text);
      if (isSuccess) {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => Pager.otp(context),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error occured'),
          ),
        );
      }
    } on SocketException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Network Error occured'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error occured'),
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    surnameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    birthdayController.dispose();
    super.dispose();
  }
}
