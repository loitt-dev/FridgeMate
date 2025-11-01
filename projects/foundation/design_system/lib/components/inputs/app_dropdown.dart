import 'package:flutter/material.dart';
import '../../values/dimen/app_dimen.dart';

class AppDropdown<T> extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorText;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final bool enabled;
  final Widget? prefixIcon;
  final String? Function(T?)? validator;
  
  const AppDropdown({
    super.key,
    this.label,
    this.hint,
    this.errorText,
    this.value,
    required this.items,
    this.onChanged,
    this.enabled = true,
    this.prefixIcon,
    this.validator,
  });
  
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: value,
      items: items,
      onChanged: enabled ? onChanged : null,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        errorText: errorText,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimen.paddingMedium,
          vertical: AppDimen.paddingMedium,
        ),
      ),
    );
  }
}
