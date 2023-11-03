import 'package:hive_flutter/adapters.dart';
import '../entity/food_entity.dart';
import 'food_local_source.dart';

class FoodLocalSourceImpl extends FoodLocalSource{
  @override
  Future<void> saveFood(FoodHiveEntity food) async {
    final foodBox = Hive.box<FoodHiveEntity>(FoodHiveEntity.boxKey);

    await foodBox.put(food.recipeId, food);
  }

  @override
  Future<void> removeFood(int recipeId) async {
    final foodBox = Hive.box<FoodHiveEntity>(FoodHiveEntity.boxKey);

    foodBox.delete(recipeId);
  }

  @override
  Future<List<FoodHiveEntity>> getFoodList() async {
    final foodBox = Hive.box<FoodHiveEntity>(FoodHiveEntity.boxKey);

    return List.generate(foodBox.length, (index) => foodBox.getAt(index))
        .whereType<FoodHiveEntity>()
        .toList();
  }
}
