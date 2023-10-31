import 'package:cookbook/core/bloc_provider.dart';
import 'package:cookbook/core/network_provider.dart';
import 'package:cookbook/core/remote_source_provider.dart';
import 'package:cookbook/core/repository_provider.dart';
import 'package:cookbook/presentation/food/food_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        networkProvider,
        ...remoteSourceProvider,
        ...repositoryProvider
      ],
      child: MultiBlocProvider(
        providers: blocProvider,
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
