import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain/domain.dart';
import 'package:dartz/dartz.dart';
import '../screens/home/fridge_home_view_model.dart';
import '../screens/home/fridge_home_state.dart';

/// Provider for GetExpiringItemsUseCase
///
/// TODO: Replace with actual DI injection when use case is implemented
final getExpiringItemsUseCaseProvider = Provider<GetExpiringItemsUseCase>((
  ref,
) {
  throw UnimplementedError(
    'GetExpiringItemsUseCase provider not implemented. '
    'This should be provided by DI container.',
  );
});

/// Provider for GetSuggestedRecipesUseCase
///
/// TODO: Replace with actual DI injection when use case is implemented
final getSuggestedRecipesUseCaseProvider = Provider<GetSuggestedRecipesUseCase>(
  (ref) {
    throw UnimplementedError(
      'GetSuggestedRecipesUseCase provider not implemented. '
      'This should be provided by DI container.',
    );
  },
);

/// StateNotifier provider for FridgeHomeViewModel
///
/// Manages the state of the home dashboard screen
/// Currently uses mock data for development
final fridgeHomeViewModelProvider =
    StateNotifierProvider<FridgeHomeViewModel, FridgeHomeState>((ref) {
      // TODO: Replace with actual use cases from DI container
      // For now, create mock implementations to avoid errors
      final mockExpiringItemsUseCase = _MockGetExpiringItemsUseCase();
      final mockSuggestedRecipesUseCase = _MockGetSuggestedRecipesUseCase();

      return FridgeHomeViewModel(
        getExpiringItemsUseCase: mockExpiringItemsUseCase,
        getSuggestedRecipesUseCase: mockSuggestedRecipesUseCase,
      );
    });

/// Convenience provider for just the state
final fridgeHomeStateProvider = Provider<FridgeHomeState>((ref) {
  return ref.watch(fridgeHomeViewModelProvider);
});

// ============================================
// Selective providers for specific state slices
// ============================================

/// Provider for loading state
final isLoadingProvider = Provider<bool>((ref) {
  return ref.watch(
    fridgeHomeViewModelProvider.select((state) => state.isLoading),
  );
});

/// Provider for error message
final errorMessageProvider = Provider<String?>((ref) {
  return ref.watch(
    fridgeHomeViewModelProvider.select((state) => state.errorMessage),
  );
});

/// Provider for fridge item count
final fridgeItemCountProvider = Provider<int>((ref) {
  return ref.watch(
    fridgeHomeViewModelProvider.select((state) => state.fridgeItemCount),
  );
});

/// Provider for expiring items counts
final expiringCountsProvider = Provider<ExpiringCounts>((ref) {
  final state = ref.watch(fridgeHomeViewModelProvider);
  return ExpiringCounts(
    today: state.todayExpiryCount,
    threeDays: state.threeDaysExpiryCount,
    week: state.weekExpiryCount,
  );
});

/// Provider for expiring items preview
final expiringItemsPreviewProvider = Provider<List<StorageItem>>((ref) {
  return ref.watch(
    fridgeHomeViewModelProvider.select((state) => state.expiringItemsPreview),
  );
});

/// Provider for recipe suggestions
final recipeSuggestionsProvider = Provider<List<Recipe>>((ref) {
  return ref.watch(
    fridgeHomeViewModelProvider.select((state) => state.suggestedRecipes),
  );
});

/// Provider for shopping list count
final shoppingItemCountProvider = Provider<int>((ref) {
  return ref.watch(
    fridgeHomeViewModelProvider.select((state) => state.shoppingItemCount),
  );
});

/// Provider for shopping items preview
final shoppingItemsPreviewProvider = Provider<List<String>>((ref) {
  return ref.watch(
    fridgeHomeViewModelProvider.select((state) => state.shoppingItemsPreview),
  );
});

/// Provider for bottom nav index
final bottomNavIndexProvider = Provider<int>((ref) {
  return ref.watch(
    fridgeHomeViewModelProvider.select((state) => state.selectedBottomNavIndex),
  );
});

// ============================================
// Helper classes
// ============================================

/// Data class for expiring counts
class ExpiringCounts {
  final int today;
  final int threeDays;
  final int week;

  const ExpiringCounts({
    required this.today,
    required this.threeDays,
    required this.week,
  });

  int get total => today + threeDays + week;
}

// ============================================
// Mock implementations for development
// TODO: Remove when real use cases are available
// ============================================

class _MockGetExpiringItemsUseCase implements GetExpiringItemsUseCase {
  @override
  Future<Either<CommonFailure, List<StorageItem>>> call(int params) async {
    // Return empty list for now
    return const Right([]);
  }
}

class _MockGetSuggestedRecipesUseCase implements GetSuggestedRecipesUseCase {
  @override
  Future<Either<CommonFailure, List<Recipe>>> call(
    GetSuggestedRecipesParams params,
  ) async {
    // Return empty list for now
    return const Right([]);
  }
}
