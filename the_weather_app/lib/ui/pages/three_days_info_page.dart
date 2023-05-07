import 'package:flutter/material.dart';
import 'package:the_weather_app/ui/widgets/app_bar_widget.dart';

import '../../constant/format_date_time.dart';
import '../../domain/bloc/weather_state.dart';

class ThreeDaysInfoPage extends StatelessWidget {
  const ThreeDaysInfoPage({super.key, required this.state});

  final WeatherLoadedState state;
  @override
  Widget build(BuildContext context) {
    var tempList = List.generate(
        3, (index) => state.loadedWeather[0].list![index + 1].temp!.day!);
    var dateTimeList = List.generate(
        3,
        (index) => FormatDateTime.getFormatDate(
            DateTime.fromMillisecondsSinceEpoch(
                state.loadedWeather[0].list![index + 1].dt! * 1000)));

    List<int> sortedIndices =
        List<int>.generate(tempList.length, (index) => index)
          ..sort((a, b) => tempList[a].compareTo(tempList[b]));

    List sortedList1 = sortedIndices.map((index) => tempList[index]).toList();
    List<String> sortedList2 =
        sortedIndices.map((index) => dateTimeList[index]).toList();

    return Scaffold(
      appBar: AppBarWidget(
        threeDays: true,
        state: state,
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  Text('${sortedList2[index]}'),
                  Text('${sortedList1[index]} °C'),
                ],
              ),
            );
          }),
    );
  }
}
