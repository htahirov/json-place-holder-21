import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../../../utils/extensions/int_extensions.dart';
import '../../endpoints.dart';
import '../../models/remote/login_response.dart';

class LoginService {
  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    Uri url = Uri.parse(Endpoints.login);
    log('Endpoint: ${Endpoints.login}');
    
    final body = jsonEncode({
      "email": email,
      "password": password,
    });
    
    final headers = {
      "accept": "*/*",
      "Content-Type": "application/json",
    };
    
    log('Request body: $body');
    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    
    log('Status Code: ${response.statusCode}');
    log('Response Body: ${response.body}');
    
    if (response.statusCode.isSuccess) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Login failed');
  }
}
