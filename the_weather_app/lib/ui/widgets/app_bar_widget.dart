import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';
import '../theme/app_text.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });
  Size get preferredSize => const Size.fromHeight(200);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(0, 255, 255, 255),
      shadowColor: Color.fromARGB(0, 255, 255, 255),
      centerTitle: true,
      title: const AppText(
        text: 'Weather',
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
        IconButton(
          onPressed: () {
            context.go('/threeDays');
          },
          icon: const Icon(Icons.navigate_next),
        ),
      ],
      leading: IconButton(
        onPressed: () {
          context.go('/login');
        },
        icon: const Icon(Icons.navigate_before),
      ),
    );
  }
}
