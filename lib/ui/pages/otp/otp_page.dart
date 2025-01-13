import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/otp_provider.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OtpProvider otpProvider = context.read<OtpProvider>();
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
              controller: otpProvider.otpController,
              decoration: const InputDecoration(
                hintText: 'OTP',
              ),
            ),
            ElevatedButton(
              onPressed: () => otpProvider.register(context),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
