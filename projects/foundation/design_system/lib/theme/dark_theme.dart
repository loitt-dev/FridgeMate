import 'package:flutter/material.dart';
import '../values/color/app_color.dart';
import '../values/typography/app_font_size.dart';
import '../values/dimen/app_dimen.dart';

class DarkTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      brightness: Brightness.dark,
    ),
    textTheme: _textTheme,
    appBarTheme: _appBarTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    textButtonTheme: _textButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
    cardTheme: _cardTheme,
    bottomNavigationBarTheme: _bottomNavigationBarTheme,
  );

  static TextTheme get _textTheme => const TextTheme(
    displayLarge: TextStyle(
      fontSize: AppFontSize.displayLarge,
      fontWeight: FontWeight.bold,
      color: AppColor.textPrimaryDark,
    ),
    displayMedium: TextStyle(
      fontSize: AppFontSize.displayMedium,
      fontWeight: FontWeight.bold,
      color: AppColor.textPrimaryDark,
    ),
    displaySmall: TextStyle(
      fontSize: AppFontSize.displaySmall,
      fontWeight: FontWeight.bold,
      color: AppColor.textPrimaryDark,
    ),
    headlineLarge: TextStyle(
      fontSize: AppFontSize.headlineLarge,
      fontWeight: FontWeight.w600,
      color: AppColor.textPrimaryDark,
    ),
    headlineMedium: TextStyle(
      fontSize: AppFontSize.headlineMedium,
      fontWeight: FontWeight.w600,
      color: AppColor.textPrimaryDark,
    ),
    headlineSmall: TextStyle(
      fontSize: AppFontSize.headlineSmall,
      fontWeight: FontWeight.w600,
      color: AppColor.textPrimaryDark,
    ),
    titleLarge: TextStyle(
      fontSize: AppFontSize.titleLarge,
      fontWeight: FontWeight.w600,
      color: AppColor.textPrimaryDark,
    ),
    titleMedium: TextStyle(
      fontSize: AppFontSize.titleMedium,
      fontWeight: FontWeight.w500,
      color: AppColor.textPrimaryDark,
    ),
    titleSmall: TextStyle(
      fontSize: AppFontSize.titleSmall,
      fontWeight: FontWeight.w500,
      color: AppColor.textPrimaryDark,
    ),
    bodyLarge: TextStyle(
      fontSize: AppFontSize.bodyLarge,
      fontWeight: FontWeight.normal,
      color: AppColor.textPrimaryDark,
    ),
    bodyMedium: TextStyle(
      fontSize: AppFontSize.bodyMedium,
      fontWeight: FontWeight.normal,
      color: AppColor.textPrimaryDark,
    ),
    bodySmall: TextStyle(
      fontSize: AppFontSize.bodySmall,
      fontWeight: FontWeight.normal,
      color: AppColor.textSecondaryDark,
    ),
    labelLarge: TextStyle(
      fontSize: AppFontSize.labelLarge,
      fontWeight: FontWeight.w500,
      color: AppColor.textPrimaryDark,
    ),
    labelMedium: TextStyle(
      fontSize: AppFontSize.labelMedium,
      fontWeight: FontWeight.w500,
      color: AppColor.textPrimaryDark,
    ),
    labelSmall: TextStyle(
      fontSize: AppFontSize.labelSmall,
      fontWeight: FontWeight.w500,
      color: AppColor.textSecondaryDark,
    ),
  );

  static AppBarTheme get _appBarTheme => const AppBarTheme(
    backgroundColor: AppColor.surfaceDark,
    foregroundColor: AppColor.textPrimaryDark,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: AppFontSize.titleLarge,
      fontWeight: FontWeight.w600,
      color: AppColor.textPrimaryDark,
    ),
  );

  static ElevatedButtonThemeData get _elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          foregroundColor: AppColor.onPrimary,
          elevation: 2,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimen.paddingLarge,
            vertical: AppDimen.paddingMedium,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
          ),
        ),
      );

  static OutlinedButtonThemeData get _outlinedButtonTheme =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColor.primary,
          side: const BorderSide(color: AppColor.primary),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimen.paddingLarge,
            vertical: AppDimen.paddingMedium,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
          ),
        ),
      );

  static TextButtonThemeData get _textButtonTheme => TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColor.primary,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimen.paddingMedium,
        vertical: AppDimen.paddingSmall,
      ),
    ),
  );

  static InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
    filled: true,
    fillColor: AppColor.surfaceDark,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
      borderSide: const BorderSide(color: AppColor.outlineDark),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
      borderSide: const BorderSide(color: AppColor.outlineDark),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
      borderSide: const BorderSide(color: AppColor.primary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
      borderSide: const BorderSide(color: AppColor.error),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppDimen.paddingMedium,
      vertical: AppDimen.paddingMedium,
    ),
  );

  static CardThemeData get _cardTheme => CardThemeData(
    color: AppColor.surfaceDark,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
    ),
    margin: const EdgeInsets.all(AppDimen.paddingSmall),
  );

  static BottomNavigationBarThemeData get _bottomNavigationBarTheme =>
      const BottomNavigationBarThemeData(
        backgroundColor: AppColor.surfaceDark,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: AppColor.textSecondaryDark,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      );
}
