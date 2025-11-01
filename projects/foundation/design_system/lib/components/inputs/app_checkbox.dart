import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String? label;
  final bool enabled;
  final Color? activeColor;
  final Color? checkColor;

  const AppCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.label,
    this.enabled = true,
    this.activeColor,
    this.checkColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Widget checkbox = Checkbox(
      value: value,
      onChanged: enabled ? onChanged : null,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      activeColor: activeColor ?? colorScheme.primary,
      checkColor: checkColor ?? colorScheme.onPrimary,
    );

    if (label != null) {
      checkbox = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          checkbox,
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

    return checkbox;
  }
}
