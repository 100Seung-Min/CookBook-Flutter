import 'package:cookbook/data/remote/datasource/ingredient_remote_source.dart';
import 'package:cookbook/data/remote/datasource/recipe_remote_source.dart';
import 'package:cookbook/domain/repository/ingredient_repository.dart';
import 'package:cookbook/domain/repository/recipe_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/remote/datasource/food_remote_source.dart';
import '../../domain/repository/food_repository.dart';

final repositoryProvider = [
  RepositoryProvider<FoodRepository>(
    create: (context) => FoodRepository(context.read<FoodRemoteSource>()),
  ),
  RepositoryProvider<RecipeRepository>(
    create: (context) => RecipeRepository(context.read<RecipeRemoteSource>()),
  ),
  RepositoryProvider<IngredientRepository>(
    create: (context) =>
        IngredientRepository(context.read<IngredientRemoteSource>()),
  )
];
