import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'fridge_home_state.freezed.dart';

/// State for Fridge Home Screen
///
/// Manages the state of the dashboard including:
/// - Storage statistics
/// - Expiring items
/// - Recipe suggestions
/// - Shopping list preview
@freezed
class FridgeHomeState with _$FridgeHomeState {
  const factory FridgeHomeState({
    // Loading states
    @Default(false) bool isLoading,
    @Default(false) bool isRefreshing,

    // Error state
    String? errorMessage,

    // Fridge statistics
    @Default(0) int fridgeItemCount,
    StorageStats? fridgeStats,

    // Expiring items
    @Default(0) int todayExpiryCount,
    @Default(0) int threeDaysExpiryCount,
    @Default(0) int weekExpiryCount,
    @Default([]) List<StorageItem> expiringItems,

    // Recipe suggestions
    @Default([]) List<Recipe> suggestedRecipes,
    @Default(false) bool isLoadingRecipes,

    // Shopping list
    @Default(0) int shoppingItemCount,
    @Default([]) List<String> shoppingPreviewItems,

    // UI state
    @Default(0) int selectedBottomNavIndex,
  }) = _FridgeHomeState;

  /// Initial state factory
  factory FridgeHomeState.initial() => const FridgeHomeState();

  /// Loading state factory
  factory FridgeHomeState.loading() => const FridgeHomeState(isLoading: true);

  /// Error state factory
  factory FridgeHomeState.error(String message) =>
      FridgeHomeState(errorMessage: message, isLoading: false);
}

/// Extension for state helpers
extension FridgeHomeStateX on FridgeHomeState {
  /// Check if there are any expiring items
  bool get hasExpiringItems =>
      todayExpiryCount > 0 || threeDaysExpiryCount > 0 || weekExpiryCount > 0;

  /// Total count of expiring items
  int get totalExpiringCount =>
      todayExpiryCount + threeDaysExpiryCount + weekExpiryCount;

  /// Check if there are recipe suggestions
  bool get hasRecipeSuggestions => suggestedRecipes.isNotEmpty;

  /// Check if there are shopping items
  bool get hasShoppingItems => shoppingItemCount > 0;

  /// Check if state has any errors
  bool get hasError => errorMessage != null && errorMessage!.isNotEmpty;

  /// Get top 3 expiring items for preview
  List<StorageItem> get expiringItemsPreview => expiringItems.take(3).toList();

  /// Get top 3 shopping items for preview
  List<String> get shoppingItemsPreview =>
      shoppingPreviewItems.take(3).toList();
}
