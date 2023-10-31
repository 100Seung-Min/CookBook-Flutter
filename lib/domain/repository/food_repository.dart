import 'package:cookbook/data/remote/datasource/food_remote_source.dart';
import 'package:cookbook/data/remote/response/food/food_response.dart';
import 'package:cookbook/domain/entity/food_entity.dart';

class FoodRepository {
  FoodRepository(this.foodRemoteSource);

  final FoodRemoteSource foodRemoteSource;

  Future<List<FoodEntity>> getFoodList({required int startIdx}) async {
    final response = await foodRemoteSource.getFoodList(startIdx: startIdx);
    return response.map((item) => item.toEntity()).toList();
  }
}
