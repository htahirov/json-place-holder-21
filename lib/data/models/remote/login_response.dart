class LoginResponse {
  final String token;
  final String role;

  LoginResponse({
    required this.token,
    required this.role,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final token = json['token'];
    final role = json['role'];
    
    if (token == null || role == null) {
      throw Exception('Missing required fields in login response');
    }
    
    return LoginResponse(
      token: token.toString(),
      role: role.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'token': token,
    'role': role,
  };
}