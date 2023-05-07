import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:the_weather_app/constant/format_detail_item.dart';

import '../../domain/bloc/weather_state.dart';

class DetailInfoWidget extends StatelessWidget {
  const DetailInfoWidget({super.key, required this.state});
  final WeatherLoadedState state;

  @override
  Widget build(BuildContext context) {
    var pressure = state.loadedWeather[0].list![0].pressure! * 0.750062;
    var humidity = state.loadedWeather[0].list![0].humidity!;
    var speed = state.loadedWeather[0].list![0].speed!;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          FormatDetailItem.getItem(
              FontAwesomeIcons.thermometer, pressure.round(), 'mm Hg'),
          FormatDetailItem.getItem(FontAwesomeIcons.cloudRain, humidity, '%'),
          FormatDetailItem.getItem(FontAwesomeIcons.wind, speed.toInt(), 'm/s')
        ],
      ),
    );
  }
}
