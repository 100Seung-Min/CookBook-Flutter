import 'package:cookbook/core/navigation/navigator.dart';
import 'package:cookbook/core/provider/bloc_provider.dart';
import 'package:cookbook/core/provider/local_source_provider.dart';
import 'package:cookbook/core/provider/network_provider.dart';
import 'package:cookbook/core/provider/remote_source_provider.dart';
import 'package:cookbook/core/provider/repository_provider.dart';
import 'package:cookbook/data/local/datasource/food_local_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FoodLocalSource.initialize();

  runApp(
    MultiRepositoryProvider(
      providers: [
        networkProvider,
        ...localSourceProvider,
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
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.transparent,
      ),
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.onGenerateRoute,
    );
  }
}
