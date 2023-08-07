import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zerozilla_test/src/config/bloc_config.dart';

import 'route_manager/route_imports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRoutes = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providerList,
      child: MaterialApp.router(
        routerConfig: _appRoutes.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
