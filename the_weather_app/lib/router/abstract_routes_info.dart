import 'package:go_router/go_router.dart';

//абстрактный класс
abstract class AbstractRoutesInfo {
  String get initialRoute;

  List<RouteBase> get routes;
}
