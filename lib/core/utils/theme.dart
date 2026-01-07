import 'package:bookly/core/utils/fonts.dart';
import 'package:bookly/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final _textTheme = TextTheme(
    displayLarge: TextStyle(fontFamily: AppFonts.logoFont),
    titleLarge: TextStyle(fontFamily: AppFonts.logoFont, fontSize: 32),
    bodyLarge: TextStyle(fontWeight: .bold, fontSize: 24),
  );
  static final _iconTheme = IconThemeData(size: 32);

  static final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryDark,
      primary: AppColors.primaryDark,
      surface: AppColors.primaryLight,
      onSurface: AppColors.primaryDark,
    ),
    textTheme: _textTheme,
    appBarTheme: AppBarTheme(
      iconTheme: _iconTheme.copyWith(color: AppColors.primaryDark),
    ),
    iconTheme: _iconTheme.copyWith(color: AppColors.primaryDark),
  );
  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: .dark,
      seedColor: AppColors.primaryLight,
      primary: AppColors.primaryLight,
      surface: AppColors.primaryDark,
      onSurface: AppColors.primaryLight,
    ),
    textTheme: _textTheme,
    appBarTheme: AppBarTheme(
      iconTheme: _iconTheme.copyWith(color: AppColors.primaryLight),
    ),
    iconTheme: _iconTheme.copyWith(color: AppColors.primaryLight),
  );
}
