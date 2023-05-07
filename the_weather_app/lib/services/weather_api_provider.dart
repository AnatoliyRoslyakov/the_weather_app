import 'dart:convert';
import 'dart:developer';

import 'package:the_weather_app/models/weather_model.dart';
import 'package:the_weather_app/constant/url.dart';
import 'package:http/http.dart' as http;

// get-запрос к сайту openweathermap по названию города
class WeatherApiProvider {
  Future<List<WeatherModel>> getWeatherCity({required String cityName}) async {
    var queryParameters = {
      'appId': Url.weatherID,
      'units': 'metric',
      'q': cityName,
    };

    var uri =
        Uri.https(Url.weatherBaseURL, Url.weatherForeCastPath, queryParameters);

    log('request: ${uri.toString()}');
    try {
      var respons = await http.get(uri);
      //print('respons: ${respons.body}');

      if (respons.statusCode == 200) {
        final weatherJson = json.decode(respons.body);
        return [WeatherModel.fromJson(weatherJson)];
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      //print(e);
      throw Exception('Error');
    }
  }
}
