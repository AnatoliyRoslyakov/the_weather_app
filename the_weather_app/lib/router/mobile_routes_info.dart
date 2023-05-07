import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_weather_app/ui/pages/detail_page.dart';
import 'package:the_weather_app/ui/pages/three_days_info_page.dart';

import '../ui/pages/login_page.dart';
import 'abstract_routes_info.dart';
import 'mobile_routes.dart';

class MobileRoutesInfo implements AbstractRoutesInfo {
//первоначальная страница
  @override
  String get initialRoute => MobileRoutes.login.path;
//лист навигации между страницами
  @override
  List<RouteBase> get routes => [
        GoRoute(
          path: MobileRoutes.login.path,
          name: MobileRoutes.login.name,
          builder: (context, state) => LoginPage(
            error: '',
          ),
        ),
        GoRoute(
          path: MobileRoutes.detail.path,
          name: MobileRoutes.detail.name,
          builder: (context, state) => DetailPage(),
        ),
        GoRoute(
          path: MobileRoutes.threeDays.path,
          name: MobileRoutes.threeDays.name,
          builder: (context, state) => ThreeDaysInfoPage(),
        ),
      ];
}
