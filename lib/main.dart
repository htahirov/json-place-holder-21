import 'package:flutter/material.dart';

import 'data/services/local/auth_local_storage.dart';
import 'ui/app.dart';
import 'utils/di/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await AuthLocalStorage.init();
  runApp(const MyApp());
}
