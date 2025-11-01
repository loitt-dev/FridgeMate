import 'package:flutter/material.dart';
import '../../values/dimen/app_dimen.dart';
import '../../values/color/app_color.dart';
import '../../values/typography/app_font_size.dart';

/// FridgeMate category chip component
///
/// A specialized chip widget for displaying food/medicine categories
/// with appropriate colors and icons for different categories.
class CategoryChip extends StatelessWidget {
  final String label;
  final CategoryType category;
  final IconData? icon;
  final bool isSelected;
  final VoidCallback? onTap;
  final VoidCallback? onDeleted;
  final CategoryChipSize size;
  final bool showIcon;
  final bool isDeletable;

  const CategoryChip({
    super.key,
    required this.label,
    required this.category,
    this.icon,
    this.isSelected = false,
    this.onTap,
    this.onDeleted,
    this.size = CategoryChipSize.medium,
    this.showIcon = true,
    this.isDeletable = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final chipIcon = icon ?? _getDefaultIcon();
    final chipColor = _getChipColor();
    final textColor = _getTextColor();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: _getPadding(),
        decoration: BoxDecoration(
          color: chipColor,
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          border: isSelected
              ? Border.all(color: colorScheme.primary, width: 2)
              : Border.all(color: textColor.withOpacity(0.3), width: 0.5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showIcon && chipIcon != null) ...[
              Icon(chipIcon, size: _getIconSize(), color: textColor),
              SizedBox(width: _getSpacing()),
            ],
            Text(
              label,
              style: TextStyle(
                color: textColor,
                fontSize: _getFontSize(),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
            if (isDeletable && onDeleted != null) ...[
              SizedBox(width: _getSpacing()),
              GestureDetector(
                onTap: onDeleted,
                child: Icon(
                  Icons.close,
                  size: _getIconSize() * 0.8,
                  color: textColor.withOpacity(0.7),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getChipColor() {
    if (isSelected) {
      return _getSelectedColor();
    }
    return _getCategoryColor();
  }

  Color _getSelectedColor() {
    switch (category) {
      case CategoryType.meat:
        return AppColor.categoryMeat.withOpacity(0.2);
      case CategoryType.vegetable:
        return AppColor.categoryVegetable.withOpacity(0.2);
      case CategoryType.fruit:
        return AppColor.categoryFruit.withOpacity(0.2);
      case CategoryType.dairy:
        return AppColor.categoryDairy.withOpacity(0.2);
      case CategoryType.grain:
        return AppColor.categoryGrain.withOpacity(0.2);
      case CategoryType.spice:
        return AppColor.categorySpice.withOpacity(0.2);
      case CategoryType.beverage:
        return AppColor.categoryBeverage.withOpacity(0.2);
      case CategoryType.snack:
        return AppColor.categorySnack.withOpacity(0.2);
      case CategoryType.medicine:
        return AppColor.medicinePrescription.withOpacity(0.2);
      case CategoryType.other:
        return AppColor.surfaceVariant;
    }
  }

  Color _getCategoryColor() {
    switch (category) {
      case CategoryType.meat:
        return AppColor.categoryMeat;
      case CategoryType.vegetable:
        return AppColor.categoryVegetable;
      case CategoryType.fruit:
        return AppColor.categoryFruit;
      case CategoryType.dairy:
        return AppColor.categoryDairy;
      case CategoryType.grain:
        return AppColor.categoryGrain;
      case CategoryType.spice:
        return AppColor.categorySpice;
      case CategoryType.beverage:
        return AppColor.categoryBeverage;
      case CategoryType.snack:
        return AppColor.categorySnack;
      case CategoryType.medicine:
        return AppColor.medicinePrescription;
      case CategoryType.other:
        return AppColor.surfaceVariant;
    }
  }

  Color _getTextColor() {
    if (isSelected) {
      return _getCategoryColor();
    }
    return AppColor.onSurface;
  }

  IconData? _getDefaultIcon() {
    switch (category) {
      case CategoryType.meat:
        return Icons.restaurant;
      case CategoryType.vegetable:
        return Icons.eco;
      case CategoryType.fruit:
        return Icons.apple;
      case CategoryType.dairy:
        return Icons.local_drink;
      case CategoryType.grain:
        return Icons.grain;
      case CategoryType.spice:
        return Icons.spa;
      case CategoryType.beverage:
        return Icons.local_bar;
      case CategoryType.snack:
        return Icons.cookie;
      case CategoryType.medicine:
        return Icons.medication;
      case CategoryType.other:
        return Icons.category;
    }
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case CategoryChipSize.small:
        return const EdgeInsets.symmetric(
          horizontal: AppDimen.paddingSmall,
          vertical: AppDimen.paddingXS,
        );
      case CategoryChipSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: AppDimen.paddingMedium,
          vertical: AppDimen.paddingSmall,
        );
      case CategoryChipSize.large:
        return const EdgeInsets.symmetric(
          horizontal: AppDimen.paddingLarge,
          vertical: AppDimen.paddingMedium,
        );
    }
  }

  double _getBorderRadius() {
    switch (size) {
      case CategoryChipSize.small:
        return AppDimen.radiusSmall;
      case CategoryChipSize.medium:
        return AppDimen.radiusMedium;
      case CategoryChipSize.large:
        return AppDimen.radiusLarge;
    }
  }

  double _getIconSize() {
    switch (size) {
      case CategoryChipSize.small:
        return AppDimen.iconSmall;
      case CategoryChipSize.medium:
        return AppDimen.iconMedium;
      case CategoryChipSize.large:
        return AppDimen.iconLarge;
    }
  }

  double _getFontSize() {
    switch (size) {
      case CategoryChipSize.small:
        return AppFontSize.labelSmall;
      case CategoryChipSize.medium:
        return AppFontSize.labelMedium;
      case CategoryChipSize.large:
        return AppFontSize.labelLarge;
    }
  }

  double _getSpacing() {
    switch (size) {
      case CategoryChipSize.small:
        return AppDimen.spacingXS;
      case CategoryChipSize.medium:
        return AppDimen.spacingS;
      case CategoryChipSize.large:
        return AppDimen.spacingM;
    }
  }
}

/// Category types for FridgeMate
enum CategoryType {
  meat,
  vegetable,
  fruit,
  dairy,
  grain,
  spice,
  beverage,
  snack,
  medicine,
  other,
}

/// Chip size variants
enum CategoryChipSize { small, medium, large }
