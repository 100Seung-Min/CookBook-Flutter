import 'package:cookbook/data/remote/datasource/recipe_remote_source.dart';
import 'package:cookbook/data/remote/response/recipe/recipe_response.dart';
import 'package:cookbook/domain/entity/recipe_entity.dart';

class RecipeRepository {
  RecipeRepository(
    this.recipeRemoteSource,
  );

  final RecipeRemoteSource recipeRemoteSource;

  Future<List<RecipeEntity>> getRecipe({required int recipeId}) async {
    final response = await recipeRemoteSource.getRecipe(recipeId: recipeId);
    return response.map((item) => item.toEntity()).toList();
  }
}
