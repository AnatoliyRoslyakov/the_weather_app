import 'package:go_router/go_router.dart';

//абстрактный класс
abstract class AbstractRoutesInfo {
  // получение первоначального маршрута
  String get initialRoute;

// получение списка маршрутов
  List<RouteBase> get routes;
}
