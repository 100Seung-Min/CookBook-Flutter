import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/remote/util/network.dart';

final networkProvider = RepositoryProvider<NetworkManager>(
  create: (context) => NetworkManager(),
);