import 'package:detail/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:food/food_screen.dart';
import 'package:navigation/route.dart';

class Navigation {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Paths.detail:
        final argument = settings.arguments;
        return AppPageRoute(
          page: DetailScreen(
            foodItem: argument,
          ),
        );
      case Paths.food:
      default:
        return AppPageRoute(
          page: const FoodScreen(),
        );
    }
  }
}
