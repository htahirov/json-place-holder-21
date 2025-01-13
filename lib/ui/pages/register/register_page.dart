import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/register_provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterProvider registerProvider = context.read<RegisterProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            TextFormField(
              controller: registerProvider.nameController,
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
            ),
            TextFormField(
              controller: registerProvider.surnameController,
              decoration: const InputDecoration(
                hintText: 'SurName',
              ),
            ),
            TextFormField(
              controller: registerProvider.phoneController,
              decoration: const InputDecoration(
                hintText: 'Phone Number',
              ),
            ),
            TextFormField(
              controller: registerProvider.birthdayController,
              decoration: const InputDecoration(
                hintText: 'Birthday',
              ),
            ),
            TextFormField(
              controller: registerProvider.emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            TextFormField(
              controller: registerProvider.passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            ElevatedButton(
              onPressed: () => registerProvider.verifyEmail(context),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
