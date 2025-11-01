import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:design_system/design_system.dart';
import 'package:common/common.dart';
import 'shopping_list_view_model.dart';
import 'shopping_list_state.dart';

/// Provider for ShoppingListViewModel
final shoppingListViewModelProvider =
    StateNotifierProvider<ShoppingListViewModel, ShoppingListState>((ref) {
  return ShoppingListViewModel();
});

/// Shopping List Screen - Placeholder
class ShoppingListScreen extends ConsumerStatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  ConsumerState<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends ConsumerState<ShoppingListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(shoppingListViewModelProvider.notifier).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(shoppingListViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Danh Sách Mua Sắm',
          style: context.textTheme.titleLarge,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 64,
              color: context.colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Màn Hình Danh Sách Mua Sắm',
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
