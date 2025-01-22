import '../models/remote/login_response.dart';

abstract class AuthRepo {
  Future<bool> verifyEmail(String email);
  Future<bool> register({
    required String otpCode,
    required String email,
    required String name,
    required String surname,
    required String phone,
    required String password,
    required String birthDate,
  });
  Future<LoginResponse> login({
    required String email,
    required String password,
  });
}