import 'package:cookbook/data/remote/response/ingredient/ingredient_base_response.dart';
import 'package:cookbook/data/remote/response/ingredient/ingredient_response.dart';
import 'package:cookbook/data/remote/util/end_point.dart';
import 'package:cookbook/data/remote/util/network.dart';

class IngredientRemoteSource {
  IngredientRemoteSource(this.networkManager);

  final NetworkManager networkManager;

  Future<List<IngredientResponse>> getIngredient(
      {required int recipeId}) async {
    final response = await networkManager.request(
        RequestMethod.get, "${EndPoint.ingredient}/1/30?RECIPE_ID=$recipeId");
    return IngredientBaseResponse.fromJson(response.data)
        .response
        .row
        .map((item) => IngredientResponse.fromJson(item))
        .toList();
  }
}
