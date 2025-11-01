import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:design_system/design_system.dart';
import 'showcases/buttons_showcase.dart';
import 'showcases/inputs_showcase.dart';
import 'showcases/cards_showcase.dart';
import 'showcases/badges_showcase.dart';
import 'showcases/chips_showcase.dart';
import 'showcases/dialogs_showcase.dart';
import 'showcases/icons_showcase.dart';
import 'showcases/enhanced_buttons_showcase.dart';
import 'widgets/search_delegate.dart';
import 'widgets/theme_switcher.dart';
import 'providers/theme_provider.dart';

/// Design System Demo Screen
///
/// A comprehensive showcase of all design system components organized by categories.
/// Features tab-based navigation, search functionality, and interactive component testing.
class DesignSystemDemoScreen extends ConsumerStatefulWidget {
  const DesignSystemDemoScreen({super.key});

  @override
  ConsumerState<DesignSystemDemoScreen> createState() =>
      _DesignSystemDemoScreenState();
}

class _DesignSystemDemoScreenState extends ConsumerState<DesignSystemDemoScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  // Component categories
  final List<ComponentCategory> _categories = [
    ComponentCategory(
      name: 'Buttons & Actions',
      icon: Icons.touch_app,
      description: 'Interactive buttons and action components',
    ),
    ComponentCategory(
      name: 'Input Components',
      icon: Icons.input,
      description: 'Form inputs and user input components',
    ),
    ComponentCategory(
      name: 'Cards & Display',
      icon: Icons.card_membership,
      description: 'Card layouts and display components',
    ),
    ComponentCategory(
      name: 'Badges & Status',
      icon: Icons.badge,
      description: 'Status indicators and badge components',
    ),
    ComponentCategory(
      name: 'Chips & Tags',
      icon: Icons.label,
      description: 'Chip and tag components for categorization',
    ),
    ComponentCategory(
      name: 'Dialogs & Feedback',
      icon: Icons.feedback,
      description: 'Modal dialogs and user feedback components',
    ),
    ComponentCategory(
      name: 'Icons & Graphics',
      icon: Icons.image,
      description: 'Icon system and graphic components',
    ),
    ComponentCategory(
      name: 'Interactive Demo',
      icon: Icons.tune,
      description: 'Interactive component playground with live properties',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design System Demo'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ComponentSearchDelegate(components: allComponents),
              );
            },
          ),
          const ThemeSwitcher(),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: _categories
              .map(
                (category) =>
                    Tab(icon: Icon(category.icon), text: category.name),
              )
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _categories.map((category) {
          return _buildCategoryContent(category);
        }).toList(),
      ),
    );
  }

  Widget _buildCategoryContent(ComponentCategory category) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category header
          _buildCategoryHeader(category),
          const SizedBox(height: 24),
          // Component showcase
          _buildComponentShowcase(category),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader(ComponentCategory category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              category.icon,
              size: 32,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    category.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildComponentShowcase(ComponentCategory category) {
    // Return appropriate showcase based on category
    switch (category.name) {
      case 'Buttons & Actions':
        return const ButtonsShowcase();
      case 'Input Components':
        return const InputsShowcase();
      case 'Cards & Display':
        return const CardsShowcase();
      case 'Badges & Status':
        return const BadgesShowcase();
      case 'Chips & Tags':
        return const ChipsShowcase();
      case 'Dialogs & Feedback':
        return const DialogsShowcase();
      case 'Icons & Graphics':
        return const IconsShowcase();
      case 'Interactive Demo':
        return const EnhancedButtonsShowcase();
      default:
        return _buildPlaceholderShowcase(category);
    }
  }

  Widget _buildPlaceholderShowcase(ComponentCategory category) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(
            category.icon,
            size: 48,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            '${category.name} Components',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Component showcase will be implemented here',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Component category model
class ComponentCategory {
  final String name;
  final IconData icon;
  final String description;

  const ComponentCategory({
    required this.name,
    required this.icon,
    required this.description,
  });
}
