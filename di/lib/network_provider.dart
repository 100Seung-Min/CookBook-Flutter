import 'package:data/remote/util/network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final networkProvider = RepositoryProvider<NetworkManager>(
  create: (context) => NetworkManager(),
);