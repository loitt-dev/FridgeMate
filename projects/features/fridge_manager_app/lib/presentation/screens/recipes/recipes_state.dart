import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipes_state.freezed.dart';

/// State for Recipes Screen
@freezed
class RecipesState with _$RecipesState {
  const factory RecipesState({
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _RecipesState;

  factory RecipesState.initial() => const RecipesState();
}
