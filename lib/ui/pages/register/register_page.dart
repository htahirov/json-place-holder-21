import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/register/register_cubit.dart';
import '../../../utils/pager.dart';
import '../../../utils/snackbars/custom_snackbar.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();
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
              controller: registerCubit.nameController,
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
            ),
            TextFormField(
              controller: registerCubit.surnameController,
              decoration: const InputDecoration(
                hintText: 'SurName',
              ),
            ),
            TextFormField(
              controller: registerCubit.phoneController,
              decoration: const InputDecoration(
                hintText: 'Phone Number',
              ),
            ),
            TextFormField(
              controller: registerCubit.birthdayController,
              decoration: const InputDecoration(
                hintText: 'Birthday',
              ),
            ),
            TextFormField(
              controller: registerCubit.emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            TextFormField(
              controller: registerCubit.passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            BlocConsumer<RegisterCubit, RegisterState>(
              listener: (_, state) {
                if (state is RegisterSuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => Pager.otp(context),
                    ),
                  );
                } else if (state is RegisterNetworkError) {
                  CustomSnackbar.showNetworkError(context);
                } else if (state is RegisterError) {
                  CustomSnackbar.showError(context);
                }
              },
              builder: (_, state) => ElevatedButton(
                onPressed: state is RegisterLoading
                    ? null
                    : () => registerCubit.verifyEmail(context),
                child: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
