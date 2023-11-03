library navigation;
import 'package:domain/entity/food_entity.dart';
import 'package:flutter/material.dart';
import '../detail/detail_screen.dart';
import '../food/food_screen.dart';

part 'route.dart';

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.detail:
        final argument = settings.arguments as FoodEntity;
        return AppPageRoute(
          page: DetailScreen(
            foodItem: argument,
          ),
        );
      case _Paths.food:
      default:
        return AppPageRoute(
          page: const FoodScreen(),
        );
    }
  }

  static Future? push<T>(Routes route, {T? arguments}) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, {T? arguments}) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}
