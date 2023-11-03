part of navigation;

enum Routes { food, detail }

class _Paths {
  static const food = "/food";
  static const detail = "/detail";

  static const Map<Routes, String> _pathMap = {
    Routes.food: _Paths.food,
    Routes.detail: _Paths.detail
  };

  static String of(Routes route) => _pathMap[route] ?? food;
}

class AppPageRoute extends MaterialPageRoute {
  AppPageRoute({required this.page})
      : super(
          builder: (context) => Scaffold(
            body: Container(
              color: Colors.black,
              child: const FoodScreen(),
            ),
          ),
        );

  final Widget page;
}
