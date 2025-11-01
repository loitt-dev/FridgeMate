import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import '../widgets/component_showcase_card.dart';

/// Badges & Status Showcase
///
/// Showcase of all badge and status components in the design system.
class BadgesShowcase extends StatefulWidget {
  const BadgesShowcase({super.key});

  @override
  State<BadgesShowcase> createState() => _BadgesShowcaseState();
}

class _BadgesShowcaseState extends State<BadgesShowcase> {
  int _daysUntilExpiry = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ExpiryBadge Examples
        ComponentShowcaseCard(
          title: 'ExpiryBadge',
          description: 'Badge component for displaying expiry status of items',
          example: Column(
            children: [
              // Good status
              Row(
                children: [
                  const ExpiryBadge(status: ExpiryStatus.fresh),
                  const SizedBox(width: 16),
                  const Text('Fresh - Good condition'),
                ],
              ),
              const SizedBox(height: 12),
              // Warning status
              Row(
                children: [
                  const ExpiryBadge(status: ExpiryStatus.expiringSoon),
                  const SizedBox(width: 16),
                  const Text('Expiring Soon - Check soon'),
                ],
              ),
              const SizedBox(height: 12),
              // Critical status
              Row(
                children: [
                  const ExpiryBadge(status: ExpiryStatus.expired),
                  const SizedBox(width: 16),
                  const Text('Expired - Discard'),
                ],
              ),
              const SizedBox(height: 12),
              // Unknown status
              Row(
                children: [
                  const ExpiryBadge(status: ExpiryStatus.unknown),
                  const SizedBox(width: 16),
                  const Text('Unknown - Check manually'),
                ],
              ),
            ],
          ),
          codeSnippet:
              '''ExpiryBadge(status: ExpiryStatus.fresh)        // Fresh status
ExpiryBadge(status: ExpiryStatus.expiringSoon)  // Expiring soon
ExpiryBadge(status: ExpiryStatus.expired)       // Expired status
ExpiryBadge(status: ExpiryStatus.unknown)       // Unknown status''',
          controls: [
            Text('Status: ${_getStatusFromDays(_daysUntilExpiry)}'),
            Slider(
              value: _daysUntilExpiry.toDouble(),
              min: -5,
              max: 15,
              divisions: 20,
              onChanged: (value) {
                setState(() {
                  _daysUntilExpiry = value.round();
                });
              },
            ),
            Text('Days until expiry: $_daysUntilExpiry'),
            const SizedBox(height: 8),
            ExpiryBadge(status: _getStatusFromDays(_daysUntilExpiry)),
          ],
        ),

        const SizedBox(height: 24),

        // Standard Badge Examples
        ComponentShowcaseCard(
          title: 'Standard Badges',
          description: 'Various badge styles for different use cases',
          example: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              // Number badge
              Badge(
                label: const Text('5'),
                child: const Icon(Icons.notifications),
              ),
              // Text badge
              Badge(label: const Text('New'), child: const Icon(Icons.star)),
              // Color badge
              Badge(
                backgroundColor: Colors.green,
                label: const Text('Active'),
                child: const Icon(Icons.check_circle),
              ),
              // Error badge
              Badge(
                backgroundColor: Colors.red,
                label: const Text('Error'),
                child: const Icon(Icons.error),
              ),
              // Warning badge
              Badge(
                backgroundColor: Colors.orange,
                label: const Text('Warning'),
                child: const Icon(Icons.warning),
              ),
              // Info badge
              Badge(
                backgroundColor: Colors.blue,
                label: const Text('Info'),
                child: const Icon(Icons.info),
              ),
            ],
          ),
          codeSnippet: '''Badge(
  label: Text('5'),
  child: Icon(Icons.notifications),
)

Badge(
  label: Text('New'),
  child: Icon(Icons.star),
)

Badge(
  backgroundColor: Colors.green,
  label: Text('Active'),
  child: Icon(Icons.check_circle),
)

Badge(
  backgroundColor: Colors.red,
  label: Text('Error'),
  child: Icon(Icons.error),
)''',
        ),

        const SizedBox(height: 24),

        // Status Indicators
        ComponentShowcaseCard(
          title: 'Status Indicators',
          description: 'Visual indicators for different states and statuses',
          example: Column(
            children: [
              // Online status
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('Online'),
                ],
              ),
              const SizedBox(height: 8),
              // Offline status
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('Offline'),
                ],
              ),
              const SizedBox(height: 8),
              // Busy status
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('Busy'),
                ],
              ),
              const SizedBox(height: 8),
              // Away status
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('Away'),
                ],
              ),
            ],
          ),
          codeSnippet: '''Container(
  width: 12,
  height: 12,
  decoration: BoxDecoration(
    color: Colors.green,
    shape: BoxShape.circle,
  ),
)

Container(
  width: 12,
  height: 12,
  decoration: BoxDecoration(
    color: Colors.grey,
    shape: BoxShape.circle,
  ),
)''',
        ),
      ],
    );
  }

  ExpiryStatus _getStatusFromDays(int days) {
    if (days > 7) return ExpiryStatus.fresh;
    if (days > 0) return ExpiryStatus.expiringSoon;
    if (days == 0) return ExpiryStatus.expired;
    return ExpiryStatus.unknown;
  }
}
