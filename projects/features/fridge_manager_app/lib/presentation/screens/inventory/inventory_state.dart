import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_state.freezed.dart';

/// State for Inventory Screen
@freezed
class InventoryState with _$InventoryState {
  const factory InventoryState({
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _InventoryState;

  factory InventoryState.initial() => const InventoryState();
}
