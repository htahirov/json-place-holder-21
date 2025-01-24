import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/resetPassword/reset_password_cubit.dart';
import '../../../utils/pager.dart';
import '../../../utils/snackbars/custom_snackbar.dart';
import 'widgets/reset_password_button.dart';
import 'widgets/reset_password_text_form_field.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final resetPasswordCubit = context.read<ResetPasswordCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.lock_reset,
                size: 64,
                color: Colors.blue,
              ),
              const SizedBox(height: 16),
              ResetPasswordTextField(
                controller: resetPasswordCubit.currentPasswordController,
                labelText: 'Current Password',
                isPassword: true,
              ),
              const SizedBox(height: 16),
              ResetPasswordTextField(
                controller: resetPasswordCubit.newPasswordController,
                labelText: 'New Password',
                isPassword: true,
              ),
              const SizedBox(height: 16),
              ResetPasswordTextField(
                controller: resetPasswordCubit.confirmPasswordController,
                labelText: 'Confirm New Password',
                isPassword: true,
              ),
              const SizedBox(height: 24),
              BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                listener: (_, state) {
                  if (state is ResetPasswordSuccess) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Pager.login,
                      ),
                      (route) => false,
                    );
                  } else if (state is ResetPasswordNetworkError) {
                    CustomSnackbar.showNetworkError(context);
                  } else if (state is ResetPasswordError) {
                    CustomSnackbar.showError(
                      context,
                      message: state.message,
                    );
                  }
                },
                builder: (_, state) {
                  return ResetPasswordButton(
                    onPressed: state is ResetPasswordLoading
                        ? null
                        : () => resetPasswordCubit.resetPassword(context),
                    text: "Reset password",
                    isLoading: state is ResetPasswordLoading,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
