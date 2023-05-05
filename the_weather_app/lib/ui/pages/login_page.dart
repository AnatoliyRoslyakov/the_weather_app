import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_weather_app/ui/theme/app_button.dart';
import '../widgets/text_form_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextFormWidget(),
            AppButton(
                text: 'Вход',
                func: () {
                  context.go('/detail');
                })
          ]),
        ),
      ),
    );
  }
}
