import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import '../widgets/component_showcase_card.dart';

/// Chips & Tags Showcase
///
/// Showcase of all chip and tag components in the design system.
class ChipsShowcase extends StatefulWidget {
  const ChipsShowcase({super.key});

  @override
  State<ChipsShowcase> createState() => _ChipsShowcaseState();
}

class _ChipsShowcaseState extends State<ChipsShowcase> {
  final List<CategoryType> _selectedCategories = [CategoryType.beverage];
  final List<CategoryType> _availableCategories = CategoryType.values;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CategoryChip Examples
        ComponentShowcaseCard(
          title: 'CategoryChip',
          description:
              'Chip component for categorizing items with different styles',
          example: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Available Categories:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _availableCategories.map((category) {
                  final isSelected = _selectedCategories.contains(category);
                  return CategoryChip(
                    label: category.name,
                    category: category, // Default category
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selectedCategories.remove(category);
                        } else {
                          _selectedCategories.add(category);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              Text(
                'Selected: ${_selectedCategories.join(', ')}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          codeSnippet: '''CategoryChip(
  label: 'Food',
  category: CategoryType.other,
  isSelected: true,
  onTap: () {},
)

CategoryChip(
  label: 'Drinks',
  category: CategoryType.beverage,
  isSelected: false,
  onTap: () {},
)''',
          controls: [
            Text('Selected: ${_selectedCategories.length}'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedCategories.clear();
                });
              },
              child: const Text('Clear All'),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Standard Chip Examples
        ComponentShowcaseCard(
          title: 'Standard Chips',
          description: 'Various chip styles for different use cases',
          example: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Action chips
              Text(
                'Action Chips:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ActionChip(
                    label: const Text('Add Item'),
                    onPressed: () {},
                    avatar: const Icon(Icons.add, size: 18),
                  ),
                  ActionChip(
                    label: const Text('Filter'),
                    onPressed: () {},
                    avatar: const Icon(Icons.filter_list, size: 18),
                  ),
                  ActionChip(
                    label: const Text('Sort'),
                    onPressed: () {},
                    avatar: const Icon(Icons.sort, size: 18),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Choice chips
              Text(
                'Choice Chips:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ChoiceChip(
                    label: const Text('All'),
                    selected: true,
                    onSelected: (selected) {},
                  ),
                  ChoiceChip(
                    label: const Text('Recent'),
                    selected: false,
                    onSelected: (selected) {},
                  ),
                  ChoiceChip(
                    label: const Text('Favorites'),
                    selected: false,
                    onSelected: (selected) {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Filter chips
              Text(
                'Filter Chips:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  FilterChip(
                    label: const Text('Vegetarian'),
                    selected: true,
                    onSelected: (selected) {},
                  ),
                  FilterChip(
                    label: const Text('Gluten Free'),
                    selected: false,
                    onSelected: (selected) {},
                  ),
                  FilterChip(
                    label: const Text('Organic'),
                    selected: true,
                    onSelected: (selected) {},
                  ),
                ],
              ),
            ],
          ),
          codeSnippet: '''ActionChip(
  label: Text('Add Item'),
  onPressed: () {},
  avatar: Icon(Icons.add, size: 18),
)

ChoiceChip(
  label: Text('All'),
  selected: true,
  onSelected: (selected) {},
)

FilterChip(
  label: Text('Vegetarian'),
  selected: true,
  onSelected: (selected) {},
)''',
        ),

        const SizedBox(height: 24),

        // Custom Chip Examples
        ComponentShowcaseCard(
          title: 'Custom Chips',
          description: 'Custom styled chips with different colors and shapes',
          example: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              // Custom colored chips
              Chip(
                label: const Text('High Priority'),
                backgroundColor: Colors.red.shade100,
                labelStyle: TextStyle(color: Colors.red.shade800),
                avatar: Icon(Icons.priority_high, color: Colors.red.shade800),
              ),
              Chip(
                label: const Text('Medium Priority'),
                backgroundColor: Colors.orange.shade100,
                labelStyle: TextStyle(color: Colors.orange.shade800),
                avatar: Icon(Icons.remove, color: Colors.orange.shade800),
              ),
              Chip(
                label: const Text('Low Priority'),
                backgroundColor: Colors.green.shade100,
                labelStyle: TextStyle(color: Colors.green.shade800),
                avatar: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.green.shade800,
                ),
              ),
              // Rounded chips
              Chip(
                label: const Text('Rounded'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.blue.shade100,
                labelStyle: TextStyle(color: Colors.blue.shade800),
              ),
              // Outlined chips
              Chip(
                label: const Text('Outlined'),
                backgroundColor: Colors.transparent,
                side: BorderSide(color: Colors.grey.shade400),
                labelStyle: TextStyle(color: Colors.grey.shade700),
              ),
            ],
          ),
          codeSnippet: '''Chip(
  label: Text('High Priority'),
  backgroundColor: Colors.red.shade100,
  labelStyle: TextStyle(color: Colors.red.shade800),
  avatar: Icon(Icons.priority_high, color: Colors.red.shade800),
)

Chip(
  label: Text('Rounded'),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  backgroundColor: Colors.blue.shade100,
  labelStyle: TextStyle(color: Colors.blue.shade800),
)''',
        ),
      ],
    );
  }
}
