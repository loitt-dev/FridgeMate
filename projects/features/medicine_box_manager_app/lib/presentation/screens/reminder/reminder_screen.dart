import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:design_system/design_system.dart';
import 'package:common/common.dart';
import 'reminder_view_model.dart';
import 'reminder_state.dart';

/// Provider for ReminderViewModel
final reminderViewModelProvider =
    StateNotifierProvider<ReminderViewModel, ReminderState>((ref) {
  return ReminderViewModel();
});

/// Reminder Screen - Placeholder
class ReminderScreen extends ConsumerStatefulWidget {
  const ReminderScreen({super.key});

  @override
  ConsumerState<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends ConsumerState<ReminderScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(reminderViewModelProvider.notifier).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(reminderViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nhắc Nhở Uống Thuốc',
          style: context.textTheme.titleLarge,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.alarm,
              size: 64,
              color: context.colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Màn Hình Nhắc Nhở',
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
