import 'package:flutter/material.dart';
import '../../values/color/app_color.dart';
import '../../values/dimen/app_dimen.dart';

/// Eco-friendly icon component with muted green styling
class AppIcon extends StatelessWidget {
  final IconData icon;
  final AppIconSize size;
  final AppIconVariant variant;
  final Color? color;
  final VoidCallback? onTap;

  const AppIcon({
    super.key,
    required this.icon,
    this.size = AppIconSize.medium,
    this.variant = AppIconVariant.primary,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(icon, size: _getSize(), color: _getColor());

    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: iconWidget);
    }

    return iconWidget;
  }

  double _getSize() {
    switch (size) {
      case AppIconSize.small:
        return AppDimen.iconSmall;
      case AppIconSize.medium:
        return AppDimen.iconMedium;
      case AppIconSize.large:
        return AppDimen.iconLarge;
      case AppIconSize.xl:
        return AppDimen.iconXL;
    }
  }

  Color _getColor() {
    if (color != null) return color!;

    switch (variant) {
      case AppIconVariant.primary:
        return AppColor.iconPrimary; // Muted green
      case AppIconVariant.secondary:
        return AppColor.iconSecondary; // Secondary text color
      case AppIconVariant.tertiary:
        return AppColor.iconTertiary; // Soft peach
      case AppIconVariant.white:
        return Colors.white;
      case AppIconVariant.black:
        return Colors.black;
    }
  }
}

/// Icon sizes for different contexts
enum AppIconSize { small, medium, large, xl }

/// Icon color variants
enum AppIconVariant {
  primary, // Muted green
  secondary, // Secondary text color
  tertiary, // Soft peach
  white, // White
  black, // Black
}

/// Specialized icon for navigation (back arrow, bell, etc.)
class AppNavIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final bool hasNotification;

  const AppNavIcon({
    super.key,
    required this.icon,
    this.onTap,
    this.hasNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppIcon(
          icon: icon,
          size: AppIconSize.medium,
          variant: AppIconVariant.white,
          onTap: onTap,
        ),
        if (hasNotification)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}

/// Icon with rounded square background (like in the reference image)
class AppIconWithBackground extends StatelessWidget {
  final IconData icon;
  final AppIconSize size;
  final AppIconVariant variant;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback? onTap;

  const AppIconWithBackground({
    super.key,
    required this.icon,
    this.size = AppIconSize.medium,
    this.variant = AppIconVariant.primary,
    this.backgroundColor,
    this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final containerSize = _getContainerSize();
    final iconSize = _getIconSize();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: containerSize,
        height: containerSize,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColor.outline,
          borderRadius: BorderRadius.circular(AppDimen.radiusSmall),
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor ?? AppColor.iconPrimary,
        ),
      ),
    );
  }

  double _getContainerSize() {
    switch (size) {
      case AppIconSize.small:
        return 32;
      case AppIconSize.medium:
        return 40;
      case AppIconSize.large:
        return 48;
      case AppIconSize.xl:
        return 56;
    }
  }

  double _getIconSize() {
    switch (size) {
      case AppIconSize.small:
        return AppDimen.iconSmall;
      case AppIconSize.medium:
        return AppDimen.iconMedium;
      case AppIconSize.large:
        return AppDimen.iconLarge;
      case AppIconSize.xl:
        return AppDimen.iconXL;
    }
  }
}
