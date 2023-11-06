import 'package:hive/hive.dart';

part 'food_entity.g.dart';

@HiveType(typeId: 0)
class FoodHiveEntity extends HiveObject {
  static const String boxKey = 'food';

  @HiveField(0)
  late int recipeId;
  @HiveField(1)
  late String recipeName;
  @HiveField(2)
  late String summary;
  @HiveField(3)
  late String cookingTime;
  @HiveField(4)
  late String calorie;
  @HiveField(5)
  late String level;
}
