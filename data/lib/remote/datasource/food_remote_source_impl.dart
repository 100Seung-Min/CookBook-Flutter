import 'package:data/remote/datasource/food_remote_source.dart';
import '../../core/constant.dart';
import '../response/food/food_base_response.dart';
import '../response/food/food_response.dart';
import '../util/end_point.dart';
import '../util/network.dart';

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
