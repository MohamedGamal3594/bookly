import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double get safeLeftPadding => MediaQuery.paddingOf(this).left + 16;
  double get safeRightPadding => MediaQuery.paddingOf(this).right + 16;
  double get safeTopPadding => MediaQuery.paddingOf(this).top;
  double get safeBottomPadding => MediaQuery.paddingOf(this).bottom;
  TextTheme get textTheme => Theme.of(this).textTheme;
  Size get viewSize => MediaQuery.sizeOf(this);
}
