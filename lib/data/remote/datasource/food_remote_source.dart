import 'package:cookbook/core/util/constant.dart';
import 'package:cookbook/data/remote/response/food/food_base_response.dart';
import 'package:cookbook/data/remote/util/end_point.dart';
import 'package:cookbook/data/remote/util/network.dart';
import '../response/food/food_response.dart';

class FoodRemoteSource {
  FoodRemoteSource(this.networkManager);

  final NetworkManager networkManager;

  Future<List<FoodResponse>> getFoodList({required int startIdx}) async {
    final response = await networkManager.request(RequestMethod.get,
        '${EndPoint.food}/${startIdx}/${startIdx + pageSize}');
    return FoodBaseResponse.fromJson(response.data)
        .response
        .row
        .map((item) => FoodResponse.fromJson(item))
        .toList();
  }
}
