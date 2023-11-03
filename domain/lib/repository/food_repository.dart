import '../entity/food_entity.dart';

abstract class FoodRepository {
  Future<List<FoodEntity>> getFoodList({required int startIdx});

  Future<List<FoodEntity>> getFavoriteFoodList();

  Future<void> addFavoriteFood(FoodEntity foodEntity);

  Future<void> removeFavoriteFood(int recipeId);
}
