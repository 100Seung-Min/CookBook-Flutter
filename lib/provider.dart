import 'package:data/di/data_provider.dart';
import 'package:detail/detail_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/food_provider.dart';
import 'app.dart';

final provider = MultiRepositoryProvider(
  providers: _repoProvider,
  child: MultiBlocProvider(
    providers: _blocProvider,
    child: const CookBookApp(),
  ),
);

final _repoProvider = [
  ...dataProvider,
  ...repositoryProvider,
];

final _blocProvider = [
  foodProvider,
  detailProvider,
];
