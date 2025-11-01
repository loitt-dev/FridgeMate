import 'package:flutter/material.dart';
import '../../values/dimen/app_dimen.dart';

class AppFab extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final AppFabSize size;
  final String? tooltip;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const AppFab({
    super.key,
    required this.icon,
    this.onPressed,
    this.size = AppFabSize.medium,
    this.tooltip,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Widget fab = FloatingActionButton(
      onPressed: onPressed,
      heroTag: UniqueKey().toString(),
      backgroundColor: backgroundColor ?? colorScheme.primary,
      foregroundColor: foregroundColor ?? colorScheme.onPrimary,
      elevation: 6,
      child: Icon(icon, size: _getIconSize()),
    );

    if (tooltip != null) {
      fab = Tooltip(message: tooltip!, child: fab);
    }

    return fab;
  }

  double _getIconSize() {
    switch (size) {
      case AppFabSize.small:
        return AppDimen.iconMedium;
      case AppFabSize.medium:
        return AppDimen.iconLarge;
      case AppFabSize.large:
        return AppDimen.iconXL;
    }
  }
}

enum AppFabSize { small, medium, large }
