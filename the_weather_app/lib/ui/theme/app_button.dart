import 'package:flutter/material.dart';

import 'app_colors.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  AppButton(
      {Key? key,
      this.backgroundColor = AppColors.defaultColor1,
      this.borderColor = AppColors.defaultColor2,
      this.overlayColor = AppColors.defaultColor3,
      required this.child,
      this.textColor = AppColors.textSelected,
      required this.func})
      : super(key: key);

  Color? backgroundColor;
  Color? overlayColor;
  Color borderColor;
  Color textColor;

  final Widget child;
  Function() func;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: func,
      child: child,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(100, 40)),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        side: MaterialStateProperty.all(
          BorderSide(
            color: borderColor,
            width: 1,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        overlayColor: MaterialStateProperty.all(overlayColor),
      ),
    );
  }
}
