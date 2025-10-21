import 'package:flutter/material.dart';
import '../../values/dimen/app_dimen.dart';

class AppBottomSheet extends StatelessWidget {
  final Widget child;
  final String? title;
  final List<Widget>? actions;
  final bool isScrollControlled;
  final bool showDragHandle;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? contentPadding;
  
  const AppBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.actions,
    this.isScrollControlled = false,
    this.showDragHandle = true,
    this.backgroundColor,
    this.contentPadding,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppDimen.radiusLarge),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showDragHandle) _buildDragHandle(colorScheme),
          if (title != null) _buildTitle(context, title!),
          if (actions != null) _buildActions(actions!),
          Flexible(
            child: Padding(
              padding: contentPadding ?? const EdgeInsets.all(AppDimen.paddingLarge),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildDragHandle(ColorScheme colorScheme) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppDimen.paddingSmall),
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: colorScheme.outline,
        borderRadius: BorderRadius.circular(AppDimen.radiusSmall),
      ),
    );
  }
  
  Widget _buildTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimen.paddingLarge,
        vertical: AppDimen.paddingMedium,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
  
  Widget _buildActions(List<Widget> actions) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimen.paddingLarge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: actions,
      ),
    );
  }
  
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    List<Widget>? actions,
    bool isScrollControlled = false,
    bool showDragHandle = true,
    Color? backgroundColor,
    EdgeInsetsGeometry? contentPadding,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent,
      builder: (context) => AppBottomSheet(
        title: title,
        actions: actions,
        isScrollControlled: isScrollControlled,
        showDragHandle: showDragHandle,
        backgroundColor: backgroundColor,
        contentPadding: contentPadding,
        child: child,
      ),
    );
  }
}
