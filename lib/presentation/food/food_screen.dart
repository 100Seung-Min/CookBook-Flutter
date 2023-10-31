import 'dart:async';

import 'package:cookbook/presentation/food/state/food_bloc.dart';
import 'package:cookbook/presentation/food/state/food_event.dart';
import 'package:cookbook/presentation/food/state/food_state.dart';
import 'package:cookbook/presentation/food/widget/food_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  FoodBloc get foodBloc => context.read<FoodBloc>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    foodBloc.add(const FoodLoadStarted());
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(builder: (context, state) {
      final foodList = state.foodList;
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: GridView.builder(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 14),
            controller: _scrollController,
            itemCount: foodList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.25,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16),
            itemBuilder: (context, index) {
              return FoodItem(foodItem: foodList[index]);
            }),
      );
    });
  }
}
