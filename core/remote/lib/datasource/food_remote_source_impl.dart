import '../response/food/food_base_response.dart';
import '../response/food/food_response.dart';
import '../util/constant.dart';
import '../util/end_point.dart';
import '../util/network.dart';
import 'food_remote_source.dart';

class FoodRemoteSourceImpl extends FoodRemoteSource {
  FoodRemoteSourceImpl(this.networkManager);

  final NetworkManager networkManager;

  @override
  Future<List<FoodResponse>> getFoodList({required int startIdx}) async {
    final response = await networkManager.request(RequestMethod.get,
        '${EndPoint.food}/$startIdx/${startIdx + pageSize}');
    return FoodBaseResponse.fromJson(response.data)
        .response
        .row
        .map((item) => FoodResponse.fromJson(item))
        .toList();
  }
}
