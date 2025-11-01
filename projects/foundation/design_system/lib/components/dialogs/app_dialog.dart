import 'package:flutter/material.dart';
import '../../values/dimen/app_dimen.dart';

class AppDialog extends StatelessWidget {
  final String? title;
  final Widget? content;
  final List<Widget>? actions;
  final bool barrierDismissible;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? contentPadding;

  const AppDialog({
    super.key,
    this.title,
    this.content,
    this.actions,
    this.barrierDismissible = true,
    this.backgroundColor,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: content,
      actions: actions,
      
      backgroundColor: backgroundColor ?? colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimen.radiusLarge),
      ),
      titlePadding:
          contentPadding ?? const EdgeInsets.all(AppDimen.paddingLarge),
      contentPadding:
          contentPadding ??
          const EdgeInsets.symmetric(horizontal: AppDimen.paddingLarge),
      actionsPadding: const EdgeInsets.symmetric(
        horizontal: AppDimen.paddingLarge,
        vertical: AppDimen.paddingMedium,
      ),
    );
  }

  static Future<T?> show<T>({
    required BuildContext context,
    String? title,
    Widget? content,
    List<Widget>? actions,
    bool barrierDismissible = true,
    Color? backgroundColor,
    EdgeInsetsGeometry? contentPadding,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AppDialog(
        title: title,
        content: content,
        actions: actions,
        barrierDismissible: barrierDismissible,
        backgroundColor: backgroundColor,
        contentPadding: contentPadding,
      ),
    );
  }
}
