import 'package:domain/repository/food_repository.dart';
import 'package:domain/repository/ingredient_repository.dart';
import 'package:domain/repository/recipe_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/detail/state/detail_bloc.dart';
import 'package:presentation/food/state/food_bloc.dart';

final blocProvider = [
  BlocProvider<FoodBloc>(
    create: (context) => FoodBloc(context.read<FoodRepository>()),
  ),
  BlocProvider<DetailBloc>(
    create: (context) => DetailBloc(
        context.read<RecipeRepository>(), context.read<IngredientRepository>()),
  )
];
