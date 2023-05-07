// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      cod: json['cod'] as String?,
      message: json['message'] as num?,
      cnt: json['cnt'] as int?,
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => WeatherList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'city': instance.city,
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: json['id'] as int?,
      name: json['name'] as String?,
      coord: json['coord'] == null
          ? null
          : Coord.fromJson(json['coord'] as Map<String, dynamic>),
      country: json['country'] as String?,
      population: json['population'] as int?,
      timezone: json['timezone'] as int?,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coord': instance.coord,
      'country': instance.country,
      'population': instance.population,
      'timezone': instance.timezone,
    };

Coord _$CoordFromJson(Map<String, dynamic> json) => Coord(
      lon: (json['lon'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordToJson(Coord instance) => <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };

WeatherList _$WeatherListFromJson(Map<String, dynamic> json) => WeatherList(
      dt: json['dt'] as int?,
      sunrise: json['sunrise'] as int?,
      sunset: json['sunset'] as int?,
      temp: json['temp'] == null
          ? null
          : Temp.fromJson(json['temp'] as Map<String, dynamic>),
      feelsLike: json['feelsLike'] == null
          ? null
          : FeelsLike.fromJson(json['feelsLike'] as Map<String, dynamic>),
      pressure: json['pressure'] as int?,
      humidity: json['humidity'] as int?,
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      speed: json['speed'] as num?,
      deg: json['deg'] as int?,
      gust: json['gust'] as num?,
      clouds: json['clouds'] as int?,
      pop: json['pop'] as num?,
      rain: json['rain'] as num?,
    );

Map<String, dynamic> _$WeatherListToJson(WeatherList instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'temp': instance.temp,
      'feelsLike': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'weather': instance.weather,
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
      'clouds': instance.clouds,
      'pop': instance.pop,
      'rain': instance.rain,
    };

Temp _$TempFromJson(Map<String, dynamic> json) => Temp(
      day: json['day'] as num?,
      min: json['min'] as num?,
      max: json['max'] as num?,
      night: json['night'] as num?,
      eve: json['eve'] as num?,
      morn: json['morn'] as num?,
    );

Map<String, dynamic> _$TempToJson(Temp instance) => <String, dynamic>{
      'day': instance.day,
      'min': instance.min,
      'max': instance.max,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };

FeelsLike _$FeelsLikeFromJson(Map<String, dynamic> json) => FeelsLike(
      day: json['day'] as num?,
      night: json['night'] as num?,
      eve: json['eve'] as num?,
      morn: json['morn'] as num?,
    );

Map<String, dynamic> _$FeelsLikeToJson(FeelsLike instance) => <String, dynamic>{
      'day': instance.day,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      id: json['id'] as int?,
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
