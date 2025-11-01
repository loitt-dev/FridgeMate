import 'package:flutter/material.dart';
import '../../values/dimen/app_dimen.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final Color? color;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.elevation,
    this.color,
    this.onTap,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Widget card = Card(
      color: color ?? colorScheme.surface,
      elevation: elevation ?? AppDimen.cardElevation,
      margin: margin ?? const EdgeInsets.all(AppDimen.marginSmall),
      shape: RoundedRectangleBorder(
        borderRadius:
            borderRadius ?? BorderRadius.circular(AppDimen.radiusMedium),
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(AppDimen.paddingMedium),
        child: child,
      ),
    );

    if (onTap != null) {
      card = InkWell(
        onTap: onTap,
        borderRadius:
            borderRadius ?? BorderRadius.circular(AppDimen.radiusMedium),
        child: card,
      );
    }

    return card;
  }
}
