import 'package:flutter/material.dart';

/// Shopping item widget để hiển thị item trong danh sách mua sắm
///
/// Cung cấp:
/// - Item name và description
/// - Quantity và unit
/// - Price information
/// - Checkbox để mark as purchased
/// - Action buttons
class ShoppingItemWidget extends StatelessWidget {
  final String name;
  final String? description;
  final double quantity;
  final String? unit;
  final double? price;
  final String? currency;
  final bool isPurchased;
  final bool isUrgent;
  final String? category;
  final VoidCallback? onTap;
  final VoidCallback? onTogglePurchased;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onMoveToCart;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final ShoppingItemStyle style;

  const ShoppingItemWidget({
    super.key,
    required this.name,
    this.description,
    required this.quantity,
    this.unit,
    this.price,
    this.currency,
    this.isPurchased = false,
    this.isUrgent = false,
    this.category,
    this.onTap,
    this.onTogglePurchased,
    this.onEdit,
    this.onDelete,
    this.onMoveToCart,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.style = ShoppingItemStyle.standard,
  });

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case ShoppingItemStyle.standard:
        return _buildStandardItem(context);
      case ShoppingItemStyle.compact:
        return _buildCompactItem(context);
      case ShoppingItemStyle.detailed:
        return _buildDetailedItem(context);
    }
  }

  Widget _buildStandardItem(BuildContext context) {
    return Card(
      color: backgroundColor ?? (isPurchased ? Colors.grey.shade100 : null),
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(16),
          child: Row(
            children: [
              _buildCheckbox(context),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    if (description != null) ...[
                      const SizedBox(height: 4),
                      _buildDescription(context),
                    ],
                    const SizedBox(height: 8),
                    _buildMetadata(context),
                  ],
                ),
              ),
              _buildActions(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompactItem(BuildContext context) {
    return Card(
      color: backgroundColor ?? (isPurchased ? Colors.grey.shade100 : null),
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding:
              padding ??
              const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              _buildCheckbox(context),
              const SizedBox(width: 8),
              Expanded(child: _buildCompactHeader(context)),
              if (price != null) ...[
                const SizedBox(width: 8),
                _buildPrice(context),
              ],
              _buildCompactActions(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailedItem(BuildContext context) {
    return Card(
      color: backgroundColor ?? (isPurchased ? Colors.grey.shade100 : null),
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildCheckbox(context),
                  const SizedBox(width: 12),
                  Expanded(child: _buildHeader(context)),
                  if (isUrgent) ...[
                    const SizedBox(width: 8),
                    _buildUrgentBadge(context),
                  ],
                  _buildActions(context),
                ],
              ),
              if (description != null) ...[
                const SizedBox(height: 8),
                _buildDescription(context),
              ],
              const SizedBox(height: 12),
              _buildDetailedMetadata(context),
              if (category != null) ...[
                const SizedBox(height: 8),
                _buildCategory(context),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox(BuildContext context) {
    return Checkbox(
      value: isPurchased,
      onChanged: onTogglePurchased != null ? (_) => onTogglePurchased!() : null,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              decoration: isPurchased ? TextDecoration.lineThrough : null,
              color: isPurchased ? Colors.grey : null,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (isUrgent && style != ShoppingItemStyle.detailed) ...[
          const SizedBox(width: 8),
          _buildUrgentBadge(context),
        ],
      ],
    );
  }

  Widget _buildCompactHeader(BuildContext context) {
    return Text(
      name,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w500,
        decoration: isPurchased ? TextDecoration.lineThrough : null,
        color: isPurchased ? Colors.grey : null,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      description!,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        decoration: isPurchased ? TextDecoration.lineThrough : null,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildMetadata(BuildContext context) {
    return Row(
      children: [
        Text(
          '${quantity.toStringAsFixed(quantity % 1 == 0 ? 0 : 1)}${unit ?? ''}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        if (price != null) ...[const SizedBox(width: 16), _buildPrice(context)],
      ],
    );
  }

  Widget _buildDetailedMetadata(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.shopping_cart,
          size: 16,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 4),
        Text(
          '${quantity.toStringAsFixed(quantity % 1 == 0 ? 0 : 1)}${unit ?? ''}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        if (price != null) ...[
          const SizedBox(width: 16),
          Icon(
            Icons.attach_money,
            size: 16,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 4),
          _buildPrice(context),
        ],
      ],
    );
  }

  Widget _buildPrice(BuildContext context) {
    return Text(
      '${price!.toStringAsFixed(0)} ${currency ?? 'VND'}',
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _buildUrgentBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.red.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.shade300),
      ),
      child: Text(
        'Gấp',
        style: TextStyle(
          color: Colors.red.shade800,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildCategory(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        category!,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (onEdit != null)
          IconButton(
            onPressed: onEdit,
            icon: const Icon(Icons.edit, size: 20),
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),
        if (onDelete != null)
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete, size: 20),
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),
        if (onMoveToCart != null && !isPurchased)
          IconButton(
            onPressed: onMoveToCart,
            icon: const Icon(Icons.shopping_cart, size: 20),
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),
      ],
    );
  }

  Widget _buildCompactActions(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (onEdit != null)
          IconButton(
            onPressed: onEdit,
            icon: const Icon(Icons.edit, size: 18),
            constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
          ),
        if (onDelete != null)
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete, size: 18),
            constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
          ),
      ],
    );
  }
}

/// Shopping list summary widget
class ShoppingListSummaryWidget extends StatelessWidget {
  final int totalItems;
  final int purchasedItems;
  final double? totalPrice;
  final String? currency;
  final VoidCallback? onViewAll;
  final VoidCallback? onClearPurchased;

  const ShoppingListSummaryWidget({
    super.key,
    required this.totalItems,
    required this.purchasedItems,
    this.totalPrice,
    this.currency,
    this.onViewAll,
    this.onClearPurchased,
  });

  @override
  Widget build(BuildContext context) {
    final remainingItems = totalItems - purchasedItems;
    final progress = totalItems > 0 ? purchasedItems / totalItems : 0.0;

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Danh sách mua sắm',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (onViewAll != null)
                  TextButton(
                    onPressed: onViewAll,
                    child: const Text('Xem tất cả'),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$purchasedItems/$totalItems đã mua',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                if (totalPrice != null) ...[
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Tổng cộng',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        '${totalPrice!.toStringAsFixed(0)} ${currency ?? 'VND'}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
            if (remainingItems > 0) ...[
              const SizedBox(height: 12),
              Text(
                'Còn $remainingItems món cần mua',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            if (purchasedItems > 0 && onClearPurchased != null) ...[
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: onClearPurchased,
                    child: const Text('Xóa đã mua'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Enums
enum ShoppingItemStyle { standard, compact, detailed }
