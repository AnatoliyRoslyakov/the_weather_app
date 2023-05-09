import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_weather_app/domain/bloc_api/weather_event.dart';
import 'package:the_weather_app/domain/bloc_api/weather_state.dart';
import 'package:the_weather_app/models/weather_model.dart';
import 'package:the_weather_app/services/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherLoadEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  final Connectivity connectivity;
  WeatherBloc({required this.connectivity, required this.weatherRepository})
      // Первоначальное состояние
      : super(WeatherEmptyState()) {
    on<WeatherLoadEvent>((event, emit) async {
      emit(WeatherLoadingState(cityName: event.cityName));
      if ((await connectivity.checkConnectivity()) == ConnectivityResult.none) {
        emit(WeatherErrorState(text: 'No internet connection'));
        return;
      }

      try {
        // Загрузка данных о погоде из репозитория
        final List<WeatherModel> loadedWeatherList =
            await weatherRepository.getWeather(cityName: event.cityName);
        emit(WeatherLoadedState(loadedWeather: loadedWeatherList));
      } catch (_) {
        emit(WeatherErrorState(text: 'City not found'));
      }
    });
  }
}
