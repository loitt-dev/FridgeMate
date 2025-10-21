import 'package:flutter/material.dart';
import 'light_theme.dart';
import 'dark_theme.dart';

class AppTheme {
  static ThemeData get lightTheme => LightTheme.theme;
  static ThemeData get darkTheme => DarkTheme.theme;
  
  static ThemeData getTheme({required bool isDark}) {
    return isDark ? darkTheme : lightTheme;
  }
}
