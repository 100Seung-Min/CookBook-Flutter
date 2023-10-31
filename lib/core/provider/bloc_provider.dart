import 'package:cookbook/domain/repository/recipe_repository.dart';
import 'package:cookbook/presentation/detail/state/detail_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repository/food_repository.dart';
import '../../presentation/food/state/food_bloc.dart';

final blocProvider = [
  BlocProvider<FoodBloc>(
    create: (context) => FoodBloc(context.read<FoodRepository>()),
  ),
  BlocProvider<DetailBloc>(
    create: (context) => DetailBloc(context.read<RecipeRepository>()),
  )
];
