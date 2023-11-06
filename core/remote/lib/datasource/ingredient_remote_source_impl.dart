import '../response/ingredient/ingredient_base_response.dart';
import '../response/ingredient/ingredient_response.dart';
import '../util/end_point.dart';
import '../util/network.dart';
import 'ingredient_remote_source.dart';

class IngredientRemoteSourceImpl extends IngredientRemoteSource {
  IngredientRemoteSourceImpl(this.networkManager);

  final NetworkManager networkManager;

  @override
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
