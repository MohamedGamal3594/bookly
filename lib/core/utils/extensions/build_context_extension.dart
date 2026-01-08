import 'package:bookly/core/utils/constants.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double get safeLeftPadding =>
      MediaQuery.paddingOf(this).left + AppConstants.kPadding;
  double get safeRightPadding =>
      MediaQuery.paddingOf(this).right + AppConstants.kPadding;
  double get safeTopPadding => MediaQuery.paddingOf(this).top;
  double get safeBottomPadding => MediaQuery.paddingOf(this).bottom;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Size get viewSize => MediaQuery.sizeOf(this);
  bool get isPhone => viewSize.width <= AppConstants.kPhoneBreakPoint;
}
