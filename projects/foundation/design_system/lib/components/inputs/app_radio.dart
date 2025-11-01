import 'package:flutter/material.dart';

class AppRadio<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final String? label;
  final bool enabled;
  final Color? activeColor;

  const AppRadio({
    super.key,
    required this.value,
    this.groupValue,
    this.onChanged,
    this.label,
    this.enabled = true,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Widget radio = Radio<T>(
      value: value,
      groupValue: groupValue,
      onChanged: enabled ? onChanged : null,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      activeColor: activeColor ?? colorScheme.primary,
    );

    if (label != null) {
      radio = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          radio,
          GestureDetector(
            onTap: () {
              if (enabled) {
                onChanged?.call(value);
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

    return radio;
  }
}
