import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'recipes_state.dart';

/// ViewModel for Recipes Screen
class RecipesViewModel extends StateNotifier<RecipesState> {
  RecipesViewModel() : super(RecipesState.initial());

  /// Initialize screen
  Future<void> initialize() async {
    // TODO: Implement initialization logic
  }
}
