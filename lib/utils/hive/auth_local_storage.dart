import 'package:hive_flutter/hive_flutter.dart';

class AuthLocalStorage {
  static const String _boxName = 'auth_box';
  static const String _tokenKey = 'token';
  static const String _emailKey = 'email';
  static const String _tokenTimestampKey = 'token_timestamp';

  late Box<dynamic> _box;

  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(_boxName);
  }

  Future<void> saveToken(String token) async {
    await _box.put(_tokenKey, token);
    await _box.put(_tokenTimestampKey, DateTime.now().millisecondsSinceEpoch);
  }

  Future<void> saveEmail(String email) async {
    await _box.put(_emailKey, email);
  }

  String? get token => _box.get(_tokenKey);
  String? get email => _box.get(_emailKey);
  
  bool get isTokenValid {
    final timestamp = _box.get(_tokenTimestampKey);
    if (timestamp == null) return false;
    
    final tokenDateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final difference = DateTime.now().difference(tokenDateTime);
    
    return difference.inHours < 24; //Sadiq demisdi ki bes 24 saat sonra avtomatik logout olur
  }

  Future<void> clearAuth() async {
    await _box.clear();
  }
}