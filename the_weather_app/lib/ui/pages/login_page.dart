import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:the_weather_app/domain/bloc_api/weather_bloc.dart';
import 'package:the_weather_app/domain/bloc_api/weather_event.dart';
import 'package:the_weather_app/domain/bloc_api/weather_state.dart';
import 'package:the_weather_app/ui/theme/app_button.dart';
import 'package:the_weather_app/ui/theme/app_text.dart';
import '../theme/app_colors.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.error, this.internet = true});
  final String error;
  final bool internet;
  TextEditingController textController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _validateName(String? value) {
    // Проверяем, что значение не пустое
    if (value == null || value.isEmpty) {
      return 'Please enter the name of the city';
    }

    // Проверяем, что значение содержит только буквы
    final RegExp regex = RegExp(r"^[-' .a-zA-Zа-яА-Я]+$");
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid name';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocListener<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state is WeatherErrorState) {
          final snackBar = SnackBar(
            content: Text(state.text),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          return;
        }
        if (state is WeatherLoadedState) {
          context.go('/detail', extra: state.loadedWeather.first);
        }
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Weather App',
                      style: TextStyle(
                          color: AppColors.defaultColor3,
                          fontWeight: FontWeight.w100,
                          fontSize: 60),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: textController,
                      validator: _validateName,
                      maxLength: 40,
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter
                      ],
                      decoration: const InputDecoration(
                          labelText: 'Search',
                          labelStyle: TextStyle(color: AppColors.defaultColor2),
                          hintText: 'Moscow',
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: AppColors.defaultColor2)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: AppColors.defaultColor4)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: AppColors.defaultColor3))),
                    ),
                    BlocBuilder<WeatherBloc, WeatherState>(
                        builder: (context, state) {
                      return AppButton(
                          child: state is WeatherEmptyState
                              ? const AppText(text: 'GO', size: 15)
                              : state is WeatherLoadingState
                                  ? const SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: CircularProgressIndicator())
                                  : const AppText(text: 'GO', size: 15),
                          func: () {
                            if (state is WeatherLoadingState) return;
                            if (_formKey.currentState!.validate()) {
                              weatherBloc.add(WeatherLoadEvent(
                                  cityName: textController.text));
                            }
                          });
                    }),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
