import 'package:cookbook/presentation/detail/state/detail_bloc.dart';
import 'package:cookbook/presentation/detail/state/detail_event.dart';
import 'package:cookbook/presentation/detail/state/detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({required this.recipeId, super.key});

  final int recipeId;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  DetailBloc get detailBloc => context.read<DetailBloc>();

  @override
  void initState() {
    super.initState();
    detailBloc.add(RecipeLoadStarted(recipeId: widget.recipeId));
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
