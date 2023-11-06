import 'package:detail/state/detail_bloc.dart';
import 'package:detail/state/detail_event.dart';
import 'package:detail/state/detail_state.dart';
import 'package:domain/entity/food_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({required this.foodItem, super.key});

  final Object? foodItem;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  DetailBloc get detailBloc => context.read<DetailBloc>();

  @override
  void initState() {
    super.initState();
    detailBloc.add(
        RecipeLoadStarted(recipeId: (widget.foodItem as FoodEntity).recipeId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(builder: (context, state) {
      final recipeList = state.recipeList;
      final foodItem = widget.foodItem as FoodEntity;
      final ingredientList = state.ingredientList;
      if (state.isLoading) {
        return Center(
          child: Lottie.asset(
            'image/loadingLottie.json',
            width: 300,
            height: 300,
            fit: BoxFit.fill,
          ),
        );
      }
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(foodItem.recipeName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    decoration: TextDecoration.none,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(foodItem.summary,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                )),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kcal : ${foodItem.calorie}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  "난이도 : ${foodItem.level}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text("시간 : ${foodItem.cookingTime}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text("재료",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 14,
                )),
            const SizedBox(
              height: 14,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ingredientList.length,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ingredientList.keys.toList()[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            ingredientList.values.toList()[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 32),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: PageView.builder(
                    itemCount: recipeList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${index + 1}. ${recipeList[index].description}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              if (recipeList[index].tip.isNotEmpty)
                                Text(
                                  "Tip. ${recipeList[index].tip}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      );
    });
  }
}
