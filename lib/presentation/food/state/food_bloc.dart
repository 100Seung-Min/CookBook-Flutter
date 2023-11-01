import 'package:cookbook/domain/repository/food_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'food_event.dart';
import 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc(this._foodRepository) : super(const FoodState.initial()) {
    on<FoodLoadStarted>(
      _onFoodLoadStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
    on<FoodLoadMoreStarted>(
      _onFoodLoadMoreStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
    on<FavoriteFoodLoadStarted>(
      _onFavoriteFoodLoadStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
    on<FavoriteFoodAdd>(
      _onFavoriteFoodAdd,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
    on<FavoriteFoodRemove>(
      _onFavoriteFoodRemove,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
  }

  final FoodRepository _foodRepository;

  void _onFoodLoadStarted(
      FoodLoadStarted event, Emitter<FoodState> emit) async {
    try {
      final foodList =
          await _foodRepository.getFoodList(startIdx: state.startIdx);
      emit(state.asFoodLoadSuccess(foodList));
    } catch (e) {
      print(e);
    }
  }

  void _onFoodLoadMoreStarted(
      FoodLoadMoreStarted event, Emitter<FoodState> emit) async {
    try {
      final foodList =
          await _foodRepository.getFoodList(startIdx: state.startIdx);
      emit(state.asFoodLoadMoreSuccess(foodList));
    } catch (e) {
      print(e);
    }
  }

  void _onFavoriteFoodLoadStarted(
      FavoriteFoodLoadStarted event, Emitter<FoodState> emit) async {
    try {
      final favoriteFoodList = await _foodRepository.getFavoriteFoodList();
      emit(state.asFavoriteFoodLoadSuccess(favoriteFoodList));
    } catch (e) {
      print(e);
    }
  }

  void _onFavoriteFoodAdd(
      FavoriteFoodAdd event, Emitter<FoodState> emit) async {
    try {
      await _foodRepository.addFavoriteFood(event.foodEntity);
      emit(state.asFavoriteFoodAdd(event.foodEntity));
    } catch (e) {
      print(e);
    }
  }

  void _onFavoriteFoodRemove(
      FavoriteFoodRemove event, Emitter<FoodState> emit) async {
    try {
      await _foodRepository.removeFavoriteFood(event.recipeId);
      emit(state.asFavoriteFoodRemove(event.recipeId));
    } catch (e) {
      print(e);
    }
  }
}
