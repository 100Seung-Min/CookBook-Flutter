import 'package:domain/entity/food_entity.dart';
import 'package:local/entity/food_entity.dart';

extension FoodHiveEntityToEntityX on FoodHiveEntity {
  FoodEntity toEntity() => FoodEntity(
    recipeId: recipeId,
    recipeName: recipeName,
    summary: summary,
    cookingTime: cookingTime,
    calorie: calorie,
    level: level,
  );
}