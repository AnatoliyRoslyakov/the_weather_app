import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:the_weather_app/domain/bloc_api/weather_bloc.dart';
import 'package:the_weather_app/domain/cubit_connectivity/connectivity_cubit.dart';
import 'package:the_weather_app/services/weather_repository.dart';

import 'router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final GoRouter router = AppRouter().router();

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final GlobalKey _appKey = GlobalKey();
  final weatherRepository = WeatherRepository();
  final connectivity = Connectivity();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                WeatherBloc(weatherRepository: weatherRepository)),
        BlocProvider(
            create: (_) => ConnectivityCubit(connectivity: connectivity)),
      ],
      child: MaterialApp.router(
        key: _appKey,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        routerConfig: router,
      ),
    );
  }
}
