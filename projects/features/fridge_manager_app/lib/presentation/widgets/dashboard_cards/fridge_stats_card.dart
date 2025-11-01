import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

/// Dashboard card showing fridge statistics
///
/// Displays:
/// - Total item count in fridge
/// - Navigable to full fridge view
class FridgeStatsCard extends StatelessWidget {
  final int itemCount;
  final VoidCallback onTap;

  const FridgeStatsCard({
    super.key,
    required this.itemCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppDimen.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimen.cardRadius),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimen.cardRadius),
        child: Container(
          height: AppDimen.statsCardHeight,
          padding: const EdgeInsets.all(AppDimen.paddingLarge),
          child: Row(
            children: [
              // Icon section
              _buildIconContainer(),
              const SizedBox(width: AppDimen.spacingL),
              // Content section
              Expanded(child: _buildContent()),
              // Arrow indicator
              _buildArrowIcon(),
            ],
          ),
        ),
      ),
    );
  }

  /// Build icon container with fridge icon
  Widget _buildIconContainer() {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: AppColor.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.kitchen,
        size: AppDimen.iconXXL,
        color: AppColor.onPrimaryContainer,
      ),
    );
  }

  /// Build content with item count and label
  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$itemCount',
          style: const TextStyle(
            fontSize: AppFontSize.displayMedium,
            fontWeight: FontWeight.w400,
            color: AppColor.onSurface,
          ),
        ),
        const SizedBox(height: AppDimen.spacingXS),
        const Text(
          'Sản phẩm trong tủ lạnh',
          style: TextStyle(
            fontSize: AppFontSize.bodyMedium,
            color: AppColor.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  /// Build arrow indicator
  Widget _buildArrowIcon() {
    return const Icon(
      Icons.arrow_forward_ios,
      size: AppDimen.iconSmall,
      color: AppColor.onSurfaceVariant,
    );
  }
}
