import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Base screen với common functionality
///
/// Cung cấp:
/// - Common app bar
/// - Loading overlay
/// - Error handling
/// - Refresh functionality
abstract class BaseScreen extends ConsumerWidget {
  const BaseScreen({super.key});

  /// Build the main content
  Widget buildContent(BuildContext context, WidgetRef ref);

  /// Optional app bar
  PreferredSizeWidget? buildAppBar(BuildContext context, WidgetRef ref) => null;

  /// Optional floating action button
  Widget? buildFloatingActionButton(BuildContext context, WidgetRef ref) =>
      null;

  /// Optional bottom navigation bar
  Widget? buildBottomNavigationBar(BuildContext context, WidgetRef ref) => null;

  /// Optional drawer
  Widget? buildDrawer(BuildContext context, WidgetRef ref) => null;

  /// Optional end drawer
  Widget? buildEndDrawer(BuildContext context, WidgetRef ref) => null;

  /// Handle pull to refresh
  Future<void> onRefresh(BuildContext context, WidgetRef ref) async {
    // Default implementation - override in concrete screens
  }

  /// Handle error display
  void onError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  /// Show loading dialog
  void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
  }

  /// Hide loading dialog
  void hideLoading(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: buildAppBar(context, ref),
      body: RefreshIndicator(
        onRefresh: () => onRefresh(context, ref),
        child: buildContent(context, ref),
      ),
      floatingActionButton: buildFloatingActionButton(context, ref),
      bottomNavigationBar: buildBottomNavigationBar(context, ref),
      drawer: buildDrawer(context, ref),
      endDrawer: buildEndDrawer(context, ref),
    );
  }
}

/// Base screen với state management
abstract class BaseStatefulScreen<T> extends ConsumerStatefulWidget {
  const BaseStatefulScreen({super.key});

  @override
  BaseStatefulScreenState<T> createState() => BaseStatefulScreenState<T>();
}

class BaseStatefulScreenState<T> extends ConsumerState<BaseStatefulScreen<T>> {
  /// Handle state changes
  void handleState(T state) {
    // Override in concrete screens
  }

  /// Handle error
  void handleError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  /// Show loading
  void showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
  }

  /// Hide loading
  void hideLoading() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder(); // Override in concrete screens
  }
}
