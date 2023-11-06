import 'package:cookbook/provider.dart';
import 'package:data/di/data_provider.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(provider);
}
