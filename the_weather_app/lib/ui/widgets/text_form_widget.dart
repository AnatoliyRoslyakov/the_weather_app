import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 30,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Поиск',
          labelStyle: TextStyle(color: AppColors.defaultColor2),
          hintText: 'Москва',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.defaultColor2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.defaultColor2))),
    );
  }
}
