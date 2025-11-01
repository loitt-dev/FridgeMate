import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'component_properties_panel.dart';

/// Component Showcase Card
///
/// A reusable widget for displaying component examples with code snippets
/// and interactive controls.
class ComponentShowcaseCard extends StatefulWidget {
  final String title;
  final String description;
  final Widget example;
  final String codeSnippet;
  final List<Widget>? controls;
  final bool showCode;
  final ComponentPropertiesPanel? propertiesPanel;

  const ComponentShowcaseCard({
    super.key,
    required this.title,
    required this.description,
    required this.example,
    required this.codeSnippet,
    this.controls,
    this.showCode = true,
    this.propertiesPanel,
  });

  @override
  State<ComponentShowcaseCard> createState() => _ComponentShowcaseCardState();
}

class _ComponentShowcaseCardState extends State<ComponentShowcaseCard> {
  bool _showCode = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      elevation: 2,
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.showCode)
                  IconButton(
                    icon: Icon(_showCode ? Icons.code_off : Icons.code),
                    onPressed: () {
                      setState(() {
                        _showCode = !_showCode;
                      });
                    },
                    tooltip: _showCode ? 'Hide code' : 'Show code',
                  ),
              ],
            ),
            const SizedBox(height: 16),

            // Example
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                ),
              ),
              child: widget.example,
            ),

            // Controls
            if (widget.controls != null && widget.controls!.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                'Interactive Controls',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(spacing: 8, runSpacing: 8, children: widget.controls!),
            ],

            // Properties Panel
            if (widget.propertiesPanel != null) ...[
              const SizedBox(height: 16),
              widget.propertiesPanel!,
            ],

            // Code snippet
            if (widget.showCode && _showCode) ...[
              const SizedBox(height: 16),
              _buildCodeSnippet(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCodeSnippet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Code Example',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.copy),
              onPressed: _copyCode,
              tooltip: 'Copy code',
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SelectableText(
            widget.codeSnippet,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontFamily: 'monospace'),
          ),
        ),
      ],
    );
  }

  void _copyCode() {
    Clipboard.setData(ClipboardData(text: widget.codeSnippet));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Code copied to clipboard'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
