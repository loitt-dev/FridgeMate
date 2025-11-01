/// FridgeMate dimension system following Material 3 design principles
///
/// This class defines all spacing, sizing, and layout dimensions
/// used throughout the FridgeMate app for consistent UI.
class AppDimen {
  // ============================================
  // SPACING SYSTEM - 8pt grid system
  // ============================================
  static const double spacingXXS = 2.0; // 0.25x base unit
  static const double spacingXS = 4.0; // 0.5x base unit
  static const double spacingS = 8.0; // 1x base unit
  static const double spacingM = 12.0; // 1.5x base unit
  static const double spacingL = 16.0; // 2x base unit
  static const double spacingXL = 20.0; // 2.5x base unit
  static const double spacingXXL = 24.0; // 3x base unit
  static const double spacingXXXL = 32.0; // 4x base unit
  static const double spacingHuge = 48.0; // 6x base unit
  static const double spacingMassive = 64.0; // 8x base unit

  // ============================================
  // PADDING SYSTEM
  // ============================================
  static const double paddingXXS = 2.0;
  static const double paddingXS = 4.0;
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 12.0;
  static const double paddingLarge = 16.0;
  static const double paddingXL = 20.0;
  static const double paddingXXL = 24.0;
  static const double paddingXXXL = 32.0;
  static const double paddingHuge = 48.0;
  static const double paddingMassive = 64.0;

  // ============================================
  // MARGIN SYSTEM
  // ============================================
  static const double marginXXS = 2.0;
  static const double marginXS = 4.0;
  static const double marginSmall = 8.0;
  static const double marginMedium = 12.0;
  static const double marginLarge = 16.0;
  static const double marginXL = 20.0;
  static const double marginXXL = 24.0;
  static const double marginXXXL = 32.0;
  static const double marginHuge = 48.0;
  static const double marginMassive = 64.0;

  // ============================================
  // BORDER RADIUS SYSTEM
  // ============================================
  static const double radiusXS = 4.0;
  static const double radiusSmall = 6.0;
  static const double radiusMedium = 8.0;
  static const double radiusLarge = 12.0;
  static const double radiusXL = 16.0;
  static const double radiusXXL = 20.0;
  static const double radiusXXXL = 24.0;
  static const double radiusCircular = 50.0;
  static const double radiusPill = 999.0; // For pill-shaped elements

  // Icon sizes
  static const double iconXS = 12.0;
  static const double iconSmall = 16.0;
  static const double iconMedium = 20.0;
  static const double iconLarge = 24.0;
  static const double iconXL = 28.0;
  static const double iconXXL = 32.0;
  static const double iconXXXL = 40.0;

  // Button heights
  static const double buttonHeightSmall = 32.0;
  static const double buttonHeightMedium = 40.0;
  static const double buttonHeightLarge = 48.0;
  static const double buttonHeightXL = 56.0;

  // Input field heights
  static const double inputHeightSmall = 32.0;
  static const double inputHeightMedium = 40.0;
  static const double inputHeightLarge = 48.0;
  static const double inputHeightXL = 56.0;

  // Card dimensions
  static const double cardElevation = 4.0; // Subtle shadow (Material 3)
  static const double cardElevationHover = 2.0;
  static const double cardElevationPressed = 0.5;
  static const double cardRadius = 12.0; // Default card radius

  // App bar
  static const double appBarHeight = 56.0;
  static const double appBarElevation = 0.0;

  // Bottom navigation
  static const double bottomNavHeight = 80.0; // Increased for better touch
  static const double bottomNavElevation = 8.0;

  // Divider
  static const double dividerThickness = 1.0;
  static const double dividerIndent = 16.0;

  // List tile
  static const double listTileHeight = 56.0;
  static const double listTileMinHeight = 48.0;

  // Avatar
  static const double avatarSmall = 24.0;
  static const double avatarMedium = 32.0;
  static const double avatarLarge = 40.0;
  static const double avatarXL = 48.0;
  static const double avatarXXL = 56.0;

  // Badge
  static const double badgeSize = 16.0;
  static const double badgeOffset = 8.0;

  // Chip
  static const double chipHeight = 32.0;
  static const double chipHeightSmall = 24.0;
  static const double chipHeightLarge = 40.0;

  // Progress indicator
  static const double progressIndicatorSize = 24.0;
  static const double progressIndicatorStrokeWidth = 2.0;

  // Floating action button
  static const double fabSize = 56.0;
  static const double fabSizeSmall = 40.0;
  static const double fabSizeLarge = 72.0;

  // Dialog
  static const double dialogMaxWidth = 400.0;
  static const double dialogMinWidth = 280.0;

  // Sheet
  static const double sheetMaxWidth = 400.0;
  static const double sheetMinWidth = 280.0;

  // ============================================
  // RESPONSIVE BREAKPOINTS
  // ============================================
  static const double breakpointMobile = 600.0;
  static const double breakpointTablet = 900.0;
  static const double breakpointDesktop = 1200.0;

  // ============================================
  // FRIDGEMATE SPECIFIC DIMENSIONS
  // ============================================

  // Dashboard card dimensions
  static const double statsCardHeight = 120.0;
  static const double expiryWarningCardMinHeight = 200.0;
  static const double recipeCardWidth = 160.0;
  static const double recipeCardHeight = 200.0;
  static const double shoppingCardMinHeight = 150.0;

  // Item card dimensions
  static const double itemCardHeight = 120.0;
  static const double itemCardWidth = 160.0;
  static const double itemCardImageHeight = 80.0;
  static const double itemCardImageWidth = 80.0;

  // Recipe card dimensions
  static const double recipeImageHeight = 120.0;
  static const double recipeCardImageWidth = 180.0;

  // Shopping list item dimensions
  static const double shoppingItemHeight = 60.0;
  static const double shoppingItemWidth = double.infinity;

  // Expiry badge dimensions
  static const double expiryBadgeSize = 24.0;
  static const double expiryBadgeRadius = 12.0;

  // Category chip dimensions
  static const double categoryChipHeight = 32.0;
  static const double categoryChipMinWidth = 80.0;

  // Search bar dimensions
  static const double searchBarHeight = 48.0;
  static const double searchBarRadius = 24.0;

  // Bottom sheet dimensions
  static const double bottomSheetMaxHeight = 0.8; // 80% of screen height
  static const double bottomSheetMinHeight = 200.0;

  // Image aspect ratios
  static const double itemImageAspectRatio = 1.0; // Square
  static const double recipeImageAspectRatio = 1.5; // 3:2 ratio
  static const double bannerImageAspectRatio = 2.5; // 5:2 ratio

  // Touch target minimum size (Material Design)
  static const double touchTargetMinSize = 48.0;

  // List item heights
  static const double listItemHeight = 56.0;
  static const double listItemHeightDense = 48.0;
  static const double listItemHeightLarge = 72.0;

  // Grid spacing
  static const double gridSpacing = 8.0;
  static const double gridSpacingLarge = 16.0;
  static const double gridSpacingSmall = 4.0;

  // Section spacing
  static const double sectionSpacing = 24.0;
  static const double sectionSpacingLarge = 32.0;
  static const double sectionSpacingSmall = 16.0;
}
