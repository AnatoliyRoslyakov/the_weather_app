import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_weather_app/domain/bloc_api/weather_bloc.dart';
import 'package:the_weather_app/domain/bloc_api/weather_state.dart';
import 'package:the_weather_app/domain/cubit_connectivity/connectivity_cubit.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/city_info_widget.dart';
import '../widgets/detail_info_widget.dart';
import '../widgets/temp_info_widget.dart';
import 'login_page.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // для перестройки пользовательского интерфейса используется виджет:
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      if (state is WeatherLoadingState) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }
      // проходимся по состояниям
      if (state is WeatherLoadedState) {
        return Scaffold(
          appBar: AppBarWidget(
            state: state,
          ),
          body: Column(
            children: [
              const SizedBox(height: 15),
              CityInfoWidget(state: state),
              const SizedBox(height: 15),
              TempInfoWidget(state: state),
              const SizedBox(height: 15),
              DetailInfoWidget(state: state)
            ],
          ),
        );
      }
      // состояние ошибки от апи, тут проверю состояние интернета
      if (state is WeatherErrorState) {
        return BlocBuilder<ConnectivityCubit, ConnectivityResult>(
            builder: (context, stateConn) {
          if (stateConn == ConnectivityResult.none) {
            // не хочу выходить за строницу Login поэтому со всеми ошибками
            // отправляю туда
            return LoginPage(
              error: 'No internet connection',
            );
          }

          return LoginPage(
            error: 'City not found',
          );
        });
      }
      return const SizedBox.shrink();
    });
  }
}
