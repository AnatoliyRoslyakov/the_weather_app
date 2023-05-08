import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// состояние взял из ConnectivityResult (удобно)
class ConnectivityCubit extends Cubit<ConnectivityResult> {
  final Connectivity _connectivity;
  // StreamSubscription, чтобы в случае закрытия блока закрыть подписку
  late final StreamSubscription _connectivityStream;
  // в конструкторе задаем первоначальное состояние (без интернета)
  // и в локальную переменную _connectivity передаем полученное значение
  ConnectivityCubit({
    required Connectivity connectivity,
  })  : _connectivity = connectivity,
        super(ConnectivityResult.none) {
    // прослушиваем состояние изменения с помощью метода onConnectivityChanged
    _connectivityStream =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult res) {
      emit(res);
    });
  }

  @override
  Future<void> close() {
    // закрываем подписку
    _connectivityStream.cancel();
    return super.close();
  }
}
