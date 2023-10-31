import 'package:cookbook/data/remote/datasource/food_remote_source.dart';
import 'package:cookbook/data/remote/util/network.dart';
import 'package:cookbook/presentation/food/food_screen.dart';
import 'package:cookbook/presentation/food/state/food_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/repository/food_repository.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<NetworkManager>(
          create: (context) => NetworkManager(),
        ),
        RepositoryProvider<FoodRemoteSource>(
          create: (context) => FoodRemoteSource(context.read<NetworkManager>()),
        ),
        RepositoryProvider<FoodRepository>(
          create: (context) => FoodRepository(context.read<FoodRemoteSource>()),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<FoodBloc>(
            create: (context) => FoodBloc(context.read<FoodRepository>()),
          )
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: FoodScreen());
  }
}
