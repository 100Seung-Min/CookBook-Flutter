import 'package:cookbook/data/local/datasource/food_local_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final localSourceProvider = [
  RepositoryProvider<FoodLocalSource>(
    create: (context) => FoodLocalSource(),
  )
];
