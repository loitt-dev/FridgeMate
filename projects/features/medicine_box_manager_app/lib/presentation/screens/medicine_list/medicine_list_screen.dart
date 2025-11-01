import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:common/common.dart';
import 'package:go_router/go_router.dart' as go;
import 'medicine_list_view_model.dart';
import 'medicine_list_state.dart';

/// Provider for MedicineListViewModel
final medicineListViewModelProvider =
    StateNotifierProvider<MedicineListViewModel, MedicineListState>((ref) {
  return MedicineListViewModel();
});

/// Medicine List Screen - Placeholder
class MedicineListScreen extends ConsumerStatefulWidget {
  const MedicineListScreen({super.key});

  @override
  ConsumerState<MedicineListScreen> createState() => _MedicineListScreenState();
}

class _MedicineListScreenState extends ConsumerState<MedicineListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(medicineListViewModelProvider.notifier).initialize();
    });
  }

  void _navigateToReminder() {
    go.GoRouter.of(context).pushNamed('reminder');
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(medicineListViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Danh Sách Thuốc',
          style: context.textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.alarm),
            onPressed: _navigateToReminder,
            tooltip: 'Nhắc nhở',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.medication_outlined,
              size: 64,
              color: context.colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Màn Hình Danh Sách Thuốc',
              style: context.textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Placeholder - Chưa implement',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _navigateToReminder,
              icon: const Icon(Icons.alarm),
              label: const Text('Xem Nhắc Nhở'),
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
