import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../../utils/extensions/int_extensions.dart';
import '../../endpoints.dart';

class RegisterService {
  Future<bool> register({
    required String otpCode,
    required String email,
    required String name,
    required String surname,
    required String phone,
    required String password,
    required String birthDate,
  }) async {
    Uri url = Uri.parse(Endpoints.register);
    log('Endpoint: ${Endpoints.register}');
    final body = jsonEncode(
      {
        "verificationCode": otpCode,
        "name": name,
        "surname": surname,
        "email": email,
        "phoneNumber": phone,
        "password": password,
        "birthDate": birthDate,
      },
    );
    final headers = {
      "accept": "*/*",
      "Content-Type": "application/json",
    };
    log('Request body: $body');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    log('Status Code: ${response.statusCode}');
    log('Response Body: ${response.body}');
    return response.statusCode.isSuccess;
  }
}
