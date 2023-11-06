import '../entity/ingredient_entity.dart';

abstract class IngredientRepository {
  Future<List<IngredientEntity>> getIngredient({required int recipeId});
}
