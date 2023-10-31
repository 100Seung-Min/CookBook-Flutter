import 'package:cookbook/domain/repository/recipe_repository.dart';
import 'package:cookbook/presentation/detail/state/detail_event.dart';
import 'package:cookbook/presentation/detail/state/detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc(this._recipeRepository) : super(const DetailState.initial()) {
    on<RecipeLoadStarted>(
      _onLoadStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
  }

  final RecipeRepository _recipeRepository;

  void _onLoadStarted(
      RecipeLoadStarted event, Emitter<DetailState> emit) async {
    try {
      final recipeList =
          await _recipeRepository.getRecipe(recipeId: event.recipeId);
      recipeList.forEach((element) {
        print("안녕 ${element.description}");
      });
      emit(state.asLoadSuccess(recipeList));
    } catch (e) {
      print(e);
    }
  }
}
