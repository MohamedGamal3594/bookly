import 'package:bookly/core/utils/fonts.dart';
import 'package:bookly/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.primaryLight,
    textTheme:
        TextTheme(
          displayLarge: TextStyle(fontFamily: AppFonts.logoFont),
          titleLarge: TextStyle(fontFamily: AppFonts.logoFont, fontSize: 32),
          bodyLarge: TextStyle(fontWeight: .bold, fontSize: 24),
        ).apply(
          displayColor: AppColors.primaryDark,
          bodyColor: AppColors.primaryDark,
        ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryLight,
      foregroundColor: AppColors.primaryDark,
      surfaceTintColor: AppColors.transparent,
      iconTheme: IconThemeData(size: 32, color: AppColors.primaryDark),
    ),
  );

  static final darkTheme = theme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.primaryDark,
    textTheme: theme.textTheme.apply(
      bodyColor: AppColors.primaryLight,
      displayColor: AppColors.primaryLight,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.primaryLight,
      surfaceTintColor: AppColors.transparent,
      iconTheme: IconThemeData(size: 32, color: AppColors.primaryLight),
    ),
  );
}
