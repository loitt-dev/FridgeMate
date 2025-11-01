import 'package:flutter/material.dart';

/// FridgeMate color system following Material 3 design principles
///
/// This class defines all colors used throughout the FridgeMate app,
/// including both light and dark theme variants.
class AppColor {
  // ============================================
  // PRIMARY COLORS - Eco-Friendly Green
  // ============================================
  static const Color primary = Color(0xFF75A488); // Muted green from reference
  static const Color onPrimary = Color(0xFFFFFFFF); // White text on primary
  static const Color primaryContainer = Color(0xFFFFFFFF); // Marble white
  static const Color onPrimaryContainer = Color(0xFF1E1E1E); // Dark grey

  // ============================================
  // SECONDARY COLORS - Natural Dark
  // ============================================
  static const Color secondary = Color(0xFF1E1E1E); // Dark grey/black
  static const Color onSecondary = Color(0xFFFFFFFF); // White
  static const Color secondaryContainer = Color(
    0xFFF1F6F3,
  ); // Light beige-green
  static const Color onSecondaryContainer = Color(0xFF77A589); // Muted green

  // ============================================
  // TERTIARY COLORS - Soft Peach
  // ============================================
  static const Color tertiary = Color(0xFFE57373); // Soft peach
  static const Color onTertiary = Color(0xFFFFFFFF); // White
  static const Color tertiaryContainer = Color(0xFFFDE3E3); // Light peach
  static const Color onTertiaryContainer = Color(0xFFB71C1C); // Dark peach

  // ============================================
  // SEMANTIC COLORS - Status & Feedback
  // ============================================

