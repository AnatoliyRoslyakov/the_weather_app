import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

//Для методов "fromJson", "toJson" использовал пакет json_serializable
@JsonSerializable()
class WeatherModel {
  City? city;
  String? cod;
  num? message;
  int? cnt;
  List<WeatherList>? list;

  WeatherModel({this.city, this.cod, this.message, this.cnt, this.list});

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;

  City(
      {this.id,
      this.name,
      this.coord,
      this.country,
      this.population,
      this.timezone});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

  Map<String, dynamic> toJson() => _$CoordToJson(this);
}

@JsonSerializable()
class WeatherList {
  int? dt;
  int? sunrise;
  int? sunset;
  Temp? temp;
  FeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  List<Weather>? weather;
  num? speed;
  int? deg;
  num? gust;
  int? clouds;
  num? pop;
  num? rain;

  WeatherList(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.weather,
      this.speed,
      this.deg,
      this.gust,
      this.clouds,
      this.pop,
      this.rain});

  factory WeatherList.fromJson(Map<String, dynamic> json) =>
      _$WeatherListFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherListToJson(this);
}

@JsonSerializable()
class Temp {
  num? day;
  num? min;
  num? max;
  num? night;
  num? eve;
  num? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);

  Map<String, dynamic> toJson() => _$TempToJson(this);
}

@JsonSerializable()
class FeelsLike {
  num? day;
  num? night;
  num? eve;
  num? morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  factory FeelsLike.fromJson(Map<String, dynamic> json) =>
      _$FeelsLikeFromJson(json);

  Map<String, dynamic> toJson() => _$FeelsLikeToJson(this);
}

@JsonSerializable()
class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
