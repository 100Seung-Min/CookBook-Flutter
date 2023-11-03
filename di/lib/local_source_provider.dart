import 'package:data/local/datasource/food_local_source.dart';
import 'package:data/local/datasource/food_local_source_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final localSourceProvider = [
  RepositoryProvider<FoodLocalSource>(
    create: (context) => FoodLocalSourceImpl(),
  )
];
