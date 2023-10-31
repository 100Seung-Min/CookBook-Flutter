import 'package:cookbook/domain/entity/food_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_response.g.dart';

@JsonSerializable()
class FoodResponse {
  FoodResponse(
    this.recipeId,
    this.recipeName,
    this.summary,
    this.cookingTime,
    this.calorie,
    this.level,
  );

  factory FoodResponse.fromJson(Map<String, dynamic> json) =>
      _$FoodResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FoodResponseToJson(this);

  @JsonKey(name: 'RECIPE_ID')
  final int recipeId;
  @JsonKey(name: 'RECIPE_NM_KO')
  final String recipeName;
  @JsonKey(name: 'SUMRY')
  final String summary;
  @JsonKey(name: 'COOKING_TIME')
  final String cookingTime;
  @JsonKey(name: 'CALORIE')
  final String calorie;
  @JsonKey(name: 'LEVEL_NM')
  final String level;
}

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
