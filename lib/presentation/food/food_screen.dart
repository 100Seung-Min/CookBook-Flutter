import 'package:cookbook/core/util/constant.dart';
import 'package:cookbook/presentation/food/state/food_bloc.dart';
import 'package:cookbook/presentation/food/state/food_event.dart';
import 'package:cookbook/presentation/food/state/food_state.dart';
import 'package:cookbook/presentation/food/widget/filter_bottom_sheet.dart';
import 'package:cookbook/presentation/food/widget/food_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/food_entity.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  FoodBloc get foodBloc => context.read<FoodBloc>();
  final ScrollController _scrollController = ScrollController();
  RangeValues calorieValue = RangeValues(0, calorieMax);
  RangeValues timeValue = RangeValues(0, timeMax);
  String level = "";
  bool isFavorite = false;
  List<FoodEntity> foodList = const [];

  @override
  void initState() {
    super.initState();
    foodBloc.add(FoodLoadStarted());
    foodBloc.add(FavoriteFoodLoadStarted());
    _scrollController.addListener(() {
      if (_scrollController.offset ==
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        foodBloc.add(FoodLoadMoreStarted());
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<FoodEntity> filterFoodList(List<FoodEntity> foodList) =>
      foodList.where((element) {
        int calorie = int.tryParse(element.calorie.replaceAll("Kcal", "")) ?? 0;
        int time = int.tryParse(element.cookingTime.replaceAll("분", "")) ?? 0;
        bool selectLevel = level.isEmpty ? true : element.level == level;
        return selectLevel &&
            calorie <= calorieValue.end &&
            calorie >= calorieValue.start &&
            time <= timeValue.end &&
            time >= timeValue.start;
      }).toList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(builder: (context, state) {
      foodList =
          isFavorite ? state.favoriteFoodList : filterFoodList(state.foodList);
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      foodBloc.add(FavoriteFoodLoadStarted());
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: isFavorite ? Colors.blue : Colors.grey[500],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text(
                            "즐겨찾기",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                                builder: (context, bottomSheetState) {
                              return FilterBottomSheet(
                                calorieValue: calorieValue,
                                timeValue: timeValue,
                                levelValue: level,
                                state: bottomSheetState,
                                onChangeCalorie: (calorieValue) {
                                  this.calorieValue = calorieValue;
                                  setState(() {
                                    foodList = filterFoodList(state.foodList);
                                  });
                                },
                                onChangeTime: (timeValue) {
                                  this.timeValue = timeValue;
                                  setState(() {
                                    foodList = filterFoodList(state.foodList);
                                  });
                                },
                                onChangeLevel: (level) {
                                  this.level = level;
                                  setState(() {
                                    foodList = filterFoodList(state.foodList);
                                  });
                                },
                              );
                            });
                          });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[500],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.tune,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text(
                            "필터",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 14),
                child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    controller: _scrollController,
                    itemCount: foodList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.4,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16),
                    itemBuilder: (context, index) {
                      final foodItem = foodList[index];
                      return StatefulBuilder(builder: (context, foodItemState) {
                        return FoodItem(
                          foodItem: foodItem,
                          isFavorite: state.favoriteFoodList.contains(foodItem),
                          onFavorite: () {
                            if (state.favoriteFoodList.contains(foodItem)) {
                              foodBloc
                                  .add(FavoriteFoodRemove(foodItem.recipeId));
                            } else {
                              foodBloc.add(FavoriteFoodAdd(foodItem));
                            }
                          },
                          state: foodItemState,
                        );
                      });
                    }),
              ),
            ),
          ],
        ),
      );
    });
  }
}
