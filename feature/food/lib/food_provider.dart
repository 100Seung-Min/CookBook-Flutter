import 'package:domain/repository/food_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/state/food_bloc.dart';

final foodProvider = BlocProvider<FoodBloc>(
  create: (context) => FoodBloc(context.read<FoodRepository>()),
);
