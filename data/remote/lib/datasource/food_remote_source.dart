import '../response/food/food_response.dart';

abstract class FoodRemoteSource {
  Future<List<FoodResponse>> getFoodList({required int startIdx});
}
