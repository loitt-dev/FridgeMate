import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/theme_provider.dart';

/// Theme Switcher Widget
///
/// A widget for switching between light and dark themes in the demo screen.
class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final themeNotifier = ref.read(themeModeProvider.notifier);

    return PopupMenuButton<ThemeMode>(
      icon: Icon(_getThemeIcon(themeMode)),
      tooltip: 'Change theme',
      onSelected: (ThemeMode mode) {
        themeNotifier.setThemeMode(mode);
        _showThemeChangeSnackbar(context, mode);
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: ThemeMode.system,
          child: Row(
            children: [
              Icon(
                Icons.brightness_auto,
                color: themeMode == ThemeMode.system ? Colors.blue : null,
              ),
              const SizedBox(width: 8),
              Text(
                'System',
                style: TextStyle(
                  color: themeMode == ThemeMode.system ? Colors.blue : null,
                  fontWeight: themeMode == ThemeMode.system
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: ThemeMode.light,
          child: Row(
            children: [
              Icon(
                Icons.light_mode,
                color: themeMode == ThemeMode.light ? Colors.blue : null,
              ),
              const SizedBox(width: 8),
              Text(
                'Light',
                style: TextStyle(
                  color: themeMode == ThemeMode.light ? Colors.blue : null,
                  fontWeight: themeMode == ThemeMode.light
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: ThemeMode.dark,
          child: Row(
            children: [
              Icon(
                Icons.dark_mode,
                color: themeMode == ThemeMode.dark ? Colors.blue : null,
              ),
              const SizedBox(width: 8),
              Text(
                'Dark',
                style: TextStyle(
                  color: themeMode == ThemeMode.dark ? Colors.blue : null,
                  fontWeight: themeMode == ThemeMode.dark
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  IconData _getThemeIcon(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.dark:
        return Icons.dark_mode;
      case ThemeMode.system:
        return Icons.brightness_auto;
    }
  }

  void _showThemeChangeSnackbar(BuildContext context, ThemeMode mode) {
    final String themeName = mode.name.toLowerCase();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Switched to $themeName theme'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
