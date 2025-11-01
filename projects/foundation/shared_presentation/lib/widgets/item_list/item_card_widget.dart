import 'package:flutter/material.dart';

/// Generic item card widget
///
/// Cung cấp:
/// - Consistent card design
/// - Common item display patterns
/// - Action buttons
/// - Status indicators
class ItemCardWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? description;
  final Widget? leading;
  final Widget? trailing;
  final List<Widget>? actions;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final BorderRadius? borderRadius;
  final bool showDivider;
  final Widget? statusIndicator;
  final Widget? badge;
  final bool isSelected;
  final bool isEnabled;

  const ItemCardWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.description,
    this.leading,
    this.trailing,
    this.actions,
    this.onTap,
    this.onLongPress,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.margin,
    this.elevation,
    this.borderRadius,
    this.showDivider = false,
    this.statusIndicator,
    this.badge,
    this.isSelected = false,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      color:
          backgroundColor ?? (isSelected ? colorScheme.primaryContainer : null),
      elevation: elevation,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        side: isSelected
            ? BorderSide(color: colorScheme.primary, width: 2)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: isEnabled ? onTap : null,
        onLongPress: isEnabled ? onLongPress : null,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        child: Opacity(
          opacity: isEnabled ? 1.0 : 0.6,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                if (description != null) ...[
                  const SizedBox(height: 8),
                  _buildDescription(context),
                ],
                if (showDivider) ...[
                  const SizedBox(height: 12),
                  const Divider(height: 1),
                ],
                if (actions != null && actions!.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  _buildActions(context),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        if (leading != null) ...[leading!, const SizedBox(width: 12)],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (badge != null) ...[const SizedBox(width: 8), badge!],
                ],
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
        if (statusIndicator != null) ...[
          const SizedBox(width: 8),
          statusIndicator!,
        ],
        if (trailing != null) ...[const SizedBox(width: 8), trailing!],
      ],
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      description!,
      style: Theme.of(context).textTheme.bodyMedium,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: actions!
          .map(
            (action) =>
                Padding(padding: const EdgeInsets.only(left: 8), child: action),
          )
          .toList(),
    );
  }
}

/// Compact item card widget
class CompactItemCardWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool isSelected;
  final bool isEnabled;

  const CompactItemCardWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.isSelected = false,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      color:
          backgroundColor ?? (isSelected ? colorScheme.primaryContainer : null),
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: InkWell(
        onTap: isEnabled ? onTap : null,
        child: Opacity(
          opacity: isEnabled ? 1.0 : 0.6,
          child: Padding(
            padding:
                padding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                if (leading != null) ...[leading!, const SizedBox(width: 12)],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (subtitle != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          subtitle!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                if (trailing != null) ...[const SizedBox(width: 8), trailing!],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
