import 'package:detail/state/detail_bloc.dart';
import 'package:domain/repository/ingredient_repository.dart';
import 'package:domain/repository/recipe_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final detailProvider = BlocProvider<DetailBloc>(
  create: (context) => DetailBloc(
      context.read<RecipeRepository>(), context.read<IngredientRepository>()),
);
