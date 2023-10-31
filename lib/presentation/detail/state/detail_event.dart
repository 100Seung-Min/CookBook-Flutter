abstract class DetailEvent {
  const DetailEvent();
}

class RecipeLoadStarted extends DetailEvent {
  RecipeLoadStarted({required this.recipeId});

  final int recipeId;
}
