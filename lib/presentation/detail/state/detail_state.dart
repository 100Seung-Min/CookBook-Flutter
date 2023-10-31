import '../../../domain/entity/recipe_entity.dart';

class DetailState {
  const DetailState._({
    this.recipeList = const [],
  });

  final List<RecipeEntity> recipeList;

  const DetailState.initial() : this._();

  DetailState asLoadSuccess(List<RecipeEntity> recipeList) {
    return copyWith(recipeList: recipeList);
  }

  DetailState copyWith({
    List<RecipeEntity>? recipeList,
  }) {
    return DetailState._(
      recipeList: recipeList ?? this.recipeList,
    );
  }
}
