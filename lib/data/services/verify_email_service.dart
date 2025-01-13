import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../utils/extensions/int_extensions.dart';
import '../endpoints.dart';

class VerifyEmailService {
  static Future<bool> verifyEmail(String email) async {
    Uri url = Uri.parse(Endpoints.verifyEmail);
    log('Endpoint: ${Endpoints.verifyEmail}');
    final body = jsonEncode({"email": email});
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
