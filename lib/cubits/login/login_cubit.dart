import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/auth_repo.dart';
import '../../data/services/local/auth_local_storage.dart';
import '../../utils/extensions/validator_extensions.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._authRepo,
    this._storage,
  ) : super(LoginInitial());

  final AuthRepo _authRepo;
  final AuthLocalStorage _storage;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String get email => emailController.text;
  String get password => passwordController.text;

  void login() async {
    if (!email.isValidEmail) {
      emit(LoginError(message: 'Invalid email format'));
      return;
    }

    if (!password.isValidPassword) {
      emit(LoginError(message: 'Password must be at least 6 characters'));
      return;
    }

    try {
      emit(LoginLoading());
      final response = await _authRepo.login(
        email: email,
        password: password,
      );
      await _storage.saveToken(response.token);

      emit(LoginSuccess());
    } on SocketException {
      emit(LoginNetworkError());
    } catch (e) {
      emit(LoginError(message: e.toString()));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
