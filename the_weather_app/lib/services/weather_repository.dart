import '../models/weather_model.dart';
import 'weather_api_provider.dart';

// что бы на прямую не работать с АПИ класса WeatherApiProvider()
// обернул его в репозиторий, чтобы уровень бизнес логики обращался к АПИ
// не напрямую, а через репозиторий
class WeatherRepository {
  final WeatherApiProvider _weatherRepository = WeatherApiProvider();
  Future<List<WeatherModel>> getWeather({required String cityName}) =>
      _weatherRepository.getWeatherCity(cityName: cityName);
}
