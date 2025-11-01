import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:domain/domain.dart';

/// Dashboard card showing expiry warnings
///
/// Displays:
/// - Count breakdown (today, 3 days, 1 week)
/// - Preview of top 3 expiring items
/// - View all button
class ExpiryWarningCard extends StatelessWidget {
  final int todayCount;
  final int threeDaysCount;
  final int weekCount;
  final List<StorageItem> previewItems;
  final VoidCallback onViewAll;

  const ExpiryWarningCard({
    super.key,
    required this.todayCount,
    required this.threeDaysCount,
    required this.weekCount,
    required this.previewItems,
    required this.onViewAll,
  });

  int get totalCount => todayCount + threeDaysCount + weekCount;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppDimen.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimen.cardRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimen.paddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _buildHeader(),
            const SizedBox(height: AppDimen.spacingL),

            // Status breakdown
            _buildStatusBreakdown(),
            const SizedBox(height: AppDimen.spacingL),

            // Preview items
            if (previewItems.isNotEmpty) ...[
              _buildPreviewItems(),
              const SizedBox(height: AppDimen.spacingM),
            ],

            // View all button
            _buildViewAllButton(),
          ],
        ),
      ),
    );
  }

  /// Build header with icon, title, and badge
  Widget _buildHeader() {
    return Row(
      children: [
        const Icon(
          Icons.warning_amber_rounded,
          color: AppColor.statusExpiringSoon,
          size: AppDimen.iconLarge,
        ),
        const SizedBox(width: AppDimen.spacingS),
        const Text(
          'Sắp hết hạn',
          style: TextStyle(
            fontSize: AppFontSize.titleLarge,
            fontWeight: FontWeight.w600,
            color: AppColor.onSurface,
          ),
        ),
        const Spacer(),
        if (totalCount > 0)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimen.paddingSmall,
              vertical: AppDimen.paddingXXS,
            ),
            decoration: BoxDecoration(
              color: AppColor.statusExpiringSoonBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$totalCount',
              style: const TextStyle(
                fontSize: AppFontSize.labelMedium,
                fontWeight: FontWeight.w700,
                color: AppColor.statusExpiringSoonText,
              ),
            ),
          ),
      ],
    );
  }

  /// Build status breakdown with color-coded counts
  Widget _buildStatusBreakdown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatusColumn(
          'Hôm nay',
          todayCount,
          AppColor.statusExpired,
          AppColor.statusExpiredBg,
        ),
        _buildStatusColumn(
          '3 ngày',
          threeDaysCount,
          AppColor.statusExpiringSoon,
          AppColor.statusExpiringSoonBg,
        ),
        _buildStatusColumn(
          '1 tuần',
          weekCount,
          AppColor.statusInfo,
          AppColor.statusInfoBg,
        ),
      ],
    );
  }

  /// Build a single status column
  Widget _buildStatusColumn(
    String label,
    int count,
    Color color,
    Color bgColor,
  ) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              '$count',
              style: TextStyle(
                fontSize: AppFontSize.titleLarge,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppDimen.spacingXS),
        Text(
          label,
          style: const TextStyle(
            fontSize: AppFontSize.bodySmall,
            color: AppColor.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  /// Build preview items list
  Widget _buildPreviewItems() {
    return Column(
      children: previewItems
          .take(3)
          .map((item) => _buildPreviewItem(item))
          .toList(),
    );
  }

  /// Build a single preview item
  Widget _buildPreviewItem(StorageItem item) {
    final daysUntilExpiry = item.expiryDate.difference(DateTime.now()).inDays;
    final expiryText = daysUntilExpiry == 0
        ? 'Hết hạn hôm nay'
        : daysUntilExpiry < 0
        ? 'Đã hết hạn'
        : 'Còn $daysUntilExpiry ngày';

    final expiryColor = daysUntilExpiry == 0 || daysUntilExpiry < 0
        ? AppColor.statusExpired
        : daysUntilExpiry <= 3
        ? AppColor.statusExpiringSoon
        : AppColor.statusInfo;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimen.spacingS),
      child: Row(
        children: [
          // Status indicator dot
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: expiryColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: AppDimen.spacingM),
          // Item info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: AppFontSize.titleSmall,
                    fontWeight: FontWeight.w500,
                    color: AppColor.onSurface,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  expiryText,
                  style: TextStyle(
                    fontSize: AppFontSize.bodySmall,
                    color: expiryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build view all button
  Widget _buildViewAllButton() {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onViewAll,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: AppDimen.paddingMedium),
        ),
        child: const Text(
          'Xem tất cả',
          style: TextStyle(
            fontSize: AppFontSize.labelLarge,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
