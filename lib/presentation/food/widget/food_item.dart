import 'package:cookbook/core/navigation/argument.dart';
import 'package:cookbook/core/navigation/navigator.dart';
import 'package:cookbook/domain/entity/food_entity.dart';
import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({
    required this.foodItem,
    super.key,
  });

  final FoodEntity foodItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(Routes.detail,
            arguments: DetailScreenArgument(recipeId: foodItem.recipeId));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  foodItem.recipeName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  foodItem.summary,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kcal : ${foodItem.calorie}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "난이도 : ${foodItem.level}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "시간 : ${foodItem.cookingTime}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
