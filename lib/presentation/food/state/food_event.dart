import 'package:cookbook/domain/entity/food_entity.dart';

abstract class FoodEvent {
  const FoodEvent();
}

class FoodLoadStarted extends FoodEvent {}

class FoodLoadMoreStarted extends FoodEvent {}

class FavoriteFoodLoadStarted extends FoodEvent {}

class FavoriteFoodAdd extends FoodEvent {
  final FoodEntity foodEntity;

  FavoriteFoodAdd(this.foodEntity);
}

class FavoriteFoodRemove extends FoodEvent {
  final int recipeId;

  FavoriteFoodRemove(this.recipeId);
}
