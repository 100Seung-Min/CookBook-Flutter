import '../response/ingredient/ingredient_response.dart';

abstract class IngredientRemoteSource {
  Future<List<IngredientResponse>> getIngredient({required int recipeId});
}
