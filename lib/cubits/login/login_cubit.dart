import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/auth_repo.dart';
import '../../utils/hive/auth_local_storage.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepo, this._storage) : super(LoginInitial());

  final AuthRepo _authRepo;
  final AuthLocalStorage _storage;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isValidEmail() {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(emailController.text);
  }

  bool isValidPassword() {
    return passwordController.text.length >= 6;
  }

  void login() async {
    if (!isValidEmail()) {
      emit(LoginError(message: 'Invalid email format'));
      return;
    }

    if (!isValidPassword()) {
      emit(LoginError(message: 'Password must be at least 6 characters'));
      return;
    }

    try {
      emit(LoginLoading());
      final response = await _authRepo.login(
        email: emailController.text,
        password: passwordController.text,
      );
      
      await _storage.saveToken(response.token);
      await _storage.saveEmail(emailController.text);
      
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