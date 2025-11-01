import 'package:flutter/material.dart';

/// A panel widget for displaying and controlling component properties
class ComponentPropertiesPanel extends StatelessWidget {
  final String title;
  final List<PropertyControl> properties;
  final bool isExpanded;
  final VoidCallback? onToggle;

  const ComponentPropertiesPanel({
    super.key,
    required this.title,
    required this.properties,
    this.isExpanded = false,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            trailing: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
            onTap: onToggle,
          ),
          if (isExpanded) ...[
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: properties.map((property) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: property,
                  );
                }).toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Base class for property controls
abstract class PropertyControl extends StatelessWidget {
  final String label;
  final String? description;

  const PropertyControl({super.key, required this.label, this.description});
}

/// Boolean property control with switch
class BooleanPropertyControl extends PropertyControl {
  final bool value;
  final ValueChanged<bool> onChanged;

  const BooleanPropertyControl({
    super.key,
    required String label,
    String? description,
    required this.value,
    required this.onChanged,
  }) : super(label: label, description: description);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
              if (description != null)
                Text(
                  description!,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                ),
            ],
          ),
        ),
        Switch(value: value, onChanged: onChanged),
      ],
    );
  }
}

/// Enum property control with dropdown
class EnumPropertyControl<T extends Enum> extends PropertyControl {
  final T value;
  final List<T> options;
  final ValueChanged<T> onChanged;
  final String Function(T)? displayName;

  const EnumPropertyControl({
    super.key,
    required String label,
    String? description,
    required this.value,
    required this.options,
    required this.onChanged,
    this.displayName,
  }) : super(label: label, description: description);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        if (description != null)
          Text(
            description!,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
          ),
        const SizedBox(height: 8),
        DropdownButtonFormField<T>(
          value: value,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: options.map((option) {
            return DropdownMenuItem(
              value: option,
              child: Text(displayName?.call(option) ?? option.name),
            );
          }).toList(),
          onChanged: (newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
        ),
      ],
    );
  }
}

/// Numeric property control with slider
class NumericPropertyControl extends PropertyControl {
  final double value;
  final double min;
  final double max;
  final int? divisions;
  final ValueChanged<double> onChanged;
  final String Function(double)? displayValue;

  const NumericPropertyControl({
    super.key,
    required String label,
    String? description,
    required this.value,
    required this.min,
    required this.max,
    this.divisions,
    required this.onChanged,
    this.displayValue,
  }) : super(label: label, description: description);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
            Text(
              displayValue?.call(value) ?? value.toStringAsFixed(1),
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
            ),
          ],
        ),
        if (description != null)
          Text(
            description!,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
          ),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: divisions,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

/// Color property control with color picker
class ColorPropertyControl extends PropertyControl {
  final Color value;
  final List<Color> options;
  final ValueChanged<Color> onChanged;

  const ColorPropertyControl({
    super.key,
    required String label,
    String? description,
    required this.value,
    required this.options,
    required this.onChanged,
  }) : super(label: label, description: description);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        if (description != null)
          Text(
            description!,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
          ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: options.map((color) {
            final isSelected = color == value;
            return GestureDetector(
              onTap: () => onChanged(color),
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: isSelected
                      ? Border.all(color: Colors.black, width: 3)
                      : Border.all(color: Colors.grey.shade300),
                ),
                child: isSelected
                    ? const Icon(Icons.check, color: Colors.white, size: 16)
                    : null,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
