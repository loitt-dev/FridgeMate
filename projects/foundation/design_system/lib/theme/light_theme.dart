import 'package:flutter/material.dart';
import '../values/color/app_color.dart';
import '../values/typography/app_font_size.dart';
import '../values/dimen/app_dimen.dart';

/// Light theme configuration following Material 3 design principles
class LightTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: _colorScheme,
    textTheme: _textTheme,
    appBarTheme: _appBarTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    textButtonTheme: _textButtonTheme,
    filledButtonTheme: _filledButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
    cardTheme: _cardTheme,
    bottomNavigationBarTheme: _bottomNavigationBarTheme,
    floatingActionButtonTheme: _floatingActionButtonTheme,
    chipTheme: _chipTheme,
    switchTheme: _switchTheme,
    checkboxTheme: _checkboxTheme,
    radioTheme: _radioTheme,
    sliderTheme: _sliderTheme,
    progressIndicatorTheme: _progressIndicatorTheme,
    dialogTheme: _dialogTheme,
    bottomSheetTheme: _bottomSheetTheme,
    snackBarTheme: _snackBarTheme,
    dividerTheme: _dividerTheme,
    listTileTheme: _listTileTheme,
  );

  /// Light color scheme based on Material 3
  static ColorScheme get _colorScheme => const ColorScheme.light(
    // Primary colors
    primary: AppColor.primary,
    onPrimary: AppColor.onPrimary,
    primaryContainer: AppColor.primaryContainer,
    onPrimaryContainer: AppColor.onPrimaryContainer,

    // Secondary colors
    secondary: AppColor.secondary,
    onSecondary: AppColor.onSecondary,
    secondaryContainer: AppColor.secondaryContainer,
    onSecondaryContainer: AppColor.onSecondaryContainer,

    // Tertiary colors
    tertiary: AppColor.tertiary,
    onTertiary: AppColor.onTertiary,
    tertiaryContainer: AppColor.tertiaryContainer,
    onTertiaryContainer: AppColor.onTertiaryContainer,

    // Error colors
    error: AppColor.error,
    onError: AppColor.onError,
    errorContainer: AppColor.errorContainer,
    onErrorContainer: AppColor.onErrorContainer,

    // Surface colors
    surface: AppColor.surface,
    onSurface: AppColor.onSurface,
    surfaceContainerHighest: AppColor.surfaceVariant,
    onSurfaceVariant: AppColor.onSurfaceVariant,

    // Outline colors
    outline: AppColor.outline,
    outlineVariant: AppColor.outlineVariant,

    // Shadow and scrim
    shadow: AppColor.shadow,
    scrim: AppColor.scrim,
    inverseSurface: AppColor.inverseSurface,
    onInverseSurface: AppColor.onInverseSurface,
    inversePrimary: AppColor.inversePrimary,
  );

  static TextTheme get _textTheme => const TextTheme(
    displayLarge: TextStyle(
      fontSize: AppFontSize.displayLarge,
      fontWeight: FontWeight.bold,
      color: AppColor.textPrimary,
    ),
    displayMedium: TextStyle(
      fontSize: AppFontSize.displayMedium,
      fontWeight: FontWeight.bold,
      color: AppColor.textPrimary,
    ),
    displaySmall: TextStyle(
      fontSize: AppFontSize.displaySmall,
      fontWeight: FontWeight.bold,
      color: AppColor.textPrimary,
    ),
    headlineLarge: TextStyle(
      fontSize: AppFontSize.headlineLarge,
      fontWeight: FontWeight.w600,
      color: AppColor.textPrimary,
    ),
    headlineMedium: TextStyle(
      fontSize: AppFontSize.headlineMedium,
      fontWeight: FontWeight.w600,
      color: AppColor.textPrimary,
    ),
    headlineSmall: TextStyle(
      fontSize: AppFontSize.headlineSmall,
      fontWeight: FontWeight.w600,
      color: AppColor.textPrimary,
    ),
    titleLarge: TextStyle(
      fontSize: AppFontSize.titleLarge,
      fontWeight: FontWeight.w600,
      color: AppColor.textPrimary,
    ),
    titleMedium: TextStyle(
      fontSize: AppFontSize.titleMedium,
      fontWeight: FontWeight.w500,
      color: AppColor.textPrimary,
    ),
    titleSmall: TextStyle(
      fontSize: AppFontSize.titleSmall,
      fontWeight: FontWeight.w500,
      color: AppColor.textPrimary,
    ),
    bodyLarge: TextStyle(
      fontSize: AppFontSize.bodyLarge,
      fontWeight: FontWeight.normal,
      color: AppColor.textPrimary,
    ),
    bodyMedium: TextStyle(
      fontSize: AppFontSize.bodyMedium,
      fontWeight: FontWeight.normal,
      color: AppColor.textPrimary,
    ),
    bodySmall: TextStyle(
      fontSize: AppFontSize.bodySmall,
      fontWeight: FontWeight.normal,
      color: AppColor.textSecondary, // #818181
    ),
    labelLarge: TextStyle(
      fontSize: AppFontSize.labelLarge,
      fontWeight: FontWeight.w500,
      color: AppColor.textPrimary,
    ),
    labelMedium: TextStyle(
      fontSize: AppFontSize.labelMedium,
      fontWeight: FontWeight.w500,
      color: AppColor.textPrimary,
    ),
    labelSmall: TextStyle(
      fontSize: AppFontSize.labelSmall,
      fontWeight: FontWeight.w500,
      color: AppColor.textSecondary, // #818181
    ),
  );

  static AppBarTheme get _appBarTheme => const AppBarTheme(
    backgroundColor: AppColor.navBarBackground, // Green background
    foregroundColor: AppColor.navBarIcon, // White icons
    elevation: 0, // No elevation for flat design
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: AppFontSize.titleLarge,
      fontWeight: FontWeight.w600,
      color: AppColor.navBarIcon, // White text
    ),
  );

  static ElevatedButtonThemeData get _elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.buttonPrimary, // Dark grey/black
          foregroundColor: AppColor.buttonPrimaryText, // White text
          elevation: 0, // Flat design
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimen.paddingLarge,
            vertical: AppDimen.paddingMedium,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDimen.radiusLarge,
            ), // More rounded
          ),
          minimumSize: const Size(0, AppDimen.buttonHeightLarge),
        ),
      );

  static OutlinedButtonThemeData get _outlinedButtonTheme =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColor.primary, // Muted green
          side: const BorderSide(color: AppColor.outline, width: 1.5),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimen.paddingLarge,
            vertical: AppDimen.paddingMedium,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDimen.radiusLarge,
            ), // More rounded
          ),
          minimumSize: const Size(0, AppDimen.buttonHeightLarge),
        ),
      );

  static FilledButtonThemeData get _filledButtonTheme => FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: AppColor.primary,
      foregroundColor: AppColor.onPrimary,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimen.paddingLarge,
        vertical: AppDimen.paddingMedium,
      ),
      minimumSize: const Size(0, AppDimen.buttonHeightLarge),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimen.radiusLarge),
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
      minimumSize: const Size(0, AppDimen.buttonHeightLarge),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimen.radiusLarge),
      ),
    ),
  );

  static InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
    filled: true,
    fillColor: AppColor.searchBarBackground, // Light beige
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimen.radiusPill), // Pill shape
      borderSide: BorderSide.none, // No border
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimen.radiusPill),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimen.radiusPill),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimen.radiusPill),
      borderSide: const BorderSide(color: AppColor.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimen.radiusPill),
      borderSide: const BorderSide(color: AppColor.error, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppDimen.paddingLarge,
      vertical: AppDimen.paddingLarge,
    ),
    labelStyle: const TextStyle(color: AppColor.searchBarText), // Muted green
    hintStyle: const TextStyle(color: AppColor.searchBarText), // Muted green
  );

  static CardThemeData get _cardTheme => CardThemeData(
    color: AppColor.cardBackground, // Marble white
    elevation: 0, // Flat design
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimen.radiusLarge), // More rounded
    ),
    margin: const EdgeInsets.all(AppDimen.paddingSmall),
    shadowColor: AppColor.cardShadow, // Subtle shadow
    surfaceTintColor: Colors.transparent,
  );

  static BottomNavigationBarThemeData get _bottomNavigationBarTheme =>
      const BottomNavigationBarThemeData(
        backgroundColor: AppColor.surface,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: AppColor.textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      );

  static FloatingActionButtonThemeData get _floatingActionButtonTheme =>
      const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryContainer,
        foregroundColor: AppColor.onPrimaryContainer,
        elevation: 6,
        shape: CircleBorder(),
      );

  static ChipThemeData get _chipTheme => ChipThemeData(
    backgroundColor: AppColor.surfaceVariant,
    selectedColor: AppColor.primaryContainer,
    labelStyle: const TextStyle(
      fontSize: AppFontSize.chip,
      color: AppColor.onSurface,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimen.radiusCircular),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: AppDimen.paddingSmall,
      vertical: AppDimen.paddingXS,
    ),
  );

  static SwitchThemeData get _switchTheme => SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColor.primary;
      }
      return AppColor.outline;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColor.primaryContainer;
      }
      return AppColor.surfaceVariant;
    }),
  );

  static CheckboxThemeData get _checkboxTheme => CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColor.primary;
      }
      return AppColor.transparent;
    }),
    checkColor: WidgetStateProperty.all(AppColor.onPrimary),
    side: const BorderSide(color: AppColor.outline),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimen.radiusXS),
    ),
  );

  static RadioThemeData get _radioTheme => RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColor.primary;
      }
      return AppColor.outline;
    }),
  );

  static SliderThemeData get _sliderTheme => SliderThemeData(
    activeTrackColor: AppColor.primary,
    inactiveTrackColor: AppColor.surfaceVariant,
    thumbColor: AppColor.primary,
    overlayColor: AppColor.primaryContainer,
  );

  static ProgressIndicatorThemeData get _progressIndicatorTheme =>
      const ProgressIndicatorThemeData(
        color: AppColor.primary,
        linearTrackColor: AppColor.surfaceVariant,
        circularTrackColor: AppColor.surfaceVariant,
      );

  static DialogThemeData get _dialogTheme => DialogThemeData(
    backgroundColor: AppColor.surface,
    surfaceTintColor: AppColor.primary,
    elevation: 24,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimen.radiusLarge),
    ),
    titleTextStyle: const TextStyle(
      fontSize: AppFontSize.titleLarge,
      fontWeight: FontWeight.w600,
      color: AppColor.textPrimary,
    ),
    contentTextStyle: const TextStyle(
      fontSize: AppFontSize.bodyMedium,
      color: AppColor.textPrimary,
    ),
  );

  static BottomSheetThemeData get _bottomSheetTheme => BottomSheetThemeData(
    backgroundColor: AppColor.surface,
    surfaceTintColor: AppColor.primary,
    elevation: 1,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppDimen.radiusLarge),
      ),
    ),
  );

  static SnackBarThemeData get _snackBarTheme => const SnackBarThemeData(
    backgroundColor: AppColor.surfaceVariant,
    contentTextStyle: TextStyle(
      fontSize: AppFontSize.bodyMedium,
      color: AppColor.onSurface,
    ),
    actionTextColor: AppColor.primary,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppDimen.radiusMedium)),
    ),
  );

  static DividerThemeData get _dividerTheme => const DividerThemeData(
    color: AppColor.outlineVariant,
    thickness: AppDimen.dividerThickness,
    indent: AppDimen.dividerIndent,
    endIndent: AppDimen.dividerIndent,
  );

  static ListTileThemeData get _listTileTheme => const ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(
      horizontal: AppDimen.paddingLarge,
      vertical: AppDimen.paddingSmall,
    ),
    titleTextStyle: TextStyle(
      fontSize: AppFontSize.titleMedium,
      fontWeight: FontWeight.w500,
      color: AppColor.textPrimary,
    ),
    subtitleTextStyle: TextStyle(
      fontSize: AppFontSize.bodyMedium,
      color: AppColor.textSecondary,
    ),
    iconColor: AppColor.onSurfaceVariant,
  );
}
