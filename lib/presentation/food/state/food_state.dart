import 'package:cookbook/core/constant.dart';

import '../../../domain/entity/food_entity.dart';

class FoodState {
  const FoodState._({
    this.foodList = const [],
    this.startIdx = 1,
  });

  final List<FoodEntity> foodList;
  final int startIdx;

  const FoodState.initial() : this._();

  FoodState asLoadSuccess(List<FoodEntity> foodList) {
    return copyWith(foodList: foodList, startIdx: startIdx + pageSize + 1);
  }

  FoodState asLoadMoreSuccess(List<FoodEntity> foodList) {
    this.foodList.addAll(foodList);
    return copyWith(startIdx: startIdx + pageSize + 1);
  }

  FoodState copyWith({
    List<FoodEntity>? foodList,
    int? startIdx,
  }) {
    return FoodState._(
      foodList: foodList ?? this.foodList,
      startIdx: startIdx ?? this.startIdx,
    );
  }
}
