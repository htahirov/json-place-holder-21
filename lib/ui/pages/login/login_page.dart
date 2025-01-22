import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/login/login_cubit.dart';
import '../../../utils/pager.dart';
import '../../../utils/snackbars/custom_snackbar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              const Text(
                'Welcome,',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Log in now to continue',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              const Icon(
                Icons.lock_outlined,
                size: 100,
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: loginCubit.emailController,
                decoration: const InputDecoration(
                  hintText: 'Enter your email address',
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: loginCubit.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forget Password ?'),
                ),
              ),
              const SizedBox(height: 16),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (_, state) {
                  if (state is LoginSuccess) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Pager.posts,
                      ),
                      (route) => false,
                    );
                  } else if (state is LoginNetworkError) {
                    CustomSnackbar.showNetworkError(context);
                  } else if (state is LoginError) {
                    CustomSnackbar.showError(
                      context,
                      message: state.message,
                    );
                  }
                },
                builder: (_, state) => ElevatedButton(
                  onPressed: state is LoginLoading ? null : loginCubit.login,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: state is LoginLoading
                      ? const CircularProgressIndicator()
                      : const Text('Login'),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => Pager.register,
                        ),
                      );
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