  // Error colors - Red for expired/dangerous items
  static const Color error = Color(0xFFF44336); // Red 500
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFEBEE); // Red 50
  static const Color onErrorContainer = Color(0xFFB71C1C); // Dark red

  // Success colors - Green for fresh/healthy items
  static const Color success = Color(0xFF4CAF50); // Green 500
  static const Color onSuccess = Color(0xFFFFFFFF);
  static const Color successContainer = Color(0xFFE8F5E9); // Green 50
  static const Color onSuccessContainer = Color(0xFF1B5E20); // Dark green

  // Warning colors - Orange for expiring soon items
  static const Color warning = Color(0xFFFF9800); // Orange 500
  static const Color onWarning = Color(0xFFFFFFFF);
  static const Color warningContainer = Color(0xFFFFF3E0); // Orange 50
  static const Color onWarningContainer = Color(0xFFE65100); // Dark orange

  // Info colors - Dark grey for general information
  static const Color info = Color(0xFF1E1E1E); // Dark grey
  static const Color onInfo = Color(0xFFFFFFFF);
  static const Color infoContainer = Color(0xFFF1F6F3); // Light beige-green
  static const Color onInfoContainer = Color(0xFFFFFFFF); // White

  // ============================================
  // SURFACE COLORS - Light Theme (Enhanced)
  // ============================================
  static const Color surface = Color(
    0xFFFFFBFE,
  ); // Slightly warm white - Card surface
  static const Color onSurface = Color(
    0xFF1C1B1F,
  ); // Material 3 onSurface - Better contrast
  static const Color surfaceVariant = Color(
    0xFFE7E0EC,
  ); // Material 3 surfaceVariant
  static const Color onSurfaceVariant = Color(
    0xFF49454F,
  ); // Material 3 onSurfaceVariant

  // ============================================
  // SURFACE COLORS - Dark Theme (Enhanced)
  // ============================================
  static const Color surfaceDark = Color(0xFF141218); // Material 3 dark surface
  static const Color onSurfaceDark = Color(
    0xFFE6E0E9,
  ); // Material 3 dark onSurface
  static const Color surfaceVariantDark = Color(
    0xFF49454F,
  ); // Material 3 dark surfaceVariant
  static const Color onSurfaceVariantDark = Color(
    0xFFCAC4D0,
  ); // Material 3 dark onSurfaceVariant

  // ============================================
  // BACKGROUND COLORS - Eco-Friendly
  // ============================================
  static const Color background = Color(0xFFFFFFFF); // Marble white
  static const Color onBackground = Color(0xFF1E1E1E); // Dark grey
  static const Color backgroundDark = Color(0xFF1E1E1E); // Dark background
  static const Color onBackgroundDark = Color(0xFFFFFFFF); // White text

  // ============================================
  // OUTLINE COLORS - Natural Green
  // ============================================
  static const Color outline = Color(0xFF84AE95); // Light muted green
  static const Color outlineVariant = Color(0xFFE8F5E8); // Very light green
  static const Color outlineDark = Color(0xFF75A488); // Muted green
  static const Color outlineVariantDark = Color(0xFF2D4A3A); // Dark green

  // ============================================
  // TEXT COLORS - Eco-Friendly
  // ============================================
  static const Color textPrimary = Color(0xFF1E1E1E); // Dark grey
  static const Color textSecondary = Color(
    0xFF818181,
  ); // Secondary text from reference
  static const Color textTertiary = Color(0xFF84AE95); // Light muted green
  static const Color textDisabled = Color(0xFFCAC4D0); // Light grey

  // ============================================
  // TEXT COLORS - Dark Theme
  // ============================================
  static const Color textPrimaryDark = Color(0xFFFFFFFF); // White
  static const Color textSecondaryDark = Color(0xFFB0B0B0); // Light grey
  static const Color textTertiaryDark = Color(0xFF75A488); // Muted green
  static const Color textDisabledDark = Color(0xFF666666); // Medium grey

  // ============================================
  // SPECIAL COLORS
  // ============================================
  static const Color shadow = Color(0xFF000000);
  static const Color scrim = Color(0xFF000000);
  static const Color inverseSurface = Color(0xFF313033);
  static const Color onInverseSurface = Color(0xFFF4EFF4);
  static const Color inversePrimary = Color(0xFF90CAF9);

  // Transparent
  static const Color transparent = Color(0x00000000);

  // ============================================
  // GRADIENT COLORS
  // ============================================
  static const List<Color> primaryGradient = [
    Color(0xFF1976D2),
    Color(0xFF1565C0),
  ];

  static const List<Color> secondaryGradient = [
    Color(0xFF388E3C),
    Color(0xFF2E7D32),
  ];

  static const List<Color> errorGradient = [
    Color(0xFFD32F2F),
    Color(0xFFB71C1C),
  ];

  static const List<Color> warningGradient = [
    Color(0xFFF57C00),
    Color(0xFFEF6C00),
  ];

  // ============================================
  // FRIDGEMATE SPECIFIC STATUS COLORS
  // ============================================

  // Food/Medicine freshness status
  static const Color statusFresh = Color(0xFF4CAF50); // Green 500
  static const Color statusFreshBg = Color(0xFFE8F5E9); // Green 50
  static const Color statusFreshText = Color(0xFF1B5E20); // Dark green

  static const Color statusExpiringSoon = Color(0xFFFF9800); // Orange 500
  static const Color statusExpiringSoonBg = Color(0xFFFFF3E0); // Orange 50
  static const Color statusExpiringSoonText = Color(0xFFE65100); // Dark orange

  static const Color statusExpired = Color(0xFFF44336); // Red 500
  static const Color statusExpiredBg = Color(0xFFFFEBEE); // Red 50
  static const Color statusExpiredText = Color(0xFFB71C1C); // Dark red

  static const Color statusInfo = Color(0xFF2196F3); // Blue 500
  static const Color statusInfoBg = Color(0xFFE3F2FD); // Blue 50
  static const Color statusInfoText = Color(0xFF0D47A1); // Dark blue

  static const Color statusUnknown = Color(0xFF9E9E9E); // Gray - Unknown status

  // Category-specific colors
  static const Color categoryMeat = Color(0xFF8D6E63); // Brown for meat
  static const Color categoryVegetable = Color(
    0xFF66BB6A,
  ); // Green for vegetables
  static const Color categoryFruit = Color(0xFFFFB74D); // Orange for fruits
  static const Color categoryDairy = Color(0xFFE1F5FE); // Light blue for dairy
  static const Color categoryGrain = Color(0xFFD7CCC8); // Beige for grains
  static const Color categorySpice = Color(0xFFAB47BC); // Purple for spices
  static const Color categoryBeverage = Color(0xFF42A5F5); // Blue for beverages
  static const Color categorySnack = Color(0xFFFFCA28); // Yellow for snacks

  // Medicine-specific colors
  static const Color medicinePrescription = Color(
    0xFF1976D2,
  ); // Blue for prescription
  static const Color medicineOverTheCounter = Color(
    0xFF388E3C,
  ); // Green for OTC
  static const Color medicineVitamin = Color(0xFFFF9800); // Orange for vitamins
  static const Color medicineEmergency = Color(0xFFD32F2F); // Red for emergency

  // ============================================
  // ECO-FRIENDLY COMPONENT COLORS
  // ============================================

  // Search bar colors
  static const Color searchBarBackground = Color(0xFFF8F9FA); // Light beige
  static const Color searchBarIcon = Color(0xFF75A488); // Muted green
  static const Color searchBarText = Color(0xFF75A488); // Muted green

  // Navigation bar colors
  static const Color navBarBackground = Color(0xFF75A488); // Muted green
  static const Color navBarIcon = Color(0xFFFFFFFF); // White

  // Button colors
  static const Color buttonPrimary = Color(0xFF1E1E1E); // Dark grey/black
  static const Color buttonPrimaryText = Color(0xFFFFFFFF); // White

  // Card colors
  static const Color cardBackground = Color(0xFFFFFFFF); // Marble white
  static const Color cardShadow = Color.fromARGB(49, 0, 0, 0); // Subtle shadow

  // Icon colors
  static const Color iconPrimary = Color(0xFF75A488); // Muted green
  static const Color iconSecondary = Color(0xFF818181); // Secondary text color
  static const Color iconTertiary = Color(0xFFE57373); // Soft peach
}
