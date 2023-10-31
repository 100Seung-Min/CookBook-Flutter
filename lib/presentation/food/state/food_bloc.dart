import 'package:cookbook/domain/repository/food_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'food_event.dart';
import 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc(this._foodRepository) : super(const FoodState.initial()) {
    on<FoodLoadStarted>(
      _onLoadStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
    on<FoodLoadMoreStarted>(
      _onLoadMoreStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
  }

  final FoodRepository _foodRepository;

  void _onLoadStarted(FoodLoadStarted event, Emitter<FoodState> emit) async {
    try {
      final foodList =
          await _foodRepository.getFoodList(startIdx: state.startIdx);
      emit(state.asLoadSuccess(foodList));
    } catch (e) {
      print(e);
    }
  }

  void _onLoadMoreStarted(
      FoodLoadMoreStarted event, Emitter<FoodState> emit) async {
    try {
      final foodList =
          await _foodRepository.getFoodList(startIdx: state.startIdx);
      emit(state.asLoadMoreSuccess(foodList));
    } catch (e) {
      print(e);
    }
  }
}
