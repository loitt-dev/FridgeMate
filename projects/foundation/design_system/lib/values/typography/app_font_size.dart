/// FridgeMate typography system following Material 3 design principles
///
/// This class defines all font sizes used throughout the FridgeMate app
/// for consistent typography and readability.
class AppFontSize {
  // ============================================
  // DISPLAY TEXT SIZES - For large headings
  // ============================================
  static const double displayLarge = 57.0; // Hero text, main titles
  static const double displayMedium = 45.0; // Section headers
  static const double displaySmall = 36.0; // Page titles

  // ============================================
  // HEADLINE SIZES - For section headers
  // ============================================
  static const double headlineLarge = 32.0; // Major section headers
  static const double headlineMedium = 28.0; // Subsection headers
  static const double headlineSmall = 24.0; // Card titles, list headers

  // ============================================
  // TITLE SIZES - For card and list titles
  // ============================================
  static const double titleLarge = 22.0; // Card titles, dialog titles
  static const double titleMedium = 16.0; // List item titles
  static const double titleSmall = 14.0; // Small card titles

  // ============================================
  // BODY TEXT SIZES - For main content
  // ============================================
  static const double bodyLarge = 16.0; // Main content text
  static const double bodyMedium = 14.0; // Secondary content
  static const double bodySmall = 12.0; // Captions, metadata

  // ============================================
  // LABEL SIZES - For form labels and buttons
  // ============================================
  static const double labelLarge = 14.0; // Button text, form labels
  static const double labelMedium = 12.0; // Small buttons, chips
  static const double labelSmall = 11.0; // Tiny labels, badges

  // ============================================
  // FRIDGEMATE SPECIFIC SIZES
  // ============================================

  // Item and recipe specific
  static const double itemName = 16.0; // Item names in cards
  static const double itemDescription = 14.0; // Item descriptions
  static const double itemMetadata = 12.0; // Expiry dates, quantities
  static const double itemPrice = 14.0; // Price information

  // Recipe specific
  static const double recipeTitle = 18.0; // Recipe card titles
  static const double recipeDescription = 14.0; // Recipe descriptions
  static const double recipeTime = 12.0; // Cooking time
  static const double recipeServings = 12.0; // Serving information

  // Shopping list specific
  static const double shoppingItem = 16.0; // Shopping list items
  static const double shoppingQuantity = 14.0; // Quantities
  static const double shoppingPrice = 14.0; // Price totals

  // Navigation and UI elements
  static const double appBar = 20.0; // App bar titles
  static const double bottomNav = 12.0; // Bottom navigation labels
  static const double tabLabel = 14.0; // Tab labels
  static const double drawerItem = 16.0; // Drawer menu items

  // Form elements
  static const double input = 16.0; // Text input fields
  static const double inputLabel = 14.0; // Form field labels
  static const double inputHint = 14.0; // Input hints
  static const double inputError = 12.0; // Error messages

  // Interactive elements
  static const double button = 14.0; // Button text
  static const double chip = 12.0; // Chip labels
  static const double badge = 10.0; // Badge text
  static const double tooltip = 12.0; // Tooltip text

  // Status and feedback
  static const double caption = 10.0; // Small captions
  static const double overline = 10.0; // Overline text
  static const double error = 12.0; // Error messages
  static const double success = 12.0; // Success messages
  static const double warning = 12.0; // Warning messages

  // Special cases
  static const double hero = 48.0; // Hero text on landing
  static const double splash = 24.0; // Splash screen text
  static const double onboarding = 18.0; // Onboarding text
}
