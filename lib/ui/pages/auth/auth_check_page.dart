import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/auth/auth_cubit.dart';
import '../../../utils/pager.dart';
import '../../widgets/global_loading.dart';

class AuthCheckPage extends StatelessWidget {
  const AuthCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (_, state) {
        if (state is AuthLoading) {
          return const Scaffold(
            body: GlobalLoading(),
          );
        }
        if (state is AuthAuthenticated) {
          return Pager.posts;
        }
        return Pager.login;
      },
    );
  }
}
