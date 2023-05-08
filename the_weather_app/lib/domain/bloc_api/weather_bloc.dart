import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_weather_app/domain/bloc_api/weather_event.dart';
import 'package:the_weather_app/domain/bloc_api/weather_state.dart';
import 'package:the_weather_app/models/weather_model.dart';
import 'package:the_weather_app/services/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherLoadEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({required this.weatherRepository})
      : super(WeatherLoadingState(cityName: '')) {
    on<WeatherLoadEvent>((event, emit) async {
      emit(WeatherLoadingState(cityName: event.cityName));

      try {
        final List<WeatherModel> loadedWeatherList =
            await weatherRepository.getWeather(cityName: event.cityName);
        emit(WeatherLoadedState(loadedWeather: loadedWeatherList));
      } catch (_) {
        emit(WeatherErrorState());
      }
    });
  }
}
