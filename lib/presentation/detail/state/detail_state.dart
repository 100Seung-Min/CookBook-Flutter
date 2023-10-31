import '../../../domain/entity/ingredient_entity.dart';
import '../../../domain/entity/recipe_entity.dart';

class DetailState {
  const DetailState._({
    this.recipeList = const [],
    this.ingredient = "",
  });

  final List<RecipeEntity> recipeList;
  final String ingredient;

  const DetailState.initial() : this._();

  DetailState asRecipeLoadSuccess(List<RecipeEntity> recipeList) {
    return copyWith(recipeList: recipeList);
  }

  DetailState asIngredientLoadSuccess(String ingredient) {
    return copyWith(ingredient: ingredient);
  }

  DetailState copyWith({
    List<RecipeEntity>? recipeList,
    String? ingredient,
  }) {
    return DetailState._(
      recipeList: recipeList ?? this.recipeList,
      ingredient: ingredient ?? this.ingredient,
    );
  }
}
