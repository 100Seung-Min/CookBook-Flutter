import 'package:cookbook/data/remote/datasource/ingredient_remote_source.dart';
import 'package:cookbook/data/remote/response/ingredient/ingredient_response.dart';
import 'package:cookbook/domain/entity/ingredient_entity.dart';

class IngredientRepository {
  IngredientRepository(this.ingredientRemoteSource);

  final IngredientRemoteSource ingredientRemoteSource;

  Future<List<IngredientEntity>> getIngredient({required int recipeId}) async {
    final response =
        await ingredientRemoteSource.getIngredient(recipeId: recipeId);
    return response.map((item) => item.toEntity()).toList();
  }
}
