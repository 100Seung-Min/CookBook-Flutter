import 'package:hive_flutter/adapters.dart';
import '../entity/food_entity.dart';

abstract class FoodLocalSource {
  static Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter<FoodHiveEntity>(FoodHiveEntityAdapter());

    await Hive.openBox<FoodHiveEntity>(FoodHiveEntity.boxKey);
  }

  Future<void> saveFood(FoodHiveEntity food);

  Future<void> removeFood(int recipeId);

  Future<List<FoodHiveEntity>> getFoodList();
}
