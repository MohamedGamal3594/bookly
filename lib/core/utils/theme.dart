import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/fonts.dart';
import 'package:bookly/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final _textTheme = TextTheme(
    displayLarge: TextStyle(fontFamily: AppFonts.logoFont),
    titleLarge: TextStyle(fontFamily: AppFonts.logoFont, fontSize: 32),
    titleMedium: TextStyle(fontWeight: .bold, fontSize: 28),
    bodyLarge: TextStyle(
      fontWeight: .bold,
      fontFamily: AppFonts.bookTitleFont,
      fontSize: 22,
    ),
    labelLarge: TextStyle(fontWeight: .bold, fontSize: 20),
    labelMedium: TextStyle(fontSize: 18),
    labelSmall: TextStyle(fontSize: 14, color: AppColors.grey),
  );

  static final _filledButtonTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: .zero),
    ),
  );

  static final _inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.grey, width: 2),
    ),
  );

  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryDark,
      primary: AppColors.primaryDark,
      onPrimary: AppColors.primaryLight,
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
      color: AppColors.primaryDark,
    ),
    filledButtonTheme: _filledButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: .dark,
      seedColor: AppColors.primaryLight,
      primary: AppColors.primaryLight,
      onPrimary: AppColors.primaryDark,
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
      color: AppColors.primaryLight,
    ),
    filledButtonTheme: _filledButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );
}
