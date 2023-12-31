import 'package:data/mapper/recipe/response_to_entity.dart';
import 'package:domain/entity/recipe_entity.dart';
import 'package:domain/repository/recipe_repository.dart';
import 'package:remote/datasource/recipe_remote_source.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  RecipeRepositoryImpl(
    this.recipeRemoteSource,
  );

  final RecipeRemoteSource recipeRemoteSource;

  @override
  Future<List<RecipeEntity>> getRecipe({required int recipeId}) async {
    final response = await recipeRemoteSource.getRecipe(recipeId: recipeId);
    return response.map((item) => item.toEntity()).toList();
  }
}
