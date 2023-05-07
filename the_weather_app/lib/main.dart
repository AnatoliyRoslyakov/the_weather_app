import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:the_weather_app/domain/bloc/weather_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(weatherRepository: weatherRepository),
      child: MaterialApp.router(
        key: _appKey,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        routerConfig: router,
      ),
    );
  }
}
