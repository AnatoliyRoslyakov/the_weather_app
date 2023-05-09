import 'package:flutter/material.dart';
import 'package:the_weather_app/models/weather_model.dart';
import 'package:the_weather_app/ui/theme/app_text.dart';

import '../../constant/format_date_time.dart';

class CityInfoWidget extends StatelessWidget {
  const CityInfoWidget({super.key, required this.model});
  final WeatherModel model;

  @override
  Widget build(BuildContext context) {
    var city = model.city?.name;
    var country = model.city?.country;
    var time = model.list?.first.dt;
    var dateTime = time == null
        ? DateTime.now()
        : DateTime.fromMillisecondsSinceEpoch(time * 1000);
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
