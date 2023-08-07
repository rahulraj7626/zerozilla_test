import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/presentation/bloc/home_bloc.dart';

final providerList = [
  BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
];
