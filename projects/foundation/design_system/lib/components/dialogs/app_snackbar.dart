import 'package:design_system/values/color/app_color.dart';
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
        content: Text(
          message,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: _getTextColor(type)),
        ),
        backgroundColor: _getBackgroundColor(
          Theme.of(context).colorScheme,
          type,
        ),
        duration: duration,
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }

  static Color _getBackgroundColor(
    ColorScheme colorScheme,
    AppSnackbarType type,
  ) {
    switch (type) {
      case AppSnackbarType.success:
        return AppColor.success;
      case AppSnackbarType.error:
        return AppColor.error;
      case AppSnackbarType.warning:
        return AppColor.warning;
      case AppSnackbarType.info:
        return AppColor.info;
    }
  }

  static Color _getTextColor(AppSnackbarType type) {
    switch (type) {
      case AppSnackbarType.success:
        return AppColor.onSuccess;
      case AppSnackbarType.error:
        return AppColor.onError;
      case AppSnackbarType.warning:
        return AppColor.onWarning;
      case AppSnackbarType.info:
        return AppColor.onInfo;
    }
  }
}

enum AppSnackbarType { success, error, warning, info }
