import 'package:domain/entity/food_entity.dart';
import '../../core/constant.dart';

class FoodState {
  const FoodState._({
    this.foodList = const [],
    this.favoriteFoodList = const [],
    this.startIdx = 1,
  });

  final List<FoodEntity> foodList;
  final List<FoodEntity> favoriteFoodList;
  final int startIdx;

  const FoodState.initial() : this._();

  FoodState asFoodLoadSuccess(List<FoodEntity> foodList) {
    return copyWith(foodList: foodList, startIdx: startIdx + pageSize + 1);
  }

  FoodState asFoodLoadMoreSuccess(List<FoodEntity> foodList) {
    this.foodList.addAll(foodList);
    return copyWith(startIdx: startIdx + pageSize + 1);
  }

  FoodState asFavoriteFoodLoadSuccess(List<FoodEntity> favoriteFoodList) {
    return copyWith(favoriteFoodList: favoriteFoodList);
  }

  FoodState asFavoriteFoodAdd(FoodEntity foodEntity) {
    favoriteFoodList.add(foodEntity);
    return copyWith();
  }

  FoodState asFavoriteFoodRemove(int recipeId) {
    return copyWith(
        favoriteFoodList: favoriteFoodList
            .where((element) => element.recipeId != recipeId)
            .toList());
  }

  FoodState copyWith({
    List<FoodEntity>? foodList,
    List<FoodEntity>? favoriteFoodList,
    int? startIdx,
  }) {
    return FoodState._(
      foodList: foodList ?? this.foodList,
      favoriteFoodList: favoriteFoodList ?? this.favoriteFoodList,
      startIdx: startIdx ?? this.startIdx,
    );
  }
}
