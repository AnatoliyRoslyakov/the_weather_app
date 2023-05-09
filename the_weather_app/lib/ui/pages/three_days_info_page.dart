import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_weather_app/ui/theme/app_text.dart';
import 'package:the_weather_app/ui/widgets/app_bar_widget.dart';

import '../../constant/format_date_time.dart';
import '../../constant/format_detail_item.dart';
import '../../models/weather_model.dart';
import '../theme/app_colors.dart';

class ThreeDaysInfoPage extends StatelessWidget {
  const ThreeDaysInfoPage({super.key, required this.model});

  final WeatherModel model;

  @override
  Widget build(BuildContext context) {
    // список списков на  3 дня (считая с завтрашнего дня)
    var list = List.generate(3, (index) => model.list![index + 1]);
    // список температур на 3 дня
    var tempList = List.generate(3, (index) => list[index].temp!.day!);
    // список индексов сортированного списка температур
    List<int> sortedIndices =
        List<int>.generate(tempList.length, (index) => index)
          ..sort((a, b) => tempList[a].compareTo(tempList[b]));
    // сортированный список списков по температуре от меньшей к большей
    List sortedListList = sortedIndices.map((index) => list[index]).toList();

    return Scaffold(
      appBar: AppBarWidget(
        threeDays: true,
        model: model,
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.defaultColor33)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 230),
                        child: AppText(
                          text: FormatDateTime.getFormatDate(
                              DateTime.fromMillisecondsSinceEpoch(
                                  sortedListList[index].dt! * 1000)),
                          size: 15,
                        ),
                      ),
                      const SizedBox(height: 10),
                      AppText(
                        text:
                            '${sortedListList[index].temp!.day!.toStringAsFixed(0)} °C',
                        size: 40,
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FormatDetailItem.getItem(
                              // ignore: deprecated_member_use
                              FontAwesomeIcons.thermometerThreeQuarters,
                              (sortedListList[index].pressure.round() *
                                      0.750062)
                                  .toInt(),
                              'mm Hg'),
                          FormatDetailItem.getItem(FontAwesomeIcons.cloudRain,
                              sortedListList[index].humidity, '%'),
                          FormatDetailItem.getItem(FontAwesomeIcons.wind,
                              sortedListList[index].speed.toInt(), 'm/s')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
