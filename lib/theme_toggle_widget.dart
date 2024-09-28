import 'package:flutter/material.dart';

class ThemeToggleWidget extends InheritedWidget {
  const ThemeToggleWidget({
    super.key,
    required super.child,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  final bool isDarkMode;
  final void Function() onThemeChanged;

  static ThemeToggleWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeToggleWidget>();
  }

  @override
  bool updateShouldNotify(ThemeToggleWidget oldWidget) {
    return oldWidget.isDarkMode != isDarkMode;
  }
}