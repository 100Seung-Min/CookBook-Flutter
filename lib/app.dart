import 'package:flutter/material.dart';
import 'package:navigation/navigator.dart';

import 'navigation.dart';

class CookBookApp extends StatelessWidget {
  const CookBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.transparent,
      ),
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: Navigation.onGenerateRoute,
    );
  }
}
