import 'package:flutter/material.dart';
import 'package:the_weather_app/ui/theme/app_colors.dart';

class AppText extends StatelessWidget {
  const AppText(
      {super.key,
      required this.text,
      this.color = AppColors.defaultColor3,
      this.weight = 2,
      required this.size});

  final String text;
  final Color color;
  final int weight;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(
          color: color, fontWeight: FontWeight.values[weight], fontSize: size),
    );
  }
}
