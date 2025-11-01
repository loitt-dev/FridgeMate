import 'package:flutter/material.dart';

/// Search delegate for finding components in the design system demo
class ComponentSearchDelegate extends SearchDelegate<String> {
  final List<ComponentSearchItem> components;

  ComponentSearchDelegate({required this.components});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final filteredComponents = components
        .where(
          (component) =>
              component.name.toLowerCase().contains(query.toLowerCase()) ||
              component.description.toLowerCase().contains(
                query.toLowerCase(),
              ) ||
              component.category.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    if (filteredComponents.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No components found',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Try searching for buttons, inputs, cards, etc.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredComponents.length,
      itemBuilder: (context, index) {
        final component = filteredComponents[index];
        return ListTile(
          leading: Icon(component.icon),
          title: Text(component.name),
          subtitle: Text(component.description),
          trailing: Chip(
            label: Text(component.category),
            backgroundColor: _getCategoryColor(component.category),
          ),
          onTap: () {
            close(context, component.name);
            // Navigate to the specific component category
            _navigateToComponent(context, component);
          },
        );
      },
    );
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'buttons & actions':
        return Colors.blue.shade100;
      case 'input components':
        return Colors.green.shade100;
      case 'cards & display':
        return Colors.orange.shade100;
      case 'badges & status':
        return Colors.red.shade100;
      case 'chips & tags':
        return Colors.purple.shade100;
      case 'dialogs & feedback':
        return Colors.teal.shade100;
      case 'icons & graphics':
        return Colors.indigo.shade100;
      default:
        return Colors.grey.shade100;
    }
  }

  void _navigateToComponent(
    BuildContext context,
    ComponentSearchItem component,
  ) {
    // This would navigate to the specific tab/component
    // For now, we'll just show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navigate to ${component.name} in ${component.category}'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

/// Model for searchable component items
class ComponentSearchItem {
  final String name;
  final String description;
  final String category;
  final IconData icon;
  final int tabIndex;

  ComponentSearchItem({
    required this.name,
    required this.description,
    required this.category,
    required this.icon,
    required this.tabIndex,
  });
}

/// Predefined list of all components for search
final List<ComponentSearchItem> allComponents = [
  // Buttons & Actions
  ComponentSearchItem(
    name: 'AppButton',
    description: 'Primary button component with multiple variants',
    category: 'Buttons & Actions',
    icon: Icons.touch_app_outlined,
    tabIndex: 0,
  ),
  ComponentSearchItem(
    name: 'AppFab',
    description: 'Floating action button with different sizes',
    category: 'Buttons & Actions',
    icon: Icons.touch_app_outlined,
    tabIndex: 0,
  ),
  ComponentSearchItem(
    name: 'AppIconButton',
    description: 'Icon button for various actions',
    category: 'Buttons & Actions',
    icon: Icons.touch_app_outlined,
    tabIndex: 0,
  ),

  // Input Components
  ComponentSearchItem(
    name: 'AppTextField',
    description: 'Text input field with various configurations',
    category: 'Input Components',
    icon: Icons.edit_note,
    tabIndex: 1,
  ),
  ComponentSearchItem(
    name: 'AppSearchBar',
    description: 'Search input component with pill-shaped design',
    category: 'Input Components',
    icon: Icons.edit_note,
    tabIndex: 1,
  ),
  ComponentSearchItem(
    name: 'AppCheckbox',
    description: 'Checkbox component for boolean selections',
    category: 'Input Components',
    icon: Icons.edit_note,
    tabIndex: 1,
  ),
  ComponentSearchItem(
    name: 'AppSwitch',
    description: 'Switch component for toggle actions',
    category: 'Input Components',
    icon: Icons.edit_note,
    tabIndex: 1,
  ),
  ComponentSearchItem(
    name: 'AppDropdown',
    description: 'Dropdown component for single selection',
    category: 'Input Components',
    icon: Icons.edit_note,
    tabIndex: 1,
  ),
  ComponentSearchItem(
    name: 'AppRadio',
    description: 'Radio button component for single selection',
    category: 'Input Components',
    icon: Icons.edit_note,
    tabIndex: 1,
  ),

  // Cards & Display
  ComponentSearchItem(
    name: 'AppCard',
    description: 'Card component with customizable styling and interactions',
    category: 'Cards & Display',
    icon: Icons.dashboard_outlined,
    tabIndex: 2,
  ),
  ComponentSearchItem(
    name: 'AppChip',
    description: 'Chip component for tags and categories',
    category: 'Cards & Display',
    icon: Icons.dashboard_outlined,
    tabIndex: 2,
  ),
  ComponentSearchItem(
    name: 'AppListTile',
    description: 'List tile component for displaying items in lists',
    category: 'Cards & Display',
    icon: Icons.dashboard_outlined,
    tabIndex: 2,
  ),

  // Badges & Status
  ComponentSearchItem(
    name: 'ExpiryBadge',
    description: 'Badge component for displaying expiry status of items',
    category: 'Badges & Status',
    icon: Icons.notification_important_outlined,
    tabIndex: 3,
  ),

  // Chips & Tags
  ComponentSearchItem(
    name: 'CategoryChip',
    description: 'Chip component for categorizing items with different styles',
    category: 'Chips & Tags',
    icon: Icons.label_outline,
    tabIndex: 4,
  ),

  // Dialogs & Feedback
  ComponentSearchItem(
    name: 'AppDialog',
    description: 'Modal dialog component for user interactions',
    category: 'Dialogs & Feedback',
    icon: Icons.message_outlined,
    tabIndex: 5,
  ),
  ComponentSearchItem(
    name: 'AppBottomSheet',
    description: 'Bottom sheet component for additional actions and content',
    category: 'Dialogs & Feedback',
    icon: Icons.message_outlined,
    tabIndex: 5,
  ),
  ComponentSearchItem(
    name: 'AppSnackbar',
    description: 'Snackbar component for showing feedback messages',
    category: 'Dialogs & Feedback',
    icon: Icons.message_outlined,
    tabIndex: 5,
  ),

  // Icons & Graphics
  ComponentSearchItem(
    name: 'AppIcon',
    description: 'Custom icon component with consistent styling',
    category: 'Icons & Graphics',
    icon: Icons.image_outlined,
    tabIndex: 6,
  ),
];
