import 'package:flutter/material.dart';
import 'light_theme.dart';
import 'dark_theme.dart';

/// Central theme configuration for FridgeMate design system
///
/// This class provides access to both light and dark themes
/// following Material 3 design principles.
class AppTheme {
  /// Light theme configuration
  static ThemeData get lightTheme => LightTheme.theme;

  /// Dark theme configuration
  static ThemeData get darkTheme => DarkTheme.theme;

  /// Get theme based on brightness preference
  ///
  /// [isDark] - true for dark theme, false for light theme
  static ThemeData getTheme({required bool isDark}) {
    return isDark ? darkTheme : lightTheme;
  }

  /// Get theme based on system brightness
  static ThemeData getThemeFromBrightness(Brightness brightness) {
    return brightness == Brightness.dark ? darkTheme : lightTheme;
  }

  /// Get current theme mode
  static ThemeMode getThemeMode({required bool isDark}) {
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }
}
