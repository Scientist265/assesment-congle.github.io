import 'package:flutter/material.dart';

class ThemeState {}

extension ReadContext on BuildContext {
  ThemeState get theme {
    return ThemeState();
  }

  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get safeAreaHeight => MediaQuery.of(this).padding.top;
}
