import 'package:domain/entity/recipe_entity.dart';

abstract class RecipeRepository {
  Future<List<RecipeEntity>> getRecipe({required int recipeId});
}
