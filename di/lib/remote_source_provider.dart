import 'package:data/remote/datasource/food_remote_source.dart';
import 'package:data/remote/datasource/food_remote_source_impl.dart';
import 'package:data/remote/datasource/ingredient_remote_source.dart';
import 'package:data/remote/datasource/ingredient_remote_source_impl.dart';
import 'package:data/remote/datasource/recipe_remote_source.dart';
import 'package:data/remote/datasource/recipe_remote_source_impl.dart';
import 'package:data/remote/util/network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
