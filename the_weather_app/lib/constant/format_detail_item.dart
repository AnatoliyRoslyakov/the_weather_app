import 'package:flutter/material.dart';
import 'package:the_weather_app/ui/theme/app_colors.dart';
import 'package:the_weather_app/ui/theme/app_text.dart';

class FormatDetailItem {
  static getItem(IconData iconData, int value, String metric) {
    return Column(
      children: [
        Icon(
          iconData,
          color: AppColors.defaultColor3,
          size: 25,
        ),
        const SizedBox(
          height: 10,
        ),
        AppText(
          text: '$value',
          size: 20,
          color: AppColors.defaultColor3,
        ),
        const SizedBox(
          height: 10,
        ),
        AppText(
          text: metric,
          size: 15,
          color: AppColors.defaultColor3,
        )
      ],
    );
  }
}
