import 'package:cookbook/data/local/entity/food_entity.dart';
import 'package:hive_flutter/adapters.dart';

class FoodLocalSource {
  static Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter<FoodHiveEntity>(FoodHiveEntityAdapter());

    await Hive.openBox<FoodHiveEntity>(FoodHiveEntity.boxKey);
  }

  Future<void> saveFood(FoodHiveEntity food) async {
    final foodBox = Hive.box<FoodHiveEntity>(FoodHiveEntity.boxKey);

    await foodBox.put(food.recipeId, food);
  }

  Future<void> removeFood(int recipeId) async {
    final foodBox = Hive.box<FoodHiveEntity>(FoodHiveEntity.boxKey);

    foodBox.delete(recipeId);
  }

  Future<List<FoodHiveEntity>> getFoodList() async {
    final foodBox = Hive.box<FoodHiveEntity>(FoodHiveEntity.boxKey);

    return List.generate(foodBox.length, (index) => foodBox.getAt(index))
        .whereType<FoodHiveEntity>()
        .toList();
  }
}
