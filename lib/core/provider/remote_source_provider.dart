import 'package:cookbook/data/remote/datasource/ingredient_remote_source.dart';
import 'package:cookbook/data/remote/datasource/recipe_remote_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/remote/datasource/food_remote_source.dart';
import '../../data/remote/util/network.dart';

final remoteSourceProvider = [
  RepositoryProvider<FoodRemoteSource>(
    create: (context) => FoodRemoteSource(context.read<NetworkManager>()),
  ),
  RepositoryProvider<RecipeRemoteSource>(
    create: (context) => RecipeRemoteSource(context.read<NetworkManager>()),
  ),
  RepositoryProvider<IngredientRemoteSource>(
    create: (context) => IngredientRemoteSource(context.read<NetworkManager>()),
  )
];
