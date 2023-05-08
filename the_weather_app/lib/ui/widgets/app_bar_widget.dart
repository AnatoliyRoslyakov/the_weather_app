import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/bloc_api/weather_state.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.threeDays = false,
    required this.state,
  });

  final WeatherLoadedState state;
  @override
  Size get preferredSize => const Size.fromHeight(200);
  final bool threeDays;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      shadowColor: const Color.fromARGB(0, 255, 255, 255),
      centerTitle: true,
      title: AppText(
        text: threeDays ? 'Weather 3 days' : 'Weather',
        size: 30,
        color: AppColors.defaultColor1,
      ),
      flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              image: DecorationImage(
                  image: AssetImage('lib/assets/appbar.jpg'),
                  fit: BoxFit.fill))),
      actions: [
        threeDays
            ? const SizedBox.shrink()
            : IconButton(
                onPressed: () {
                  context.go('/threeDays', extra: state);
                },
                icon: const Icon(Icons.navigate_next),
              ),
      ],
      leading: IconButton(
        onPressed: () {
          threeDays ? context.go('/detail') : context.go('/login');
        },
        icon: const Icon(Icons.navigate_before),
      ),
    );
  }
}
