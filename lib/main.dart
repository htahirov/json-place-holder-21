import 'package:flutter/material.dart';
import 'ui/app.dart';
import 'utils/di/locator.dart';
import 'utils/hive/auth_local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  
  final storage = locator<AuthLocalStorage>();
  await storage.init();
  
  runApp(const MyApp());
}