import '../../../domain/entity/recipe_entity.dart';

class DetailState {
  const DetailState._({
    this.recipeList = const [],
    this.ingredientList = const {},
  });

  final List<RecipeEntity> recipeList;
  final Map<String, String> ingredientList;

  const DetailState.initial() : this._();

  DetailState asRecipeLoadSuccess(List<RecipeEntity> recipeList) {
    return copyWith(recipeList: recipeList);
  }

  DetailState asIngredientLoadSuccess(Map<String, String> ingredientList) {
    return copyWith(ingredientList: ingredientList);
  }

  DetailState copyWith({
    List<RecipeEntity>? recipeList,
    Map<String, String>? ingredientList,
  }) {
    return DetailState._(
      recipeList: recipeList ?? this.recipeList,
      ingredientList: ingredientList ?? this.ingredientList,
    );
  }
}
