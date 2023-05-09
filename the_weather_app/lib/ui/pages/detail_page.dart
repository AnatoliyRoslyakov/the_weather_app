import 'package:flutter/material.dart';

import '../../models/weather_model.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/city_info_widget.dart';
import '../widgets/detail_info_widget.dart';
import '../widgets/temp_info_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.model});
  final WeatherModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        model: model,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            CityInfoWidget(model: model),
            const SizedBox(height: 15),
            TempInfoWidget(model: model),
            const SizedBox(height: 15),
            DetailInfoWidget(model: model)
          ],
        ),
      ),
    );
  }
}
