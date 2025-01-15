import 'package:flutter/material.dart';

import 'ui/app.dart';
import 'utils/di/locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}
