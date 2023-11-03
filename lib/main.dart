import 'package:data/local/datasource/food_local_source.dart';
import 'package:di/bloc_provider.dart';
import 'package:di/local_source_provider.dart';
import 'package:di/network_provider.dart';
import 'package:di/remote_source_provider.dart';
import 'package:di/repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/navigation/navigator.dart';

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
