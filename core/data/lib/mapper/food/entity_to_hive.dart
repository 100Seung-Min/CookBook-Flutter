import 'package:domain/entity/food_entity.dart';
import 'package:local/entity/food_entity.dart';

extension FoodEntityToHiveEntityX on FoodEntity {
  FoodHiveEntity toHiveEntity() => FoodHiveEntity()
    ..recipeId = recipeId
    ..recipeName = recipeName
    ..summary = summary
    ..cookingTime = cookingTime
    ..calorie = calorie
    ..level = level;
}