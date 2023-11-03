import 'package:data/mapper/food/entity_to_hive.dart';
import 'package:data/mapper/food/hive_to_entity.dart';
import 'package:data/mapper/food/response_to_entity.dart';
import 'package:domain/entity/food_entity.dart';
import 'package:domain/repository/food_repository.dart';
import 'package:local/datasource/food_local_source.dart';
import 'package:remote/datasource/food_remote_source.dart';

class FoodRepositoryImpl extends FoodRepository {
  FoodRepositoryImpl(this.foodRemoteSource, this.foodLocalSource);

  final FoodRemoteSource foodRemoteSource;
  final FoodLocalSource foodLocalSource;

  @override
  Future<List<FoodEntity>> getFoodList({required int startIdx}) async {
    final response = await foodRemoteSource.getFoodList(startIdx: startIdx);
    return response.map((item) => item.toEntity()).toList();
  }

  @override
  Future<List<FoodEntity>> getFavoriteFoodList() async {
    final response = await foodLocalSource.getFoodList();
    return response.map((item) => item.toEntity()).toList();
  }

  @override
  Future<void> addFavoriteFood(FoodEntity foodEntity) async {
    await foodLocalSource.saveFood(foodEntity.toHiveEntity());
  }

  @override
  Future<void> removeFavoriteFood(int recipeId) async {
    await foodLocalSource.removeFood(recipeId);
  }
}
