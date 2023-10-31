import 'package:cookbook/domain/entity/recipe_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe_response.g.dart';

@JsonSerializable()
class RecipeResponse {
  RecipeResponse(
    this.description,
    this.tip,
  );

  factory RecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$RecipeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeResponseToJson(this);

  @JsonKey(name: 'COOKING_DC')
  final String description;
  @JsonKey(name: 'STEP_TIP', defaultValue: '')
  final String tip;
}

extension RecipeResponseToEntityX on RecipeResponse {
  RecipeEntity toEntity() => RecipeEntity(description: description, tip: tip);
}
