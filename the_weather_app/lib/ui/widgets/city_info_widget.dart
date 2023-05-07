import 'package:flutter/material.dart';
import 'package:the_weather_app/ui/theme/app_text.dart';

import '../../constant/format_date_time.dart';
import '../../domain/bloc/weather_state.dart';

class CityInfoWidget extends StatelessWidget {
  const CityInfoWidget({super.key, required this.state});
  final WeatherLoadedState state;

  @override
  Widget build(BuildContext context) {
    var list = state.loadedWeather[0].list![0];
    var city = state.loadedWeather[0].city!.name;
    var country = state.loadedWeather[0].city!.country;
    var time = list.dt!;
    var dateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    return Column(children: [
      AppText(
        text: '$city, $country',
        size: 30,
      ),
      AppText(
        text: FormatDateTime.getFormatDate(dateTime),
        size: 18,
        weight: 1,
      ),
    ]);
  }
}
