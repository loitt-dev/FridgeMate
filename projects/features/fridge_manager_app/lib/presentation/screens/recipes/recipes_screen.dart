import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:design_system/design_system.dart';
import 'package:common/common.dart';
import 'recipes_view_model.dart';
import 'recipes_state.dart';

/// Provider for RecipesViewModel
final recipesViewModelProvider =
    StateNotifierProvider<RecipesViewModel, RecipesState>((ref) {
  return RecipesViewModel();
});

/// Recipes Screen - Placeholder
class RecipesScreen extends ConsumerStatefulWidget {
  const RecipesScreen({super.key});

  @override
  ConsumerState<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends ConsumerState<RecipesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(recipesViewModelProvider.notifier).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(recipesViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Công Thức Nấu Ăn',
          style: context.textTheme.titleLarge,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant_menu,
              size: 64,
              color: context.colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Màn Hình Công Thức',
              style: context.textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Placeholder - Chưa implement',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.showInfoSnackBar('Tính năng đang phát triển');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
