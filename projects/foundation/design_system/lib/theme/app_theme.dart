import 'package:flutter/material.dart';
import 'light_theme.dart';
import 'dark_theme.dart';

/// Cấu hình theme trung tâm cho design system FridgeMate
///
/// Lớp này cung cấp quyền truy cập vào cả light theme và dark theme
/// tuân theo nguyên tắc thiết kế Material 3.
class AppTheme {
  /// Cấu hình light theme
  static ThemeData get lightTheme => LightTheme.theme;

  /// Cấu hình dark theme
  static ThemeData get darkTheme => DarkTheme.theme;

  /// Lấy theme dựa trên tùy chọn độ sáng
  ///
  /// [isDark] - true cho dark theme, false cho light theme
  static ThemeData getTheme({required bool isDark}) {
    return isDark ? darkTheme : lightTheme;
  }

  /// Lấy theme dựa trên độ sáng hệ thống
  static ThemeData getThemeFromBrightness(Brightness brightness) {
    return brightness == Brightness.dark ? darkTheme : lightTheme;
  }

  /// Lấy theme mode hiện tại
  static ThemeMode getThemeMode({required bool isDark}) {
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }
}
