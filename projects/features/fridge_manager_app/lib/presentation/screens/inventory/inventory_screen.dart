import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:design_system/design_system.dart';
import 'package:common/common.dart';
import 'inventory_view_model.dart';
import 'inventory_state.dart';

/// Provider for InventoryViewModel
final inventoryViewModelProvider =
    StateNotifierProvider<InventoryViewModel, InventoryState>((ref) {
  return InventoryViewModel();
});

/// Inventory Screen - Placeholder
class InventoryScreen extends ConsumerStatefulWidget {
  const InventoryScreen({super.key});

  @override
  ConsumerState<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends ConsumerState<InventoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(inventoryViewModelProvider.notifier).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(inventoryViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kho Thực Phẩm',
          style: context.textTheme.titleLarge,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 64,
              color: context.colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Màn Hình Kho Thực Phẩm',
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
