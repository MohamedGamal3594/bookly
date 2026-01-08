import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/fonts.dart';
import 'package:bookly/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final _textTheme = TextTheme(
    displayLarge: TextStyle(fontFamily: AppFonts.logoFont),
    titleLarge: TextStyle(fontFamily: AppFonts.logoFont, fontSize: 32),
    bodyLarge: TextStyle(fontWeight: .bold, fontSize: 24),
    labelLarge: TextStyle(fontFamily: AppFonts.bookTitleFont, fontSize: 24),
    labelMedium: TextStyle(fontSize: 20),
    labelSmall: TextStyle(fontSize: 16, color: AppColors.grey),
  );

  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryDark,
      primary: AppColors.primaryDark,
      surface: AppColors.primaryLight,
      onSurface: AppColors.primaryDark,
      surfaceTint: AppColors.lightTint,
      surfaceContainer: AppColors.lightTint,
    ),
    textTheme: _textTheme,
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: AppColors.primaryDark,
        iconSize: AppConstants.kIconSize,
      ),
    ),
    iconTheme: IconThemeData(
      size: AppConstants.kIconSize,
    ).copyWith(color: AppColors.primaryDark),
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: .dark,
      seedColor: AppColors.primaryLight,
      primary: AppColors.primaryLight,
      surface: AppColors.primaryDark,
      onSurface: AppColors.primaryLight,
      surfaceTint: AppColors.darkTint,
      surfaceContainer: AppColors.darkTint,
    ),
    textTheme: _textTheme,
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: AppColors.primaryLight,
        iconSize: AppConstants.kIconSize,
      ),
    ),
    iconTheme: IconThemeData(
      size: AppConstants.kIconSize,
    ).copyWith(color: AppColors.primaryLight),
  );
}
