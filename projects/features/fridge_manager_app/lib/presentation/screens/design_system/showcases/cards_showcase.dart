import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import '../widgets/component_showcase_card.dart';

/// Cards & Display Showcase
///
/// Showcase of all card and display components in the design system.
class CardsShowcase extends StatefulWidget {
  const CardsShowcase({super.key});

  @override
  State<CardsShowcase> createState() => _CardsShowcaseState();
}

class _CardsShowcaseState extends State<CardsShowcase> {
  bool _cardSelected = false;
  String _chipSelected = 'All';

  final List<String> _chipOptions = ['All', 'Food', 'Drinks', 'Snacks'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppCard Examples
        ComponentShowcaseCard(
          title: 'AppCard',
          description:
              'Card component with customizable styling and interactions',
          example: Column(
            children: [
              AppCard(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sample Card',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'This is a sample card with content inside.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text('Action'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              AppCard(
                onTap: () {
                  setState(() {
                    _cardSelected = !_cardSelected;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(
                        _cardSelected
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: _cardSelected ? Colors.green : Colors.grey,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Selectable Card',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          codeSnippet: '''AppCard(
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        Text('Sample Card'),
        Text('Card content here'),
      ],
    ),
  ),
)

AppCard(
  onTap: () {},
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text('Clickable Card'),
  ),
)''',
          controls: [
            Switch(
              value: _cardSelected,
              onChanged: (value) {
                setState(() {
                  _cardSelected = value;
                });
              },
            ),
            const Text('Selected'),
          ],
        ),

        const SizedBox(height: 24),

        // AppChip Examples
        ComponentShowcaseCard(
          title: 'AppChip',
          description: 'Chip component for tags and categories',
          example: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              AppChip(label: 'Default Chip', onTap: () {}),
              AppChip(label: 'Selected Chip', selected: true, onTap: () {}),
              AppChip(label: 'Another Chip', onTap: () {}),
              AppChip(label: 'Disabled Chip', onTap: null),
            ],
          ),
          codeSnippet: '''AppChip(
  label: 'Default Chip',
  onTap: () {},
)

AppChip(
  label: 'Selected Chip',
  selected: true,
  onTap: () {},
)

AppChip(
  label: 'Disabled Chip',
  onTap: null,
)''',
        ),

        const SizedBox(height: 24),

        // AppListTile Examples
        ComponentShowcaseCard(
          title: 'AppListTile',
          description: 'List tile component for displaying items in lists',
          example: Column(
            children: [
              AppListTile(
                leading: const Icon(Icons.person),
                title: const Text('John Doe'),
                subtitle: const Text('Software Developer'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              const Divider(),
              AppListTile(
                leading: const Icon(Icons.email),
                title: const Text('Email'),
                subtitle: const Text('john.doe@example.com'),
                trailing: const Icon(Icons.edit),
                onTap: () {},
              ),
              const Divider(),
              AppListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Phone'),
                subtitle: const Text('+1 (555) 123-4567'),
                trailing: const Icon(Icons.call),
                onTap: () {},
              ),
            ],
          ),
          codeSnippet: '''AppListTile(
  leading: Icon(Icons.person),
  title: Text('John Doe'),
  subtitle: Text('Software Developer'),
  trailing: Icon(Icons.arrow_forward_ios),
  onTap: () {},
)

AppListTile(
  leading: Icon(Icons.email),
  title: Text('Email'),
  subtitle: Text('john.doe@example.com'),
  trailing: Icon(Icons.edit),
  onTap: () {},
)''',
        ),
      ],
    );
  }
}
