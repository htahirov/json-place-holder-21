import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/auth_repo.dart';
import '../register/register_cubit.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(this._authRepo) : super(OtpInitial());

  final AuthRepo _authRepo;

  final otpController = TextEditingController();

  void register(BuildContext context) async {
    try {
      emit(OtpLoading());
      final registerCubit = context.read<RegisterCubit>();
      final isSuccess = await _authRepo.register(
        otpCode: otpController.text,
        email: registerCubit.emailController.text,
        name: registerCubit.nameController.text,
        surname: registerCubit.surnameController.text,
        phone: registerCubit.phoneController.text,
        password: registerCubit.passwordController.text,
        birthDate: registerCubit.birthdayController.text,
      );
      if (isSuccess) {
        emit(OtpSuccess());
        return;
      }
      emit(OtpError());
    } on SocketException {
      emit(OtpNetworkError());
    } catch (e) {
      emit(OtpError());
    }
  }

  @override
  Future<void> close() {
    otpController.dispose();
    return super.close();
  }
}
