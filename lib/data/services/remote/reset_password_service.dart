import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../../../utils/extensions/int_extensions.dart';

import '../../endpoints.dart';
import '../local/auth_local_storage.dart';

class ResetPasswordService {
  Future<bool> resetPassword({
    required String newPassword,
    required String confirmPassword,
  }) async {
    Uri url = Uri.parse(Endpoints.resetPassword);
    log('Endpoint: ${Endpoints.resetPassword}');

    final body = jsonEncode({
      "newPassword": newPassword,
      "confirmPassword": confirmPassword,
    });

     final token = AuthLocalStorage().token;

    final headers = {
      "accept": "*/*",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
      "Role": "USER"
    };

    log('Request body: $body');
    log('Headers: $headers');
    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    log('Status Code: ${response.statusCode}');
    log('Response Body: ${response.body}');

    return response.statusCode.isSuccess;
  }
}
