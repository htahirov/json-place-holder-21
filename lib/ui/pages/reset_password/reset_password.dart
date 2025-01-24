import 'package:flutter/material.dart';

import 'widgets/reset_password_text_form_field.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        centerTitle: true,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.lock_reset,
                size: 64,
                color: Colors.blue,
              ),
              SizedBox(height: 16),
              ResetPasswordTextField(
                labelText: 'Current Password',
                isPassword: true,
              ),
              SizedBox(height: 16),
              ResetPasswordTextField(
                labelText: 'New Password',
                isPassword: true,
              ),
              SizedBox(height: 16),
              ResetPasswordTextField(
                labelText: 'Confirm New Password',
                isPassword: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
