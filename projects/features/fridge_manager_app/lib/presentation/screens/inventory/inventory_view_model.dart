import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'inventory_state.dart';

/// ViewModel for Inventory Screen
class InventoryViewModel extends StateNotifier<InventoryState> {
  InventoryViewModel() : super(InventoryState.initial());

  /// Initialize screen
  Future<void> initialize() async {
    // TODO: Implement initialization logic
  }
}
