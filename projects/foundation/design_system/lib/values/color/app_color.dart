import 'package:flutter/material.dart';

class AppColor {
  // Primary colors
  static const Color primary = Color(0xFF2196F3);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFFBBDEFB);
  static const Color onPrimaryContainer = Color(0xFF0D47A1);
  
  // Secondary colors
  static const Color secondary = Color(0xFF4CAF50);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFC8E6C9);
  static const Color onSecondaryContainer = Color(0xFF1B5E20);
  
  // Tertiary colors
  static const Color tertiary = Color(0xFFFF9800);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFFFFE0B2);
  static const Color onTertiaryContainer = Color(0xFFE65100);
  
  // Error colors
  static const Color error = Color(0xFFD32F2F);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFCDD2);
  static const Color onErrorContainer = Color(0xFFB71C1C);
  
  // Success colors
  static const Color success = Color(0xFF4CAF50);
  static const Color onSuccess = Color(0xFFFFFFFF);
  static const Color successContainer = Color(0xFFC8E6C9);
  static const Color onSuccessContainer = Color(0xFF1B5E20);
  
  // Warning colors
  static const Color warning = Color(0xFFFF9800);
  static const Color onWarning = Color(0xFFFFFFFF);
  static const Color warningContainer = Color(0xFFFFE0B2);
  static const Color onWarningContainer = Color(0xFFE65100);
  
  // Info colors
  static const Color info = Color(0xFF2196F3);
  static const Color onInfo = Color(0xFFFFFFFF);
  static const Color infoContainer = Color(0xFFBBDEFB);
  static const Color onInfoContainer = Color(0xFF0D47A1);
  
  // Surface colors (Light theme)
  static const Color surface = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF1C1B1F);
  static const Color surfaceVariant = Color(0xFFF3F3F3);
  static const Color onSurfaceVariant = Color(0xFF49454F);
  
  // Surface colors (Dark theme)
  static const Color surfaceDark = Color(0xFF121212);
  static const Color onSurfaceDark = Color(0xFFE6E1E5);
  static const Color surfaceVariantDark = Color(0xFF2C2C2C);
  static const Color onSurfaceVariantDark = Color(0xFFCAC4D0);
  
  // Background colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color onBackground = Color(0xFF1C1B1F);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color onBackgroundDark = Color(0xFFE6E1E5);
  
  // Outline colors
  static const Color outline = Color(0xFF79747E);
  static const Color outlineVariant = Color(0xFFCAC4D0);
  static const Color outlineDark = Color(0xFF938F99);
  static const Color outlineVariantDark = Color(0xFF49454F);
  
  // Text colors (Light theme)
  static const Color textPrimary = Color(0xFF1C1B1F);
  static const Color textSecondary = Color(0xFF49454F);
  static const Color textTertiary = Color(0xFF79747E);
  static const Color textDisabled = Color(0xFFCAC4D0);
  
  // Text colors (Dark theme)
  static const Color textPrimaryDark = Color(0xFFE6E1E5);
  static const Color textSecondaryDark = Color(0xFFCAC4D0);
  static const Color textTertiaryDark = Color(0xFF938F99);
  static const Color textDisabledDark = Color(0xFF49454F);
  
  // Special colors
  static const Color shadow = Color(0xFF000000);
  static const Color scrim = Color(0xFF000000);
  static const Color inverseSurface = Color(0xFF313033);
  static const Color onInverseSurface = Color(0xFFF4EFF4);
  static const Color inversePrimary = Color(0xFF90CAF9);
  
  // Transparent
  static const Color transparent = Color(0x00000000);
  
  // Gradient colors
  static const List<Color> primaryGradient = [
    Color(0xFF2196F3),
    Color(0xFF1976D2),
  ];
  
  static const List<Color> secondaryGradient = [
    Color(0xFF4CAF50),
    Color(0xFF388E3C),
  ];
  
  static const List<Color> errorGradient = [
    Color(0xFFD32F2F),
    Color(0xFFB71C1C),
  ];
  
  // Status colors
  static const Color statusFresh = Color(0xFF4CAF50);
  static const Color statusExpiringSoon = Color(0xFFFF9800);
  static const Color statusExpired = Color(0xFFD32F2F);
  static const Color statusUnknown = Color(0xFF9E9E9E);
}
