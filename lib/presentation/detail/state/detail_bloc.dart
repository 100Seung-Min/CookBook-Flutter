import 'package:cookbook/domain/repository/ingredient_repository.dart';
import 'package:cookbook/domain/repository/recipe_repository.dart';
import 'package:cookbook/presentation/detail/state/detail_event.dart';
import 'package:cookbook/presentation/detail/state/detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc(this._recipeRepository, this._ingredientRepository)
      : super(const DetailState.initial()) {
    on<RecipeLoadStarted>(
      _onLoadStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
  }

  final RecipeRepository _recipeRepository;
  final IngredientRepository _ingredientRepository;

  void _onLoadStarted(
      RecipeLoadStarted event, Emitter<DetailState> emit) async {
    try {
      final recipeList =
          await _recipeRepository.getRecipe(recipeId: event.recipeId);
      emit(state.asRecipeLoadSuccess(recipeList));
      final ingredientList =
          await _ingredientRepository.getIngredient(recipeId: event.recipeId);
      String ingredient = "";
      ingredientList.forEach((element) {
        ingredient += "${element.ingredient} : ${element.capacity}, ";
      });
      emit(state.asIngredientLoadSuccess(
          ingredient.substring(0, ingredient.length - 2)));
    } catch (e) {
      print(e);
    }
  }
}
