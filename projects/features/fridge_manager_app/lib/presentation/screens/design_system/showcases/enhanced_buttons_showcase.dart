import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import '../widgets/component_showcase_card.dart';
import '../widgets/component_properties_panel.dart';

/// Enhanced Buttons Showcase with interactive properties
///
/// Demonstrates advanced interactive features for button components.
class EnhancedButtonsShowcase extends StatefulWidget {
  const EnhancedButtonsShowcase({super.key});

  @override
  State<EnhancedButtonsShowcase> createState() =>
      _EnhancedButtonsShowcaseState();
}

class _EnhancedButtonsShowcaseState extends State<EnhancedButtonsShowcase> {
  // AppButton properties
  AppButtonVariant _buttonVariant = AppButtonVariant.primary;
  bool _buttonEnabled = true;
  bool _buttonLoading = false;
  double _buttonWidth = 200;

  // AppFab properties
  AppFabSize _fabSize = AppFabSize.medium;
  bool _fabExtended = false;

  // AppIconButton properties
  AppIconButtonType _iconButtonType = AppIconButtonType.primary;

  // Properties panel states
  bool _buttonPropertiesExpanded = false;
  bool _fabPropertiesExpanded = false;
  bool _iconButtonPropertiesExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Enhanced AppButton Example
        ComponentShowcaseCard(
          title: 'AppButton - Interactive',
          description: 'Explore different button variants and properties',
          example: SizedBox(
            width: _buttonWidth,
            child: AppButton(
              text: _buttonLoading ? 'Loading...' : 'Interactive Button',
              onPressed: _buttonEnabled && !_buttonLoading
                  ? () {
                      setState(() {
                        _buttonLoading = true;
                      });
                      Future.delayed(const Duration(seconds: 2), () {
                        if (mounted) {
                          setState(() {
                            _buttonLoading = false;
                          });
                        }
                      });
                    }
                  : null,
              variant: _buttonVariant,
              isLoading: _buttonLoading,
              isEnabled: _buttonEnabled,
              width: _buttonWidth,
            ),
          ),
          codeSnippet:
              '''AppButton(
  text: '${_buttonLoading ? 'Loading...' : 'Interactive Button'}',
  onPressed: ${_buttonEnabled && !_buttonLoading ? '() {}' : 'null'},
  variant: AppButtonVariant.${_buttonVariant.name},
  isLoading: $_buttonLoading,
)''',
          propertiesPanel: ComponentPropertiesPanel(
            title: 'Button Properties',
            isExpanded: _buttonPropertiesExpanded,
            onToggle: () {
              setState(() {
                _buttonPropertiesExpanded = !_buttonPropertiesExpanded;
              });
            },
            properties: [
              EnumPropertyControl<AppButtonVariant>(
                label: 'Variant',
                description: 'Button style variant',
                value: _buttonVariant,
                options: AppButtonVariant.values,
                onChanged: (value) {
                  setState(() {
                    _buttonVariant = value;
                  });
                },
              ),
              BooleanPropertyControl(
                label: 'Enabled',
                description: 'Whether the button is enabled',
                value: _buttonEnabled,
                onChanged: (value) {
                  setState(() {
                    _buttonEnabled = value;
                  });
                },
              ),
              BooleanPropertyControl(
                label: 'Loading',
                description: 'Show loading state',
                value: _buttonLoading,
                onChanged: (value) {
                  setState(() {
                    _buttonLoading = value;
                  });
                },
              ),
              NumericPropertyControl(
                label: 'Width',
                description: 'Button width in pixels',
                value: _buttonWidth,
                min: 100,
                max: 300,
                divisions: 20,
                onChanged: (value) {
                  setState(() {
                    _buttonWidth = value;
                  });
                },
                displayValue: (value) => '${value.round()}px',
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Enhanced AppFab Example
        ComponentShowcaseCard(
          title: 'AppFab - Interactive',
          description: 'Floating action button with customizable properties',
          example: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppFab(
                icon: Icons.add,
                onPressed: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('FAB pressed!')));
                },
                size: _fabSize,
              ),
            ],
          ),
          codeSnippet:
              '''AppFab(
  icon: Icons.add,
  onPressed: () {},
  size: AppFabSize.${_fabSize.name},
)''',
          propertiesPanel: ComponentPropertiesPanel(
            title: 'FAB Properties',
            isExpanded: _fabPropertiesExpanded,
            onToggle: () {
              setState(() {
                _fabPropertiesExpanded = !_fabPropertiesExpanded;
              });
            },
            properties: [
              EnumPropertyControl<AppFabSize>(
                label: 'Size',
                description: 'FAB size variant',
                value: _fabSize,
                options: AppFabSize.values,
                onChanged: (value) {
                  setState(() {
                    _fabSize = value;
                  });
                },
              ),
              BooleanPropertyControl(
                label: 'Extended',
                description: 'Show as extended FAB with text',
                value: _fabExtended,
                onChanged: (value) {
                  setState(() {
                    _fabExtended = value;
                  });
                },
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Enhanced AppIconButton Example
        ComponentShowcaseCard(
          title: 'AppIconButton - Interactive',
          description: 'Icon button with customizable size and color',
          example: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIconButton(
                icon: Icons.favorite,
                type: _iconButtonType,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Icon button pressed!')),
                  );
                },
              ),
            ],
          ),
          codeSnippet: '''AppIconButton(
  icon: Icons.favorite,
  onPressed: () {},
)''',
          propertiesPanel: ComponentPropertiesPanel(
            title: 'Icon Button Properties',
            isExpanded: _iconButtonPropertiesExpanded,
            onToggle: () {
              setState(() {
                _iconButtonPropertiesExpanded = !_iconButtonPropertiesExpanded;
              });
            },
            properties: [
              EnumPropertyControl<AppIconButtonType>(
                label: 'Type',
                description: 'Icon button type variant',
                value: _iconButtonType,
                options: AppIconButtonType.values,
                onChanged: (value) {
                  setState(() {
                    _iconButtonType = value;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
