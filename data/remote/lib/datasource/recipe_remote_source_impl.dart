import 'package:remote/datasource/recipe_remote_source.dart';
import '../response/recipe/recipe_base_response.dart';
import '../response/recipe/recipe_response.dart';
import '../util/end_point.dart';
import '../util/network.dart';

class RecipeRemoteSourceImpl extends RecipeRemoteSource {
  RecipeRemoteSourceImpl(this.networkManager);

  final NetworkManager networkManager;

  @override
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
