import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

/// Dashboard card showing shopping list preview
///
/// Displays:
/// - Item count
/// - Preview of top 3 items
/// - Quick add button
/// - Navigate to full shopping list
class ShoppingListCard extends StatelessWidget {
  final int itemCount;
  final List<String> previewItems; // Simplified for now
  final VoidCallback onViewAll;
  final VoidCallback onQuickAdd;

  const ShoppingListCard({
    super.key,
    required this.itemCount,
    required this.previewItems,
    required this.onViewAll,
    required this.onQuickAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppDimen.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimen.cardRadius),
      ),
      child: InkWell(
        onTap: onViewAll,
        borderRadius: BorderRadius.circular(AppDimen.cardRadius),
        child: Padding(
          padding: const EdgeInsets.all(AppDimen.paddingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(),
              const SizedBox(height: AppDimen.spacingL),

              // Preview items or empty state
              if (previewItems.isEmpty)
                _buildEmptyState()
              else ...[
                _buildPreviewItems(),
                const SizedBox(height: AppDimen.spacingM),
              ],

              // Action buttons
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  /// Build header with icon, title, and count badge
  Widget _buildHeader() {
    return Row(
      children: [
        const Icon(
          Icons.shopping_cart,
          color: AppColor.tertiary,
          size: AppDimen.iconLarge,
        ),
        const SizedBox(width: AppDimen.spacingS),
        const Text(
          'Danh sách mua sắm',
          style: TextStyle(
            fontSize: AppFontSize.titleLarge,
            fontWeight: FontWeight.w600,
            color: AppColor.onSurface,
          ),
        ),
        const Spacer(),
        if (itemCount > 0)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimen.paddingSmall,
              vertical: AppDimen.paddingXXS,
            ),
            decoration: BoxDecoration(
              color: AppColor.tertiaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$itemCount',
              style: const TextStyle(
                fontSize: AppFontSize.labelMedium,
                fontWeight: FontWeight.w700,
                color: AppColor.onTertiaryContainer,
              ),
            ),
          ),
      ],
    );
  }

  /// Build preview items list
  Widget _buildPreviewItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: previewItems
          .take(3)
          .map((item) => _buildPreviewItem(item))
          .toList(),
    );
  }

  /// Build a single preview item
  Widget _buildPreviewItem(String itemName) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimen.spacingS),
      child: Row(
        children: [
          // Checkbox (unchecked)
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.outline, width: 2),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: AppDimen.spacingM),
          // Item name
          Expanded(
            child: Text(
              itemName,
              style: const TextStyle(
                fontSize: AppFontSize.bodyMedium,
                color: AppColor.onSurface,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  /// Build empty state
  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimen.paddingLarge),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: AppDimen.iconXXL,
              color: AppColor.onSurfaceVariant,
            ),
            const SizedBox(height: AppDimen.spacingS),
            const Text(
              'Danh sách trống',
              style: TextStyle(
                fontSize: AppFontSize.bodyMedium,
                color: AppColor.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build action buttons
  Widget _buildActionButtons() {
    return Row(
      children: [
        // Quick add button
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onQuickAdd,
            icon: const Icon(Icons.add, size: AppDimen.iconSmall),
            label: const Text('Thêm nhanh'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: AppDimen.paddingMedium,
              ),
            ),
          ),
        ),
        const SizedBox(width: AppDimen.spacingM),
        // View all button
        Expanded(
          child: FilledButton(
            onPressed: onViewAll,
            child: const Text('Xem tất cả'),
          ),
        ),
      ],
    );
  }
}
