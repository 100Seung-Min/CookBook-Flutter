import 'package:cookbook/data/remote/response/recipe/recipe_base_response.dart';
import 'package:cookbook/data/remote/response/recipe/recipe_response.dart';
import 'package:cookbook/data/remote/util/end_point.dart';
import 'package:cookbook/data/remote/util/network.dart';

class RecipeRemoteSource {
  RecipeRemoteSource(this.networkManager);

  final NetworkManager networkManager;

  Future<List<RecipeResponse>> getRecipe({required int recipeId}) async {
    final response = await networkManager.request(
        RequestMethod.get, "${EndPoint.recipe}/1/100?RECIPE_ID=$recipeId");
    return RecipeBaseResponse.fromJson(response.data)
        .response
        .row
        .map((item) => RecipeResponse.fromJson(item))
        .toList();
  }
}
