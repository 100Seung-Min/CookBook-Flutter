import 'package:flutter_bloc/flutter_bloc.dart';
import '../datasource/food_local_source.dart';
import '../datasource/food_local_source_impl.dart';

final localSourceProvider = [
  RepositoryProvider<FoodLocalSource>(
    create: (context) => FoodLocalSourceImpl(),
  )
];
