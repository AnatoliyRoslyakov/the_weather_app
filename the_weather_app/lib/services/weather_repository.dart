import '../models/weather_model.dart';
import 'weather_api_provider.dart';

class WeatherRepository {
  final WeatherApiProvider _weatherRepository = WeatherApiProvider();
  Future<List<WeatherModel>> getWeather({required String cityName}) =>
      _weatherRepository.getWeatherCity(cityName: cityName);
}
