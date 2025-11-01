import 'package:flutter/material.dart';
import '../../values/color/app_color.dart';
import '../../values/dimen/app_dimen.dart';
import '../../values/typography/app_font_size.dart';

/// Eco-friendly search bar component with pill shape and muted green styling
class AppSearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const AppSearchBar({
    super.key,
    this.hintText = 'Search Now',
    this.onChanged,
    this.onTap,
    this.controller,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimen.searchBarHeight,
      decoration: BoxDecoration(
        color: AppColor.searchBarBackground,
        borderRadius: BorderRadius.circular(AppDimen.searchBarRadius),
        boxShadow: [
          BoxShadow(
            color: AppColor.cardShadow,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        enabled: enabled,
        style: const TextStyle(
          fontSize: AppFontSize.bodyMedium,
          color: AppColor.textPrimary,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: AppFontSize.bodyMedium,
            color: AppColor.searchBarText,
          ),
          prefixIcon:
              prefixIcon ??
              const Icon(
                Icons.search,
                color: AppColor.searchBarIcon,
                size: AppDimen.iconMedium,
              ),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppDimen.paddingLarge,
            vertical: AppDimen.paddingMedium,
          ),
        ),
      ),
    );
  }
}

/// Search bar with custom styling for different use cases
class AppSearchBarVariant extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;

  const AppSearchBarVariant({
    super.key,
    this.hintText = 'Search Now',
    this.onChanged,
    this.onTap,
    this.controller,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimen.searchBarHeight,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColor.searchBarBackground,
        borderRadius: BorderRadius.circular(AppDimen.searchBarRadius),
        boxShadow: [
          BoxShadow(
            color: AppColor.cardShadow,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        enabled: enabled,
        style: TextStyle(
          fontSize: AppFontSize.bodyMedium,
          color: textColor ?? AppColor.textPrimary,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: AppFontSize.bodyMedium,
            color: iconColor ?? AppColor.searchBarText,
          ),
          prefixIcon:
              prefixIcon ??
              Icon(
                Icons.search,
                color: iconColor ?? AppColor.searchBarIcon,
                size: AppDimen.iconMedium,
              ),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppDimen.paddingLarge,
            vertical: AppDimen.paddingMedium,
          ),
        ),
      ),
    );
  }
}
