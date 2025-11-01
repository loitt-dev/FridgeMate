import 'package:flutter/material.dart';
import '../values/color/app_color.dart';
import '../values/typography/app_font_size.dart';
import '../values/typography/app_font_family.dart';
import '../values/dimen/app_dimen.dart';

/// Cấu hình dark theme tuân theo nguyên tắc thiết kế Material 3
class DarkTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: AppFontFamily.primary,
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
    tabBarTheme: TabBarThemeData(
      unselectedLabelStyle: TextStyle(
        color: AppColor.onPrimary.withValues(alpha: 0.5),
      ),
      labelStyle: TextStyle(color: AppColor.onPrimary),
    ),
  );

  /// Bảng màu dark theme dựa trên Material 3
  static ColorScheme get _colorScheme => const ColorScheme.dark(
    // Màu chính
    primary: AppColor.primary,
    onPrimary: AppColor.onPrimary,
    primaryContainer: AppColor.primaryContainer,
    onPrimaryContainer: AppColor.onPrimaryContainer,

    // Màu phụ
    secondary: AppColor.secondary,
    onSecondary: AppColor.onSecondary,
    secondaryContainer: AppColor.secondaryContainer,
    onSecondaryContainer: AppColor.onSecondaryContainer,

    // Màu bổ trợ
    tertiary: AppColor.tertiary,
    onTertiary: AppColor.onTertiary,
    tertiaryContainer: AppColor.tertiaryContainer,
    onTertiaryContainer: AppColor.onTertiaryContainer,

    // Màu lỗi
    error: AppColor.error,
    onError: AppColor.onError,
    errorContainer: AppColor.errorContainer,
    onErrorContainer: AppColor.onErrorContainer,

    // Màu bề mặt
    surface: AppColor.surfaceDark,
    onSurface: AppColor.onSurfaceDark,
    surfaceContainerHighest: AppColor.surfaceVariantDark,
    onSurfaceVariant: AppColor.onSurfaceVariantDark,

    // Màu viền
    outline: AppColor.outlineDark,
    outlineVariant: AppColor.outlineVariantDark,

    // Bóng và lớp phủ
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
    foregroundColor: AppColor.navBarIcon, // Icon màu trắng
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: AppFontSize.titleLarge,
      fontWeight: FontWeight.w600,
      color: AppColor.navBarIcon, // Chữ màu trắng
    ),
  );

  static ElevatedButtonThemeData get _elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.buttonPrimary, // Nền xám đen
          foregroundColor: AppColor.buttonPrimaryText, // Chữ màu trắng
          elevation: 0, // Thiết kế phẳng
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimen.paddingLarge,
            vertical: AppDimen.paddingMedium,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDimen.radiusLarge,
            ), // Bo tròn hơn
          ),
          minimumSize: const Size(0, AppDimen.buttonHeightLarge),
        ),
      );

  static OutlinedButtonThemeData get _outlinedButtonTheme =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColor.primary,
          side: const BorderSide(color: AppColor.outlineDark),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimen.paddingLarge,
            vertical: AppDimen.paddingMedium,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
          ),
          minimumSize: const Size(0, AppDimen.buttonHeightMedium),
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
    fillColor: AppColor.surfaceVariantDark,
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
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
      borderSide: const BorderSide(color: AppColor.error, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppDimen.paddingMedium,
      vertical: AppDimen.paddingMedium,
    ),
    labelStyle: const TextStyle(color: AppColor.onSurfaceVariantDark),
    hintStyle: const TextStyle(color: AppColor.onSurfaceVariantDark),
  );

  static CardThemeData get _cardTheme => CardThemeData(
    color: AppColor.surfaceDark,
    elevation: AppDimen.cardElevation,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimen.cardRadius),
    ),
    margin: const EdgeInsets.all(AppDimen.paddingSmall),
    shadowColor: AppColor.primary.withValues(alpha: 0.1),
    surfaceTintColor: AppColor.primary.withValues(alpha: 0.08),
  );

  static BottomNavigationBarThemeData get _bottomNavigationBarTheme =>
      const BottomNavigationBarThemeData(
        backgroundColor: AppColor.surfaceDark,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: AppColor.textSecondaryDark,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      );

  static FilledButtonThemeData get _filledButtonTheme => FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: AppColor.primary,
      foregroundColor: AppColor.onPrimary,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimen.paddingLarge,
        vertical: AppDimen.paddingMedium,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
      ),
    ),
  );

  static FloatingActionButtonThemeData get _floatingActionButtonTheme =>
      const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.onPrimary,
        elevation: 6,
        shape: CircleBorder(),
      );

  static ChipThemeData get _chipTheme => ChipThemeData(
    backgroundColor: AppColor.surfaceVariantDark,
    selectedColor: AppColor.primaryContainer,
    labelStyle: const TextStyle(
      fontSize: AppFontSize.chip,
      color: AppColor.onSurfaceDark,
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
      return AppColor.outlineDark;
    }),
    trackOutlineColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColor.primary;
      }
      return AppColor.outlineDark;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColor.surfaceDark.withValues(alpha: 0.08);
      }
      return AppColor.surfaceVariantDark;
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
    side: const BorderSide(color: AppColor.outlineDark),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimen.radiusXS),
    ),
  );

  static RadioThemeData get _radioTheme => RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColor.primary;
      }
      return AppColor.outlineDark;
    }),
  );

  static SliderThemeData get _sliderTheme => SliderThemeData(
    activeTrackColor: AppColor.primary,
    inactiveTrackColor: AppColor.surfaceVariantDark,
    thumbColor: AppColor.primary,
    overlayColor: AppColor.primaryContainer,
  );

  static ProgressIndicatorThemeData get _progressIndicatorTheme =>
      const ProgressIndicatorThemeData(
        color: AppColor.primary,
        linearTrackColor: AppColor.surfaceVariantDark,
        circularTrackColor: AppColor.surfaceVariantDark,
      );

  static DialogThemeData get _dialogTheme => DialogThemeData(
    backgroundColor: AppColor.surfaceDark,
    surfaceTintColor: AppColor.primary,
    elevation: 24,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimen.radiusLarge),
    ),
    titleTextStyle: const TextStyle(
      fontSize: AppFontSize.titleLarge,
      fontWeight: FontWeight.w600,
      color: AppColor.textPrimaryDark,
    ),
    contentTextStyle: const TextStyle(
      fontSize: AppFontSize.bodyMedium,
      color: AppColor.textPrimaryDark,
    ),
  );

  static BottomSheetThemeData get _bottomSheetTheme => BottomSheetThemeData(
    backgroundColor: AppColor.surfaceDark,
    surfaceTintColor: AppColor.primary,
    elevation: 1,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppDimen.radiusLarge),
      ),
    ),
  );

  static SnackBarThemeData get _snackBarTheme => const SnackBarThemeData(
    backgroundColor: AppColor.surfaceVariantDark,
    contentTextStyle: TextStyle(
      fontSize: AppFontSize.bodyMedium,
      color: AppColor.onSurfaceDark,
    ),
    actionTextColor: AppColor.primary,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppDimen.radiusMedium)),
    ),
  );

  static DividerThemeData get _dividerTheme => const DividerThemeData(
    color: AppColor.outlineVariantDark,
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
      color: AppColor.textPrimaryDark,
    ),
    subtitleTextStyle: TextStyle(
      fontSize: AppFontSize.bodyMedium,
      color: AppColor.textSecondaryDark,
    ),
    iconColor: AppColor.onSurfaceVariantDark,
  );
}
