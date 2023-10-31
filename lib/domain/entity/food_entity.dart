class FoodEntity {
  FoodEntity({
    required this.recipeId,
    required this.recipeName,
    required this.summary,
    required this.cookingTime,
    required this.calorie,
    required this.level,
  });

  final int recipeId;
  final String recipeName;
  final String summary;
  final String cookingTime;
  final String calorie;
  final String level;
}
