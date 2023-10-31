abstract class FoodEvent {
  const FoodEvent();
}

class FoodLoadStarted extends FoodEvent {
  final bool loadAll;

  const FoodLoadStarted({this.loadAll = false});
}

class FoodLoadMoreStarted extends FoodEvent {}
