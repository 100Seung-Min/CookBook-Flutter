import 'package:cookbook/domain/entity/recipe_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe_response.g.dart';

@JsonSerializable()
class RecipeResponse {
  RecipeResponse(
    this.description,
  );

  factory RecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$RecipeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeResponseToJson(this);

  @JsonKey(name: 'COOKING_DC')
  final String description;
}

extension RecipeResponseToEntityX on RecipeResponse {
  RecipeEntity toEntity() => RecipeEntity(description: description);
}
