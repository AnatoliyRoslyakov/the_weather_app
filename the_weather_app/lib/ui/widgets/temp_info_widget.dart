import 'package:flutter/material.dart';
import 'package:the_weather_app/ui/theme/app_text.dart';

import '../../constant/url.dart';
import '../../domain/bloc/weather_state.dart';

class TempInfoWidget extends StatelessWidget {
  const TempInfoWidget({super.key, required this.state});

  final WeatherLoadedState state;

  @override
  Widget build(BuildContext context) {
    var icon = state.loadedWeather[0].list![0].weather![0].icon;
    String iconTemp = '${Url.weatherImageUrl}$icon';
    var temp = state.loadedWeather[0].list![0].temp!.day!.toStringAsFixed(0);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            iconTemp,
            scale: 0.8,
          ),
          const SizedBox(width: 20),
          Column(
            children: [AppText(text: '$temp °C', size: 60)],
          )
        ],
      ),
    );
  }
}
