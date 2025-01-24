import '../repository/auth_repo.dart';
import '../services/register_service.dart';
import '../services/verify_email_service.dart';

class IAuthRepo implements AuthRepo {
  const IAuthRepo(
    this._registerService,
    this._verifyEmailService,
  );

  final RegisterService _registerService;
  final VerifyEmailService _verifyEmailService;

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
}
