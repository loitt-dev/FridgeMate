import 'package:flutter/material.dart';

class AppSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final String? label;
  final bool enabled;
  final Color? activeColor;
  final Color? activeTrackColor;
  final Color? inactiveThumbColor;
  final Color? inactiveTrackColor;

  const AppSwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.label,
    this.enabled = true,
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Widget switchWidget = Switch(
      value: value,
      onChanged: enabled ? onChanged : null,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );

    if (label != null) {
      switchWidget = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          switchWidget,
          GestureDetector(
            onTap: () {
              if (enabled) {
                onChanged?.call(!value);
              }
            },
            child: Text(
              label!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: enabled
                    ? null
                    : colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ),
        ],
      );
    }

    return switchWidget;
  }
}
