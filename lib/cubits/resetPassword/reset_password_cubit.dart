import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_api_app/utils/extensions/validator_extensions.dart';

import '../../data/repository/auth_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this._authRepo) : super(ResetPasswordInitial());

  final AuthRepo _authRepo;

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String get currentPassword => currentPasswordController.text;
  String get newPassword => newPasswordController.text;
  String get confirmPassword => confirmPasswordController.text;

  void resetPassword(BuildContext context) async {
    if (!newPassword.isValidPassword) {
      emit(ResetPasswordError(
          message: 'Password must be at least 6 characters'));
      return;
    }

    if (newPassword == currentPassword) {
      emit(ResetPasswordError(
          message: 'The new password cannot be the same as the old password. '));
      return;
    }

    if (newPassword != confirmPassword) {
      emit(ResetPasswordError(
          message: 'New password does not match confirm password'));
      return;
    }

    try {
      emit(ResetPasswordLoading());
      bool isSuccess = await _authRepo.resetPassword(
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
      if (isSuccess) {
        emit(ResetPasswordSuccess());
        return;
      }
      emit(ResetPasswordError());
    } on SocketException {
      emit(ResetPasswordNetworkError());
    } catch (e) {
      emit(ResetPasswordError());
    }
  }

  @override
  Future<void> close() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
