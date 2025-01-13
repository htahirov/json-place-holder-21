import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/services/register_service.dart';
import '../utils/pager.dart';
import 'register_provider.dart';

class OtpProvider extends ChangeNotifier {
  final TextEditingController otpController = TextEditingController();

  void register(BuildContext context) async {
    try {
      final RegisterProvider registerProvider =
          context.read<RegisterProvider>();
      bool isSuccess = await RegisterService.register(
        otpCode: otpController.text,
        email: registerProvider.emailController.text,
        name: registerProvider.nameController.text,
        surname: registerProvider.surnameController.text,
        phone: registerProvider.phoneController.text,
        password: registerProvider.passwordController.text,
        birthDate: registerProvider.birthdayController.text,
      );
      if (isSuccess) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => Pager.posts,
          ),
          (route) => route.isCurrent,
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
    otpController.dispose();
    super.dispose();
  }
}
