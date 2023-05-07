// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

//конструктор имени и ссылки на страницу
enum MobileRoutes {
  threeDays,
  detail,
  login;

  static MobileRoutes? fromName(String? name) {
    return MobileRoutes.values.firstWhereOrNull(
      (MobileRoutes element) => element.name == name,
    );
  }
}

extension MobileRoutesExt on MobileRoutes {
  String get path => '/$name';
}
