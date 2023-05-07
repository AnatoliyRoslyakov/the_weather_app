import 'package:flutter/material.dart';
import 'package:the_weather_app/ui/theme/app_text.dart';

import '../../constant/url.dart';
import '../../domain/bloc/weather_state.dart';

class TempInfoWidget extends StatelessWidget {
  const TempInfoWidget({super.key, required this.state});

  final WeatherLoadedState state;

  @override
  Widget build(BuildContext context) {
    var list = state.loadedWeather[0].list![0];
    var icon = list.weather![0].icon;
    String iconTemp = '${Url.weatherImageUrl}$icon';
    var temp = list.temp!.day!.toStringAsFixed(0);
    var tempMax = list.temp!.max!.toStringAsFixed(0);
    var tempMin = list.temp!.min!.toStringAsFixed(0);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          iconTemp,
          scale: 0.8,
        ),
        const SizedBox(width: 20),
        Row(
          children: [
            AppText(text: '$temp °C', size: 60),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(text: 'max: $tempMax °C', size: 15),
                AppText(text: 'min: $tempMin °C', size: 15)
              ],
            )
          ],
        )
      ],
    );
  }
}
