import 'package:domain/entity/recipe_entity.dart';

class DetailState {
  const DetailState._({
    this.recipeList = const [],
    this.ingredientList = const {},
    this.isLoading = false,
  });

  final List<RecipeEntity> recipeList;
  final Map<String, String> ingredientList;
  final bool isLoading;

  const DetailState.initial() : this._();

  DetailState asLoading() {
    return copyWith(isLoading: true);
  }

  DetailState asRecipeLoadSuccess(List<RecipeEntity> recipeList) {
    return copyWith(recipeList: recipeList);
  }

  DetailState asIngredientLoadSuccess(Map<String, String> ingredientList) {
    return copyWith(ingredientList: ingredientList, isLoading: false);
  }

  DetailState copyWith({
    List<RecipeEntity>? recipeList,
    Map<String, String>? ingredientList,
    bool? isLoading,
  }) {
    return DetailState._(
      recipeList: recipeList ?? this.recipeList,
      ingredientList: ingredientList ?? this.ingredientList,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
