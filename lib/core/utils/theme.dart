import 'package:bookly/core/utils/fonts.dart';
import 'package:bookly/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.primaryLightColor,
    textTheme:
        TextTheme(
          displayLarge: TextStyle(fontFamily: AppFonts.logoFont),
          titleLarge: TextStyle(fontFamily: AppFonts.logoFont, fontSize: 32),
        ).apply(
          displayColor: AppColors.primaryDarkColor,
          bodyColor: AppColors.primaryDarkColor,
        ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryLightColor,
      foregroundColor: AppColors.primaryDarkColor,
      iconTheme: IconThemeData(size: 32, color: AppColors.primaryDarkColor),
    ),
  );

  static final darkTheme = theme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.primaryDarkColor,
    textTheme: theme.textTheme.apply(
      bodyColor: AppColors.primaryLightColor,
      displayColor: AppColors.primaryLightColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryDarkColor,
      foregroundColor: AppColors.primaryLightColor,
      iconTheme: IconThemeData(size: 32, color: AppColors.primaryLightColor),
    ),
  );
}
