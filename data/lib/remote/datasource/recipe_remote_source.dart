import '../response/recipe/recipe_response.dart';

abstract class RecipeRemoteSource {
  Future<List<RecipeResponse>> getRecipe({required int recipeId});
}
