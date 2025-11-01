import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import '../widgets/component_showcase_card.dart';

/// Inputs Showcase
///
/// Showcase of all input components in the design system.
class InputsShowcase extends StatefulWidget {
  const InputsShowcase({super.key});

  @override
  State<InputsShowcase> createState() => _InputsShowcaseState();
}

class _InputsShowcaseState extends State<InputsShowcase> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  bool _checkboxValue = false;
  bool _switchValue = false;
  String _dropdownValue = 'Option 1';
  String _radioValue = 'Option A';

  final List<String> _dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

  final List<String> _radioOptions = ['Option A', 'Option B', 'Option C'];

  @override
  void dispose() {
    _textController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppTextField Examples
        ComponentShowcaseCard(
          title: 'AppTextField',
          description: 'Text input field with various configurations',
          example: Column(
            children: [
              AppTextField(
                controller: _textController,
                label: 'Text Field',
                hint: 'Enter some text...',
              ),
              const SizedBox(height: 12),
              AppTextField(
                controller: _textController,
                label: 'Password Field',
                hint: 'Enter password...',
                obscureText: true,
              ),
            ],
          ),
          codeSnippet: '''AppTextField(
  controller: controller,
  label: 'Text Field',
  hint: 'Enter some text...',
)

AppTextField(
  controller: controller,
  label: 'Password Field',
  hint: 'Enter password...',
  obscureText: true,
)''',
        ),

        const SizedBox(height: 24),

        // AppSearchBar Examples
        ComponentShowcaseCard(
          title: 'AppSearchBar',
          description: 'Search input component with pill-shaped design',
          example: AppSearchBar(
            controller: _searchController,
            hintText: 'Search components...',
            onChanged: (value) {},
          ),
          codeSnippet: '''AppSearchBar(
  controller: controller,
  hint: 'Search components...',
  onChanged: (value) {},
)''',
        ),

        const SizedBox(height: 24),

        // AppCheckbox Examples
        ComponentShowcaseCard(
          title: 'AppCheckbox',
          description: 'Checkbox component for boolean selections',
          example: Row(
            children: [
              AppCheckbox(
                value: _checkboxValue,
                onChanged: (value) {
                  setState(() {
                    _checkboxValue = value ?? false;
                  });
                },
              ),
              const SizedBox(width: 8),
              const Text('Checkbox Option'),
            ],
          ),
          codeSnippet: '''AppCheckbox(
  value: checkboxValue,
  onChanged: (value) {
    setState(() {
      checkboxValue = value ?? false;
    });
  },
)''',
          controls: [
            Switch(
              value: _checkboxValue,
              onChanged: (value) {
                setState(() {
                  _checkboxValue = value;
                });
              },
            ),
            const Text('Checked'),
          ],
        ),

        const SizedBox(height: 24),

        // AppSwitch Examples
        ComponentShowcaseCard(
          title: 'AppSwitch',
          description: 'Switch component for toggle states',
          example: Row(
            children: [
              AppSwitch(
                value: _switchValue,
                onChanged: (value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
              ),
              const SizedBox(width: 8),
              const Text('Switch Option'),
            ],
          ),
          codeSnippet: '''AppSwitch(
  value: switchValue,
  onChanged: (value) {
    setState(() {
      switchValue = value;
    });
  },
)''',
          controls: [
            Switch(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
            const Text('Enabled'),
          ],
        ),

        const SizedBox(height: 24),

        // AppDropdown Examples
        ComponentShowcaseCard(
          title: 'AppDropdown',
          description: 'Dropdown component for single selection',
          example: AppDropdown<String>(
            value: _dropdownValue,
            items: _dropdownOptions
                .map(
                  (option) =>
                      DropdownMenuItem(value: option, child: Text(option)),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                _dropdownValue = value ?? 'Option 1';
              });
            },
            hint: 'Select an option',
          ),
          codeSnippet: '''AppDropdown<String>(
  value: dropdownValue,
  items: options.map((option) => DropdownMenuItem(
    value: option,
    child: Text(option),
  )).toList(),
  onChanged: (value) {
    setState(() {
      dropdownValue = value ?? 'Option 1';
    });
  },
  hint: 'Select an option',
)''',
        ),

        const SizedBox(height: 24),

        // AppRadio Examples
        ComponentShowcaseCard(
          title: 'AppRadio',
          description: 'Radio button component for single selection',
          example: Column(
            children: _radioOptions
                .map(
                  (option) => Row(
                    children: [
                      AppRadio<String>(
                        value: option,
                        groupValue: _radioValue,
                        onChanged: (value) {
                          setState(() {
                            _radioValue = value ?? 'Option A';
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                      Text(option),
                    ],
                  ),
                )
                .toList(),
          ),
          codeSnippet: '''AppRadio<String>(
  value: option,
  groupValue: radioValue,
  onChanged: (value) {
    setState(() {
      radioValue = value ?? 'Option A';
    });
  },
)''',
        ),
      ],
    );
  }
}
