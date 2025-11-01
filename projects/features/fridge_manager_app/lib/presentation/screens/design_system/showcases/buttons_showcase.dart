import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import '../widgets/component_showcase_card.dart';

/// Buttons Showcase
/// 
/// Showcase of all button components in the design system.
class ButtonsShowcase extends StatefulWidget {
  const ButtonsShowcase({super.key});

  @override
  State<ButtonsShowcase> createState() => _ButtonsShowcaseState();
}

class _ButtonsShowcaseState extends State<ButtonsShowcase> {
  bool _buttonEnabled = true;
  bool _fabExtended = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppButton Examples
        ComponentShowcaseCard(
          title: 'AppButton',
          description: 'Primary button component with multiple variants',
          example: Column(
            children: [
              // Primary Button
              AppButton(
                text: 'Primary Button',
                onPressed: _buttonEnabled ? () {} : null,
                variant: AppButtonVariant.primary,
              ),
              const SizedBox(height: 12),
              // Secondary Button
              AppButton(
                text: 'Secondary Button',
                onPressed: _buttonEnabled ? () {} : null,
                variant: AppButtonVariant.secondary,
              ),
              const SizedBox(height: 12),
              // Outline Button
              AppButton(
                text: 'Outline Button',
                onPressed: _buttonEnabled ? () {} : null,
                variant: AppButtonVariant.outline,
              ),
            ],
          ),
          codeSnippet: '''AppButton(
  text: 'Primary Button',
  onPressed: () {},
  variant: AppButtonVariant.primary,
)

AppButton(
  text: 'Secondary Button',
  onPressed: () {},
  variant: AppButtonVariant.secondary,
)

AppButton(
  text: 'Outline Button',
  onPressed: () {},
  variant: AppButtonVariant.outline,
)''',
          controls: [
            Switch(
              value: _buttonEnabled,
              onChanged: (value) {
                setState(() {
                  _buttonEnabled = value;
                });
              },
            ),
            const Text('Enable/Disable'),
          ],
        ),
        
        const SizedBox(height: 24),
        
        // AppFab Examples
        ComponentShowcaseCard(
          title: 'AppFab',
          description: 'Floating Action Button with extended variant',
          example: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Regular FAB
              AppFab(
                icon: Icons.add,
                onPressed: () {},
              ),
              // Extended FAB (using regular FAB for now)
              AppFab(
                icon: Icons.add,
                onPressed: () {},
              ),
            ],
          ),
          codeSnippet: '''AppFab(
  icon: Icons.add,
  onPressed: () {},
)

AppFab(
  icon: Icons.add,
  onPressed: () {},
)''',
          controls: [
            Switch(
              value: _fabExtended,
              onChanged: (value) {
                setState(() {
                  _fabExtended = value;
                });
              },
            ),
            const Text('Demo Switch'),
          ],
        ),
        
        const SizedBox(height: 24),
        
        // AppIconButton Examples
        ComponentShowcaseCard(
          title: 'AppIconButton',
          description: 'Icon button component with different styles',
          example: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppIconButton(
                icon: Icons.favorite,
                onPressed: () {},
              ),
              AppIconButton(
                icon: Icons.share,
                onPressed: () {},
              ),
              AppIconButton(
                icon: Icons.bookmark,
                onPressed: () {},
              ),
            ],
          ),
          codeSnippet: '''AppIconButton(
  icon: Icons.favorite,
  onPressed: () {},
)

AppIconButton(
  icon: Icons.share,
  onPressed: () {},
)

AppIconButton(
  icon: Icons.bookmark,
  onPressed: () {},
)''',
        ),
      ],
    );
  }
}
