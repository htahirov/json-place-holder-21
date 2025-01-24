import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/otp/otp_cubit.dart';
import '../../../utils/pager.dart';
import '../../../utils/snackbars/custom_snackbar.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final otpCubit = context.read<OtpCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            TextFormField(
              controller: otpCubit.otpController,
              decoration: const InputDecoration(
                hintText: 'OTP',
              ),
            ),
            BlocConsumer<OtpCubit, OtpState>(
              listener: (context, state) {
                if (state is OtpSuccess) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => Pager.posts,
                    ),
                    (route) => route.isCurrent,
                  );
                } else if (state is OtpNetworkError) {
                  CustomSnackbar.showNetworkError(context);
                } else if (state is OtpError) {
                  CustomSnackbar.showError(context);
                }
              },
              builder: (_, state) => ElevatedButton(
                onPressed: state is OtpLoading
                    ? null
                    : () => otpCubit.register(context),
                child: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
