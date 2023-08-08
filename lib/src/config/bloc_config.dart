import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zerozilla_test/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:zerozilla_test/src/dashboard/presentation/bloc/dashboard_bloc.dart';

import '../home/presentation/bloc/home_bloc.dart';

final providerList = [
  BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
  BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
  BlocProvider<DashboardBloc>(create: (context) => DashboardBloc()),
];
