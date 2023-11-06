import 'package:domain/entity/recipe_entity.dart';
import 'package:remote/response/recipe/recipe_response.dart';

extension RecipeResponseToEntityX on RecipeResponse {
  RecipeEntity toEntity() => RecipeEntity(description: description, tip: tip);
}