import 'package:http_api_app/data/services/remote/reset_password_service.dart';

import '../models/remote/login_response.dart';
import '../repository/auth_repo.dart';
import '../services/remote/login_service.dart';
import '../services/remote/register_service.dart';
import '../services/remote/verify_email_service.dart';

class IAuthRepo implements AuthRepo {
  const IAuthRepo(
    this._registerService,
    this._verifyEmailService,
    this._loginService,
    this._resetPasswordService,
  );

  final RegisterService _registerService;
  final VerifyEmailService _verifyEmailService;
  final LoginService _loginService;
  final ResetPasswordService _resetPasswordService;

  @override
  Future<bool> register({
    required String otpCode,
    required String email,
    required String name,
    required String surname,
    required String phone,
    required String password,
    required String birthDate,
  }) =>
      _registerService.register(
        otpCode: otpCode,
        email: email,
        name: name,
        surname: surname,
        phone: phone,
        password: password,
        birthDate: birthDate,
      );

  @override
  Future<bool> verifyEmail(String email) =>
      _verifyEmailService.verifyEmail(email);

  @override
  Future<LoginResponse> login({
    required String email,
    required String password,
  }) =>
      _loginService.login(
        email: email,
        password: password,
      );

  @override
  Future<bool> resetPassword({
    required String newPassword,
    required String confirmPassword,
  }) =>
      _resetPasswordService.resetPassword(
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
}
