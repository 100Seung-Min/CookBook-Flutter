import 'package:data/repository/food_repository_impl.dart';
import 'package:data/repository/ingredient_repository_impl.dart';
import 'package:data/repository/recipe_repository_impl.dart';
import 'package:domain/repository/food_repository.dart';
import 'package:domain/repository/ingredient_repository.dart';
import 'package:domain/repository/recipe_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local/datasource/food_local_source.dart';
import 'package:remote/datasource/food_remote_source.dart';
import 'package:remote/datasource/ingredient_remote_source.dart';
import 'package:remote/datasource/recipe_remote_source.dart';

final repositoryProvider = [
  RepositoryProvider<FoodRepository>(
    create: (context) => FoodRepositoryImpl(
        context.read<FoodRemoteSource>(), context.read<FoodLocalSource>()),
  ),
  RepositoryProvider<RecipeRepository>(
    create: (context) =>
        RecipeRepositoryImpl(context.read<RecipeRemoteSource>()),
  ),
  RepositoryProvider<IngredientRepository>(
    create: (context) =>
        IngredientRepositoryImpl(context.read<IngredientRemoteSource>()),
  )
];
