import 'package:flutter/material.dart';
import '../../values/dimen/app_dimen.dart';

class AppListTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool enabled;
  final Color? tileColor;
  final Color? selectedTileColor;
  final bool selected;

  const AppListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.enabled = true,
    this.tileColor,
    this.selectedTileColor,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListTile(
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      onTap: enabled ? onTap : null,
      enabled: enabled,
      tileColor: tileColor,
      selectedTileColor:
          selectedTileColor ?? colorScheme.primary.withOpacity(0.1),
      selected: selected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimen.paddingMedium,
        vertical: AppDimen.paddingSmall,
      ),
    );
  }
}
