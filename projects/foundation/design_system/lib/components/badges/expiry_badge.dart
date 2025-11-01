import 'package:flutter/material.dart';
import '../../values/dimen/app_dimen.dart';
import '../../values/color/app_color.dart';
import '../../values/typography/app_font_size.dart';

/// FridgeMate expiry badge component
///
/// A specialized badge widget for displaying food/medicine expiry status
/// with appropriate colors and icons for different states.
class ExpiryBadge extends StatelessWidget {
  final ExpiryStatus status;
  final String? text;
  final IconData? icon;
  final ExpiryBadgeSize size;
  final bool showIcon;
  final bool showText;

  const ExpiryBadge({
    super.key,
    required this.status,
    this.text,
    this.icon,
    this.size = ExpiryBadgeSize.medium,
    this.showIcon = true,
    this.showText = true,
  });

  const ExpiryBadge.fresh({
    super.key,
    String? text,
    this.size = ExpiryBadgeSize.medium,
    this.showIcon = true,
    this.showText = true,
  }) : status = ExpiryStatus.fresh,
       text = text ?? 'Fresh',
       icon = Icons.check_circle;

  const ExpiryBadge.expiringSoon({
    super.key,
    String? text,
    this.size = ExpiryBadgeSize.medium,
    this.showIcon = true,
    this.showText = true,
  }) : status = ExpiryStatus.expiringSoon,
       text = text ?? 'Expiring Soon',
       icon = Icons.warning;

  const ExpiryBadge.expired({
    super.key,
    String? text,
    this.size = ExpiryBadgeSize.medium,
    this.showIcon = true,
    this.showText = true,
  }) : status = ExpiryStatus.expired,
       text = text ?? 'Expired',
       icon = Icons.error;

  const ExpiryBadge.unknown({
    super.key,
    String? text,
    this.size = ExpiryBadgeSize.medium,
    this.showIcon = true,
    this.showText = true,
  }) : status = ExpiryStatus.unknown,
       text = text ?? 'Unknown',
       icon = Icons.help;

  @override
  Widget build(BuildContext context) {
    final badgeColor = _getBadgeColor();
    final textColor = _getTextColor();
    final badgeIcon = icon ?? _getDefaultIcon();

    return Container(
      padding: _getPadding(),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(_getBorderRadius()),
        border: Border.all(color: textColor.withValues(alpha: 0.3), width: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: _getSpacing(),
        children: [
          if (showIcon && badgeIcon != null) ...[
            Icon(badgeIcon, size: _getIconSize(), color: textColor),
          ],
          if (showText && text != null)
            Text(
              text!,
              style: TextStyle(
                color: textColor,
                fontSize: _getFontSize(),
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }

  Color _getBadgeColor() {
    switch (status) {
      case ExpiryStatus.fresh:
        return AppColor.successContainer;
      case ExpiryStatus.expiringSoon:
        return AppColor.warningContainer;
      case ExpiryStatus.expired:
        return AppColor.errorContainer;
      case ExpiryStatus.unknown:
        return AppColor.surfaceVariant;
    }
  }

  Color _getTextColor() {
    switch (status) {
      case ExpiryStatus.fresh:
        return AppColor.onSuccessContainer;
      case ExpiryStatus.expiringSoon:
        return AppColor.onWarningContainer;
      case ExpiryStatus.expired:
        return AppColor.onErrorContainer;
      case ExpiryStatus.unknown:
        return AppColor.onSurfaceVariant;
    }
  }

  IconData? _getDefaultIcon() {
    switch (status) {
      case ExpiryStatus.fresh:
        return Icons.check_circle;
      case ExpiryStatus.expiringSoon:
        return Icons.warning;
      case ExpiryStatus.expired:
        return Icons.error;
      case ExpiryStatus.unknown:
        return Icons.help;
    }
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case ExpiryBadgeSize.small:
        return const EdgeInsets.symmetric(
          horizontal: AppDimen.paddingXS,
          vertical: AppDimen.paddingXXS,
        );
      case ExpiryBadgeSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: AppDimen.paddingSmall,
          vertical: AppDimen.paddingXS,
        );
      case ExpiryBadgeSize.large:
        return const EdgeInsets.symmetric(
          horizontal: AppDimen.paddingMedium,
          vertical: AppDimen.paddingSmall,
        );
    }
  }

  double _getBorderRadius() {
    switch (size) {
      case ExpiryBadgeSize.small:
        return AppDimen.radiusXS;
      case ExpiryBadgeSize.medium:
        return AppDimen.radiusSmall;
      case ExpiryBadgeSize.large:
        return AppDimen.radiusMedium;
    }
  }

  double _getIconSize() {
    switch (size) {
      case ExpiryBadgeSize.small:
        return AppDimen.iconXS;
      case ExpiryBadgeSize.medium:
        return AppDimen.iconSmall;
      case ExpiryBadgeSize.large:
        return AppDimen.iconMedium;
    }
  }

  double _getFontSize() {
    switch (size) {
      case ExpiryBadgeSize.small:
        return AppFontSize.badge;
      case ExpiryBadgeSize.medium:
        return AppFontSize.labelSmall;
      case ExpiryBadgeSize.large:
        return AppFontSize.labelMedium;
    }
  }

  double _getSpacing() {
    switch (size) {
      case ExpiryBadgeSize.small:
        return AppDimen.spacingXXS;
      case ExpiryBadgeSize.medium:
        return AppDimen.spacingXS;
      case ExpiryBadgeSize.large:
        return AppDimen.spacingS;
    }
  }
}

/// Expiry status enumeration
enum ExpiryStatus { fresh, expiringSoon, expired, unknown }

/// Badge size variants
enum ExpiryBadgeSize { small, medium, large }
