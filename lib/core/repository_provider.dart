import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/remote/datasource/food_remote_source.dart';
import '../domain/repository/food_repository.dart';

final repositoryProvider = [
  RepositoryProvider<FoodRepository>(
    create: (context) => FoodRepository(context.read<FoodRemoteSource>()),
  )
];
