import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authRepo) : super(RegisterInitial());

  final AuthRepo _authRepo;

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final birthdayController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  void verifyEmail(BuildContext context) async {
    try {
      emit(RegisterLoading());
      bool isSuccess = await _authRepo.verifyEmail(emailController.text);
      if (isSuccess) {
        // Save true for login
        emit(RegisterSuccess());
        return;
      }
      emit(RegisterError());
    } on SocketException {
      emit(RegisterNetworkError());
    } catch (e) {
      emit(RegisterError());
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    nameController.dispose();
    surnameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    birthdayController.dispose();
    return super.close();
  }
}
