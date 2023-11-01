import 'package:cookbook/data/local/datasource/food_local_source.dart';
import 'package:cookbook/data/local/entity/food_entity.dart';
import 'package:cookbook/data/remote/datasource/food_remote_source.dart';
import 'package:cookbook/data/remote/response/food/food_response.dart';
import 'package:cookbook/domain/entity/food_entity.dart';

class FoodRepository {
  FoodRepository(this.foodRemoteSource, this.foodLocalSource);

  final FoodRemoteSource foodRemoteSource;
  final FoodLocalSource foodLocalSource;

  Future<List<FoodEntity>> getFoodList({required int startIdx}) async {
    final response = await foodRemoteSource.getFoodList(startIdx: startIdx);
    return response.map((item) => item.toEntity()).toList();
  }

  Future<List<FoodEntity>> getFavoriteFoodList() async {
    final response = await foodLocalSource.getFoodList();
    return response.map((item) => item.toEntity()).toList();
  }

  Future<void> addFavoriteFood(FoodEntity foodEntity) async {
    await foodLocalSource.saveFood(foodEntity.toHiveEntity());
  }

  Future<void> removeFavoriteFood(int recipeId) async {
    await foodLocalSource.removeFood(recipeId);
  }
}
