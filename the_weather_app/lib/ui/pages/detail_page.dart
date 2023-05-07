import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_weather_app/domain/bloc/weather_bloc.dart';
import 'package:the_weather_app/domain/bloc/weather_state.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/city_info_widget.dart';
import '../widgets/detail_info_widget.dart';
import '../widgets/temp_info_widget.dart';
import 'login_page.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      if (state is WeatherLoadingState) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }
      if (state is WeatherLoadedState) {
        return Scaffold(
          appBar: AppBarWidget(),
          body: Column(
            children: [
              CityInfoWidget(state: state),
              TempInfoWidget(state: state),
              DetailInfoWidget(state: state)
            ],
          ),
        );
      }
      if (state is WeatherErrorState) {
        return LoginPage(error: 'City not found');
      }
      return SizedBox.shrink();
    });
  }
}
