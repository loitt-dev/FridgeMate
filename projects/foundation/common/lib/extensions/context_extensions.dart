import 'package:flutter/material.dart';

/// BuildContext extensions for FridgeMate
extension ContextExtensions on BuildContext {
  // ============================================
  // Theme & Styling
  // ============================================

  /// Get theme data
  ThemeData get theme => Theme.of(this);

  /// Get text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Get color scheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Get primary color
  Color get primaryColor => Theme.of(this).primaryColor;

  /// Get scaffold background color
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  /// Get card color
  Color get cardColor => Theme.of(this).cardColor;

  /// Get divider color
  Color get dividerColor => Theme.of(this).dividerColor;

  /// Get disabled color
  Color get disabledColor => Theme.of(this).disabledColor;

  /// Get hint color
  Color get hintColor => Theme.of(this).hintColor;

  /// Get error color
  Color get errorColor => Theme.of(this).colorScheme.error;

  /// Get success color (custom)
  Color get successColor => Colors.green;

  /// Get warning color (custom)
  Color get warningColor => Colors.orange;

  /// Get info color (custom)
  Color get infoColor => Colors.blue;

  // ============================================
  // MediaQuery & Screen Info
  // ============================================

  /// Get screen size
  Size get screenSize => MediaQuery.of(this).size;

  /// Get screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Get screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Get screen width percentage
  double widthPercent(double percent) => screenWidth * (percent / 100);

  /// Get screen height percentage
  double heightPercent(double percent) => screenHeight * (percent / 100);

  /// Get device pixel ratio
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  /// Get text scale factor
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;

  /// Get platform brightness
  Brightness get platformBrightness => MediaQuery.of(this).platformBrightness;

  /// Check if device is in landscape mode
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  /// Check if device is in portrait mode
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  /// Get safe area padding
  EdgeInsets get safeAreaPadding => MediaQuery.of(this).padding;

  /// Get safe area view padding
  EdgeInsets get safeAreaViewPadding => MediaQuery.of(this).viewPadding;

  /// Get keyboard height
  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;

  /// Check if keyboard is visible
  bool get isKeyboardVisible => MediaQuery.of(this).viewInsets.bottom > 0;

  // ============================================
  // Dialogs & Snackbars
  // ============================================

  /// Show snackbar
  void showSnackBar(
    String message, {
    Color? backgroundColor,
    Color? textColor,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: textColor)),
        backgroundColor: backgroundColor,
        duration: duration,
        action: action,
      ),
    );
  }

  /// Show error snackbar
  void showErrorSnackBar(String message) {
    showSnackBar(message, backgroundColor: errorColor, textColor: Colors.white);
  }

  /// Show success snackbar
  void showSuccessSnackBar(String message) {
    showSnackBar(
      message,
      backgroundColor: successColor,
      textColor: Colors.white,
    );
  }

  /// Show warning snackbar
  void showWarningSnackBar(String message) {
    showSnackBar(
      message,
      backgroundColor: warningColor,
      textColor: Colors.white,
    );
  }

  /// Show info snackbar
  void showInfoSnackBar(String message) {
    showSnackBar(message, backgroundColor: infoColor, textColor: Colors.white);
  }

  /// Show dialog
  Future<T?> showAppDialog<T>(Widget dialog) {
    return showDialog<T>(context: this, builder: (_) => dialog);
  }

  /// Show bottom sheet
  Future<T?> showAppBottomSheet<T>(Widget bottomSheet) {
    return showModalBottomSheet<T>(context: this, builder: (_) => bottomSheet);
  }

  /// Show confirmation dialog
  Future<bool?> showConfirmationDialog({
    required String title,
    required String message,
    String confirmText = 'Xác nhận',
    String cancelText = 'Hủy',
    Color? confirmColor,
  }) {
    return showAppDialog<bool>(
      AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(this, false),
            child: Text(cancelText),
          ),
          TextButton(
            onPressed: () => Navigator.pop(this, true),
            style: confirmColor != null
                ? TextButton.styleFrom(foregroundColor: confirmColor)
                : null,
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }

  // ============================================
  // Focus & Input
  // ============================================

  /// Unfocus current focus
  void unfocus() {
    FocusScope.of(this).unfocus();
  }

  /// Request focus for focus node
  void requestFocus(FocusNode focusNode) {
    FocusScope.of(this).requestFocus(focusNode);
  }

  // ============================================
  // Localization
  // ============================================

  /// Get current locale
  Locale get locale => Localizations.localeOf(this);

  /// Get current language code
  String get languageCode => locale.languageCode;

  /// Check if current locale is Vietnamese
  bool get isVietnamese => languageCode == 'vi';

  // ============================================
  // Accessibility
  // ============================================

  /// Check if accessibility is enabled
  bool get isAccessibilityEnabled => MediaQuery.of(this).accessibleNavigation;

  /// Check if animations are disabled
  bool get areAnimationsDisabled => MediaQuery.of(this).disableAnimations;

  /// Check if bold text is enabled
  bool get isBoldTextEnabled => MediaQuery.of(this).boldText;

  // ============================================
  // Utility Methods
  // ============================================

  /// Get responsive value based on screen size
  T responsive<T>({required T mobile, T? tablet, T? desktop}) {
    final width = screenWidth;

    if (width >= 1200 && desktop != null) {
      return desktop;
    } else if (width >= 768 && tablet != null) {
      return tablet;
    } else {
      return mobile;
    }
  }

  /// Check if device is tablet or larger
  bool get isTabletOrLarger => screenWidth >= 768;

  /// Check if device is desktop or larger
  bool get isDesktopOrLarger => screenWidth >= 1200;

  /// Get status bar height
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  /// Get bottom safe area height
  double get bottomSafeAreaHeight => MediaQuery.of(this).padding.bottom;

  /// Get app bar height (estimated)
  double get appBarHeight => kToolbarHeight + statusBarHeight;
}
