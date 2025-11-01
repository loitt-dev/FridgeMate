import 'package:flutter/material.dart';
import '../../values/color/app_color.dart';
import '../../values/dimen/app_dimen.dart';
import '../../values/typography/app_font_size.dart';

/// Eco-friendly button component with dark background and white text
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final Widget? icon;
  final double? width;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.medium,
    this.icon,
    this.width,
  });
  bool get isDisabled => !isEnabled || onPressed == null || isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: _getHeight(),
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: _getButtonStyle(context),
        child: isLoading
            ? SizedBox(
                height: _getIconSize(),
                width: _getIconSize(),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  backgroundColor: Colors.transparent,
                  color: _getForegroundColor(),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    icon!,
                    const SizedBox(width: AppDimen.paddingSmall),
                  ],
                  Text(text, style: _getTextStyle()),
                ],
              ),
      ),
    );
  }

  ButtonStyle _getButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: _getBackgroundColor(),
      foregroundColor: _getForegroundColor(),
      disabledBackgroundColor: _getDisabledBackgroundColor(),
      disabledForegroundColor: _getDisabledForegroundColor(),
      elevation: 0,
      shadowColor: Colors.transparent,
      padding: _getPadding(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_getBorderRadius()),
        side: BorderSide(
          color: _getBorderColor(),
          width: variant == AppButtonVariant.outline ? 1.5 : 0,
        ),
      ),
      minimumSize: Size(width ?? 0, _getHeight()),
    );
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case AppButtonVariant.primary:
        return AppColor.buttonPrimary;
      case AppButtonVariant.secondary:
        return AppColor.primary;
      case AppButtonVariant.outline:
        return Colors.transparent;
      case AppButtonVariant.ghost:
        return Colors.transparent;
    }
  }

  Color _getForegroundColor() {
    switch (variant) {
      case AppButtonVariant.primary:
        return AppColor.buttonPrimaryText;
      case AppButtonVariant.secondary:
        return AppColor.onPrimary;
      case AppButtonVariant.outline:
        return AppColor.primary;
      case AppButtonVariant.ghost:
        return AppColor.primary;
    }
  }

  Color _getBorderColor() {
    switch (variant) {
      case AppButtonVariant.outline:
        return isDisabled
            ? AppColor.outline.withValues(alpha: 0.5)
            : AppColor.outline;
      default:
        return Colors.transparent;
    }
  }

  Color _getDisabledBackgroundColor() {
    switch (variant) {
      case AppButtonVariant.primary:
        return Color(0xFF9e9e9e);
      case AppButtonVariant.secondary:
        return AppColor.primary.withValues(alpha: 0.5);
      case AppButtonVariant.outline:
        return Colors.transparent;
      case AppButtonVariant.ghost:
        return Colors.transparent;
    }
  }

  Color _getDisabledForegroundColor() {
    switch (variant) {
      case AppButtonVariant.primary:
        return AppColor.buttonPrimaryText.withValues(alpha: 0.5);
      case AppButtonVariant.secondary:
        return AppColor.onPrimary.withValues(alpha: 0.5);
      case AppButtonVariant.outline:
        return AppColor.primary.withValues(alpha: 0.5);
      case AppButtonVariant.ghost:
        return AppColor.primary.withValues(alpha: 0.5);
    }
  }

  TextStyle _getTextStyle() {
    return TextStyle(
      fontSize: _getFontSize(),
      fontWeight: FontWeight.w600,
      color: isDisabled ? _getDisabledForegroundColor() : _getForegroundColor(),
    );
  }

  double _getHeight() {
    switch (size) {
      case AppButtonSize.small:
        return AppDimen.buttonHeightSmall;
      case AppButtonSize.medium:
        return AppDimen.buttonHeightMedium;
      case AppButtonSize.large:
        return AppDimen.buttonHeightLarge;
      case AppButtonSize.xl:
        return AppDimen.buttonHeightXL;
    }
  }

  double _getFontSize() {
    switch (size) {
      case AppButtonSize.small:
        return AppFontSize.labelMedium;
      case AppButtonSize.medium:
        return AppFontSize.labelLarge;
      case AppButtonSize.large:
        return AppFontSize.titleSmall;
      case AppButtonSize.xl:
        return AppFontSize.titleMedium;
    }
  }

  double _getIconSize() {
    switch (size) {
      case AppButtonSize.small:
        return AppDimen.iconSmall;
      case AppButtonSize.medium:
        return AppDimen.iconMedium;
      case AppButtonSize.large:
        return AppDimen.iconLarge;
      case AppButtonSize.xl:
        return AppDimen.iconXL;
    }
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case AppButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: AppDimen.paddingMedium);
      case AppButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: AppDimen.paddingLarge);
      case AppButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: AppDimen.paddingXL);
      case AppButtonSize.xl:
        return const EdgeInsets.symmetric(horizontal: AppDimen.paddingXXL);
    }
  }

  double _getBorderRadius() {
    switch (size) {
      case AppButtonSize.small:
        return AppDimen.radiusMedium;
      case AppButtonSize.medium:
        return AppDimen.radiusLarge;
      case AppButtonSize.large:
        return AppDimen.radiusLarge;
      case AppButtonSize.xl:
        return AppDimen.radiusXL;
    }
  }
}

/// Button variants for different use cases
enum AppButtonVariant {
  primary, // Dark background with white text
  secondary, // Green background with white text
  outline, // Transparent with green border and text
  ghost, // Transparent with secondary text
}

/// Button sizes for different contexts
enum AppButtonSize { small, medium, large, xl }

/// Specialized button for "Book Now" style actions
class AppBookNowButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final double? width;

  const AppBookNowButton({
    super.key,
    this.text = 'Book Now',
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: text,
      onPressed: onPressed,
      isLoading: isLoading,
      isEnabled: isEnabled,
      variant: AppButtonVariant.primary,
      size: AppButtonSize.large,
      width: width,
    );
  }
}
