import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:the_weather_app/constant/format_detail_item.dart';

import '../../models/weather_model.dart';
import '../theme/app_colors.dart';

class DetailInfoWidget extends StatelessWidget {
  const DetailInfoWidget({super.key, required this.model});
  final WeatherModel model;

  @override
  Widget build(BuildContext context) {
    var list = model.list![0];
    var pressure = list.pressure! * 0.750062;
    var humidity = list.humidity!;
    var speed = list.speed!;
    return Container(
      width: 360,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.defaultColor33)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            // ignore: deprecated_member_use
            FormatDetailItem.getItem(FontAwesomeIcons.thermometerThreeQuarters,
                pressure.round(), 'mm Hg'),
            FormatDetailItem.getItem(FontAwesomeIcons.cloudRain, humidity, '%'),
            FormatDetailItem.getItem(
                FontAwesomeIcons.wind, speed.toInt(), 'm/s')
          ],
        ),
      ),
    );
  }
}
