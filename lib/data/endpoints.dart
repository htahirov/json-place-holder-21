class Endpoints {
  Endpoints._();

  static const String _baseURL = 'https://jsonplaceholder.typicode.com';

  static const String posts = '$_baseURL/posts';
  static const String users = '$_baseURL/users';

  static const String verifyEmail =
      'http://134.122.65.76:8080/api/user/verifyEmail';

  static const String register = 'http://134.122.65.76:8080/api/user/register';
  static const String products = 'https://fakestoreapi.com/products';
  static const String resetPassword =
      'http://134.122.65.76:8080/api/user/resetPassword'; // Nihad
  static const String login =
      'http://134.122.65.76:8080/api/auth/login'; // Elmerdan
  static const String logout =
      'http://134.122.65.76:8080/api/auth/logout'; // Revan
  static const String meals = 'http://134.122.65.76:8080/api/meal'; // Eli
}
