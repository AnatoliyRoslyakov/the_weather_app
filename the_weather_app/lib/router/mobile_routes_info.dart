import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_weather_app/ui/pages/detail_page.dart';

import '../ui/pages/login_page.dart';
import 'abstract_routes_info.dart';
import 'mobile_routes.dart';

class MobileRoutesInfo implements AbstractRoutesInfo {
  final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey();

//первоначальная страница
  @override
  String get initialRoute => MobileRoutes.login.path;
//лист навигации между страницами
  @override
  List<RouteBase> get routes => [
        GoRoute(
          path: MobileRoutes.login.path,
          name: MobileRoutes.login.name,
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
          path: MobileRoutes.detail.path,
          name: MobileRoutes.detail.name,
          builder: (context, state) => DetailPage(),
        ),
      ];
}
