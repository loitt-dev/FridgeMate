import 'package:flutter/material.dart';

/// Theme Switcher Widget
///
/// A widget for switching between light and dark themes in the demo screen.
class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
      onPressed: _toggleTheme,
      tooltip: _isDarkMode ? 'Switch to light mode' : 'Switch to dark mode',
    );
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });

    // TODO: Implement actual theme switching
    // This would typically involve:
    // 1. Updating the app's theme mode
    // 2. Persisting the theme preference
    // 3. Notifying the app to rebuild with new theme

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isDarkMode ? 'Switched to dark mode' : 'Switched to light mode',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
