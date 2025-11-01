import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_list_state.freezed.dart';

/// State for Shopping List Screen
@freezed
class ShoppingListState with _$ShoppingListState {
  const factory ShoppingListState({
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _ShoppingListState;

  factory ShoppingListState.initial() => const ShoppingListState();
}
