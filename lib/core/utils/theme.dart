import 'package:bookly/core/utils/fonts.dart';
import 'package:bookly/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.primaryLightColor,
    textTheme: TextTheme(displayLarge: TextStyle(fontFamily: AppFonts.logoFont))
        .apply(
          displayColor: AppColors.primaryDarkColor,
          bodyColor: AppColors.primaryDarkColor,
        ),
  );

  static final darkTheme = theme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.primaryDarkColor,
    textTheme: theme.textTheme.apply(
      bodyColor: AppColors.primaryLightColor,
      displayColor: AppColors.primaryLightColor,
    ),
  );
}
