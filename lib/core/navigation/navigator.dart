library navigation;

import 'package:cookbook/core/navigation/argument.dart';
import 'package:cookbook/presentation/detail/detail_screen.dart';
import 'package:cookbook/presentation/food/food_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'route.dart';

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.detail:
        final argument = settings.arguments as DetailScreenArgument;
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) =>
                DetailScreen(recipeId: argument.recipeId));
      case _Paths.food:
      default:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => const FoodScreen());
    }
  }

  static Future? push<T>(Routes route, {T? arguments}) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, {T? arguments}) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}