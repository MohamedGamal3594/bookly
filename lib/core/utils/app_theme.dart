import 'package:bookly/core/utils/app_assests.dart';
import 'package:bookly/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final _displaySmall = TextStyle(
    fontFamily: AppFonts.splashLogoFont,
    fontSize: 48,
  );
  static final _theme = ThemeData();
  static final lightTheme = _theme.copyWith(
    textTheme: TextTheme(
      displaySmall: _displaySmall.copyWith(
        color: AppColors.darkThemeBackground,
      ),
    ),
  );
  static final darkTheme = _theme.copyWith(
    scaffoldBackgroundColor: AppColors.darkThemeBackground,
    textTheme: TextTheme(
      displaySmall: _displaySmall.copyWith(
        color: AppColors.lightThemeBackground,
      ),
    ),
  );
}
