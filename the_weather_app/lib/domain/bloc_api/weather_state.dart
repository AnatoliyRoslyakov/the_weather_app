import 'package:the_weather_app/models/weather_model.dart';

abstract class WeatherState {}

// Состаяние загрузки
class WeatherLoadingState extends WeatherState {
  String cityName;
  WeatherLoadingState({
    required this.cityName,
  });
}

// Состояние при котором данные загрузились
class WeatherLoadedState extends WeatherState {
  List<WeatherModel> loadedWeather;
  WeatherLoadedState({required this.loadedWeather});
}

// Состояние ошибки при загрузке данных
class WeatherErrorState extends WeatherState {}
