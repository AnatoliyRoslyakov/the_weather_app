// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:the_weather_app/models/weather_model.dart';

abstract class WeatherState {}

class WeatherLoadingState extends WeatherState {
  String cityName;
  WeatherLoadingState({
    required this.cityName,
  });
}

class WeatherLoadedState extends WeatherState {
  List<WeatherModel> loadedWeather;
  WeatherLoadedState({required this.loadedWeather});
}

class WeatherErrorState extends WeatherState {}
