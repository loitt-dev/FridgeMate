import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'shopping_list_state.dart';

/// ViewModel for Shopping List Screen
class ShoppingListViewModel extends StateNotifier<ShoppingListState> {
  ShoppingListViewModel() : super(ShoppingListState.initial());

  /// Initialize screen
  Future<void> initialize() async {
    // TODO: Implement initialization logic
  }
}
