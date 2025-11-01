import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import '../widgets/component_showcase_card.dart';

/// Dialogs & Feedback Showcase
///
/// Showcase of all dialog and feedback components in the design system.
class DialogsShowcase extends StatefulWidget {
  const DialogsShowcase({super.key});

  @override
  State<DialogsShowcase> createState() => _DialogsShowcaseState();
}

class _DialogsShowcaseState extends State<DialogsShowcase> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppDialog Examples
        ComponentShowcaseCard(
          title: 'AppDialog',
          description: 'Modal dialog component for user interactions',
          example: Column(
            children: [
              ElevatedButton(
                onPressed: () => _showAppDialog(context),
                child: const Text('Show App Dialog'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _showConfirmationDialog(context),
                child: const Text('Show Confirmation Dialog'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _showAlertDialog(context),
                child: const Text('Show Alert Dialog'),
              ),
            ],
          ),
          codeSnippet: '''AppDialog(
  title: 'Dialog Title',
  content: Text('Dialog content goes here'),
  actions: [
    TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Text('Cancel'),
    ),
    ElevatedButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Text('Confirm'),
    ),
  ],
)''',
        ),

        const SizedBox(height: 24),

        // AppBottomSheet Examples
        ComponentShowcaseCard(
          title: 'AppBottomSheet',
          description:
              'Bottom sheet component for additional actions and content',
          example: Column(
            children: [
              ElevatedButton(
                onPressed: () => _showAppBottomSheet(context),
                child: const Text('Show App Bottom Sheet'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _showActionBottomSheet(context),
                child: const Text('Show Action Bottom Sheet'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _showListBottomSheet(context),
                child: const Text('Show List Bottom Sheet'),
              ),
            ],
          ),
          codeSnippet: '''AppBottomSheet(
  title: 'Bottom Sheet Title',
  child: Column(
    children: [
      ListTile(
        leading: Icon(Icons.share),
        title: Text('Share'),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.copy),
        title: Text('Copy'),
        onTap: () {},
      ),
    ],
  ),
)''',
        ),

        const SizedBox(height: 24),

        // AppSnackbar Examples
        ComponentShowcaseCard(
          title: 'AppSnackbar',
          description: 'Snackbar component for showing feedback messages',
          example: Column(
            children: [
              ElevatedButton(
                onPressed: () => _showSuccessSnackbar(context),
                child: const Text('Show Success Snackbar'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _showErrorSnackbar(context),
                child: const Text('Show Error Snackbar'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _showInfoSnackbar(context),
                child: const Text('Show Info Snackbar'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _showActionSnackbar(context),
                child: const Text('Show Action Snackbar'),
              ),
            ],
          ),
          codeSnippet: '''AppSnackbar.show(
  context: context,
  message: 'Success message',
  type: AppSnackbarType.success,
)

AppSnackbar.show(
  context: context,
  message: 'Error message',
  type: AppSnackbarType.error,
)

AppSnackbar.show(
  context: context,
  message: 'Info message',
  type: AppSnackbarType.info,
)''',
        ),

        const SizedBox(height: 24),

        // Standard Dialog Examples
        ComponentShowcaseCard(
          title: 'Standard Dialogs',
          description: 'Standard Material Design dialog components',
          example: Column(
            children: [
              ElevatedButton(
                onPressed: () => _showSimpleDialog(context),
                child: const Text('Show Simple Dialog'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _showDatePicker(context),
                child: const Text('Show Date Picker'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _showTimePicker(context),
                child: const Text('Show Time Picker'),
              ),
            ],
          ),
          codeSnippet: '''showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: Text('Alert'),
    content: Text('This is an alert dialog'),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text('OK'),
      ),
    ],
  ),
)

showDatePicker(
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime(2020),
  lastDate: DateTime(2030),
)

showTimePicker(
  context: context,
  initialTime: TimeOfDay.now(),
)''',
        ),
      ],
    );
  }

  void _showAppDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AppDialog(
        title: 'App Dialog',
        content: const Text('This is an AppDialog component example.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AppDialog(
        title: 'Confirm Action',
        content: const Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AppDialog(
        title: 'Alert',
        content: const Text('This is an alert message.'),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showAppBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => AppBottomSheet(
        title: 'App Bottom Sheet',
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share'),
              subtitle: Text('Share this item'),
            ),
            ListTile(
              leading: Icon(Icons.copy),
              title: Text('Copy'),
              subtitle: Text('Copy to clipboard'),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit'),
              subtitle: Text('Edit this item'),
            ),
          ],
        ),
      ),
    );
  }

  void _showActionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => AppBottomSheet(
        title: 'Actions',
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(leading: Icon(Icons.add), title: Text('Add Item')),
            ListTile(leading: Icon(Icons.remove), title: Text('Remove Item')),
            ListTile(leading: Icon(Icons.edit), title: Text('Edit Item')),
          ],
        ),
      ),
    );
  }

  void _showListBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => AppBottomSheet(
        title: 'Select Option',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            ListTile(
              leading: Icon(Icons.check_circle_outline),
              title: Text('Option 1'),
            ),
            ListTile(
              leading: Icon(Icons.check_circle_outline),
              title: Text('Option 2'),
            ),
            ListTile(
              leading: Icon(Icons.check_circle_outline),
              title: Text('Option 3'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessSnackbar(BuildContext context) {
    AppSnackbar.show(
      context: context,
      message: 'Operation completed successfully!',
      type: AppSnackbarType.success,
    );
  }

  void _showErrorSnackbar(BuildContext context) {
    AppSnackbar.show(
      context: context,
      message: 'An error occurred. Please try again.',
      type: AppSnackbarType.error,
    );
  }

  void _showInfoSnackbar(BuildContext context) {
    AppSnackbar.show(
      context: context,
      message: 'This is an informational message.',
      type: AppSnackbarType.info,
    );
  }

  void _showActionSnackbar(BuildContext context) {
    AppSnackbar.show(
      context: context,
      message: 'Item deleted successfully.',
      type: AppSnackbarType.info,
    );
  }

  void _showSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Select Option'),
        children: [
          SimpleDialogOption(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Option 1'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Option 2'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Option 3'),
          ),
        ],
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
  }

  void _showTimePicker(BuildContext context) {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }
}
