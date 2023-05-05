// coverage:ignore-file
import 'package:flutter/material.dart';

@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color white;
  final Color black;

  const AppColorScheme({
    required this.white,
    required this.black,
  });

  @override
  AppColorScheme lerp(ThemeExtension<AppColorScheme>? other, double t) {
    if (other is! AppColorScheme) {
      return this;
    }
    return AppColorScheme(
      white: Color.lerp(white, other.white, t) ?? white,
      black: Color.lerp(black, other.black, t) ?? black,
    );
  }

  @override
  AppColorScheme copyWith({
    Color? white,
    Color? black,
  }) {
    return AppColorScheme(
      white: white ?? this.white,
      black: black ?? this.black,
    );
  }
}
