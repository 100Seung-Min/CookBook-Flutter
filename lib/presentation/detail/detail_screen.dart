import 'package:cookbook/domain/entity/food_entity.dart';
import 'package:cookbook/presentation/detail/state/detail_bloc.dart';
import 'package:cookbook/presentation/detail/state/detail_event.dart';
import 'package:cookbook/presentation/detail/state/detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({required this.foodItem, super.key});

  final FoodEntity foodItem;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  DetailBloc get detailBloc => context.read<DetailBloc>();

  @override
  void initState() {
    super.initState();
    detailBloc.add(RecipeLoadStarted(recipeId: widget.foodItem.recipeId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(builder: (context, state) {
      final recipeList = state.recipeList;
      final foodItem = widget.foodItem;
      return Container(
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(foodItem.recipeName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    decoration: TextDecoration.none,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(foodItem.summary,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                )),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kcal : ${foodItem.calorie}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  "난이도 : ${foodItem.level}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text("시간 : ${foodItem.cookingTime}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ))
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text("재료",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 14,
                )),
            SizedBox(
              height: 8,
            ),
            Text(state.ingredient,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 14,
                )),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: PageView.builder(
                    itemCount: recipeList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                        child: Center(
                          child: Text(
                            "${index + 1}. ${recipeList[index].description}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Expanded(child: Container())
          ],
        ),
      );
    });
  }
}
