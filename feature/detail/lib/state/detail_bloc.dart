import 'package:domain/repository/ingredient_repository.dart';
import 'package:domain/repository/recipe_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'detail_event.dart';
import 'detail_state.dart';

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
      emit(state.asLoading());
      await Future.delayed(const Duration(milliseconds: 1500));
      final recipeList =
          await _recipeRepository.getRecipe(recipeId: event.recipeId);
      emit(state.asRecipeLoadSuccess(recipeList));
      final ingredientList =
          await _ingredientRepository.getIngredient(recipeId: event.recipeId);
      Map<String, String> ingredientTypeList = {};
      for (var element in ingredientList) {
        if (ingredientTypeList[element.type] == null) {
          ingredientTypeList[element.type] =
              "${element.ingredient} : ${element.capacity}";
        } else {
          ingredientTypeList[element.type] =
              "${ingredientTypeList[element.type]!}, ${element.ingredient} : ${element.capacity}";
        }
      }
      emit(state.asIngredientLoadSuccess(ingredientTypeList));
    } catch (e) {
      print(e);
    }
  }
}
