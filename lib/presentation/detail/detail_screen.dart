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
      return ListView.builder(
          itemCount: recipeList.length,
          itemBuilder: (context, index) {
            return Text(
              recipeList[index].description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
              ),
            );
          });
    });
  }
}
