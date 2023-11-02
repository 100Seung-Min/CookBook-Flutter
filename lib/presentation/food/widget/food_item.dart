import 'package:cookbook/core/navigation/navigator.dart';
import 'package:cookbook/domain/entity/food_entity.dart';
import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({
    required this.foodItem,
    required this.isFavorite,
    required this.onFavorite,
    required this.state,
    super.key,
  });

  final FoodEntity foodItem;
  final bool isFavorite;
  final Function() onFavorite;
  final void Function(void Function()) state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            AppNavigator.push(
              Routes.detail,
              arguments: foodItem,
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      foodItem.summary,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
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
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "난이도 : ${foodItem.level}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "시간 : ${foodItem.cookingTime}",
                      style: const TextStyle(
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
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            icon: Icon(
              Icons.star,
              color: isFavorite ? Colors.yellow : Colors.white,
            ),
            onPressed: () {
              state(() {
                onFavorite();
              });
            },
          ),
        ),
      ],
    );
  }
}
