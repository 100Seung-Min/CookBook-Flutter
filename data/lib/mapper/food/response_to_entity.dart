import 'package:domain/entity/food_entity.dart';
import 'package:remote/response/food/food_response.dart';

extension FoodResponseToEntityX on FoodResponse {
  FoodEntity toEntity() => FoodEntity(
    recipeId: recipeId,
    recipeName: recipeName,
    summary: summary,
    cookingTime: cookingTime,
    calorie: calorie,
    level: level,
  );
}