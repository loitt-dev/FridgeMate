import 'package:flutter/material.dart';

class AppSnackbar {
  static void show({
    required BuildContext context,
    required String message,
    AppSnackbarType type = AppSnackbarType.info,
    Duration duration = const Duration(seconds: 4),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: _getBackgroundColor(
          Theme.of(context).colorScheme,
          type,
        ),
        duration: duration,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static Color _getBackgroundColor(
    ColorScheme colorScheme,
    AppSnackbarType type,
  ) {
    switch (type) {
      case AppSnackbarType.success:
        return Colors.green;
      case AppSnackbarType.error:
        return colorScheme.error;
      case AppSnackbarType.warning:
        return Colors.orange;
      case AppSnackbarType.info:
        return colorScheme.surface;
    }
  }
}

enum AppSnackbarType { success, error, warning, info }
