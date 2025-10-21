import 'package:flutter/material.dart';
import '../../values/dimen/app_dimen.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final AppIconButtonType type;
  final AppIconButtonSize size;
  final String? tooltip;
  
  const AppIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.type = AppIconButtonType.primary,
    this.size = AppIconButtonSize.medium,
    this.tooltip,
  });
  
  @override
  Widget build(BuildContext context) {
    final buttonStyle = _getButtonStyle(context);
    final buttonSize = _getButtonSize();
    
    Widget button = _buildButton(buttonStyle, buttonSize);
    
    if (tooltip != null) {
      button = Tooltip(
        message: tooltip!,
        child: button,
      );
    }
    
    return button;
  }
  
  Widget _buildButton(ButtonStyle buttonStyle, double size) {
    switch (type) {
      case AppIconButtonType.primary:
        return ElevatedButton(
          onPressed: onPressed,
          style: buttonStyle,
          child: Icon(icon, size: size * 0.6),
        );
      case AppIconButtonType.secondary:
        return OutlinedButton(
          onPressed: onPressed,
          style: buttonStyle,
          child: Icon(icon, size: size * 0.6),
        );
      case AppIconButtonType.text:
        return TextButton(
          onPressed: onPressed,
          style: buttonStyle,
          child: Icon(icon, size: size * 0.6),
        );
    }
  }
  
  ButtonStyle _getButtonStyle(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    switch (type) {
      case AppIconButtonType.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 2,
          shape: const CircleBorder(),
        );
      case AppIconButtonType.secondary:
        return OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.primary),
          shape: const CircleBorder(),
        );
      case AppIconButtonType.text:
        return TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          shape: const CircleBorder(),
        );
    }
  }
  
  double _getButtonSize() {
    switch (size) {
      case AppIconButtonSize.small:
        return AppDimen.buttonHeightSmall;
      case AppIconButtonSize.medium:
        return AppDimen.buttonHeightMedium;
      case AppIconButtonSize.large:
        return AppDimen.buttonHeightLarge;
    }
  }
}

enum AppIconButtonType {
  primary,
  secondary,
  text,
}

enum AppIconButtonSize {
  small,
  medium,
  large,
}
