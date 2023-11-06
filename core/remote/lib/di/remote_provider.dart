import 'package:flutter_bloc/flutter_bloc.dart';
import '../datasource/food_remote_source.dart';
import '../datasource/food_remote_source_impl.dart';
import '../datasource/ingredient_remote_source.dart';
import '../datasource/ingredient_remote_source_impl.dart';
import '../datasource/recipe_remote_source.dart';
import '../datasource/recipe_remote_source_impl.dart';
import '../util/network.dart';

final networkProvider = RepositoryProvider<NetworkManager>(
  create: (context) => NetworkManager(),
);

final remoteSourceProvider = [
  RepositoryProvider<FoodRemoteSource>(
    create: (context) => FoodRemoteSourceImpl(context.read<NetworkManager>()),
  ),
  RepositoryProvider<RecipeRemoteSource>(
    create: (context) => RecipeRemoteSourceImpl(context.read<NetworkManager>()),
  ),
  RepositoryProvider<IngredientRemoteSource>(
    create: (context) =>
        IngredientRemoteSourceImpl(context.read<NetworkManager>()),
  )
];