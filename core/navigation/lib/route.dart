import 'package:flutter/material.dart';

enum Routes { food, detail }

class Paths {
  static const food = "/food";
  static const detail = "$food/detail";

  static const Map<Routes, String> _pathMap = {
    Routes.food: Paths.food,
    Routes.detail: Paths.detail
  };

  static String of(Routes route) => _pathMap[route] ?? food;
}

class AppPageRoute extends MaterialPageRoute {
  AppPageRoute({required this.page})
      : super(builder: (context) {
          final double topPadding = MediaQuery.of(context).padding.top;
          return Scaffold(
            body: Container(
              padding: EdgeInsets.only(top: topPadding),
              color: Colors.black54,
              child: page,
            ),
          );
        });

  final Widget page;
}
