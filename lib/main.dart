import 'package:flutter/material.dart';
import 'package:mahaly/core/services/services.dart';
import 'package:mahaly/mahaly_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initservices();
  runApp(const Mahaly());
}
