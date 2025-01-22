import 'package:hive_flutter/hive_flutter.dart';

class AuthLocalStorage {
  static const String _boxName = 'auth_box';
  static const String _tokenKey = 'token';

  static late Box<dynamic> _box;

  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(_boxName);
  }

  Future<void> saveToken(String token) async =>
      await _box.put(_tokenKey, token);

  String? get token => _box.get(_tokenKey);

  bool get hasToken => token != null;

  Future<void> clearAuth() async => await _box.clear();
}
