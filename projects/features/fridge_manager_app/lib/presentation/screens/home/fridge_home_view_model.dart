import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain/domain.dart';
import 'fridge_home_state.dart';

/// ViewModel for Fridge Home Screen
///
/// Manages business logic and state for the dashboard:
/// - Fetches storage statistics
/// - Loads expiring items
/// - Gets recipe suggestions
/// - Manages shopping list preview
class FridgeHomeViewModel extends StateNotifier<FridgeHomeState> {
  // final GetStorageStatsUseCase _getStorageStatsUseCase; // TODO: Implement use case
  final GetExpiringItemsUseCase _getExpiringItemsUseCase;
  final GetSuggestedRecipesUseCase _getSuggestedRecipesUseCase;
  // TODO: Add GetShoppingListUseCase when available

  FridgeHomeViewModel({
    // required GetStorageStatsUseCase getStorageStatsUseCase, // TODO: Implement use case
    required GetExpiringItemsUseCase getExpiringItemsUseCase,
    required GetSuggestedRecipesUseCase getSuggestedRecipesUseCase,
  }) : // _getStorageStatsUseCase = getStorageStatsUseCase,
       _getExpiringItemsUseCase = getExpiringItemsUseCase,
       _getSuggestedRecipesUseCase = getSuggestedRecipesUseCase,
       super(FridgeHomeState.initial()) {
    // Load initial data
    _loadMockData();
  }

  /// Load all dashboard data
  Future<void> loadDashboardData() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      // Load data in parallel
      await Future.wait([
        _loadStorageStats(),
        _loadExpiringItems(),
        _loadRecipeSuggestions(),
        // _loadShoppingList(), // TODO: Implement when shopping list use case is ready
      ]);

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Không thể tải dữ liệu: ${e.toString()}',
      );
    }
  }

  /// Refresh dashboard data (pull-to-refresh)
  Future<void> refreshDashboard() async {
    state = state.copyWith(isRefreshing: true, errorMessage: null);

    try {
      await Future.wait([
        _loadStorageStats(),
        _loadExpiringItems(),
        _loadRecipeSuggestions(),
      ]);

      state = state.copyWith(isRefreshing: false);
    } catch (e) {
      state = state.copyWith(
        isRefreshing: false,
        errorMessage: 'Không thể làm mới dữ liệu: ${e.toString()}',
      );
    }
  }

  /// Load storage statistics
  Future<void> _loadStorageStats() async {
    // TODO: Implement when GetStorageStatsUseCase is available
    // For now, use mock data
    await Future.delayed(const Duration(milliseconds: 500));
    state = state.copyWith(fridgeItemCount: 42);
  }

  /// Load expiring items
  Future<void> _loadExpiringItems() async {
    // Get items expiring within 7 days
    final result = await _getExpiringItemsUseCase(7);

    result.fold(
      (failure) {
        state = state.copyWith(
          errorMessage: 'Không thể tải sản phẩm sắp hết hạn',
        );
      },
      (items) {
        // Categorize items by expiry time
        final now = DateTime.now();
        int todayCount = 0;
        int threeDaysCount = 0;
        int weekCount = 0;

        for (final item in items) {
          final daysUntilExpiry = item.expiryDate.difference(now).inDays;

          if (daysUntilExpiry <= 0) {
            todayCount++; // Expired or expires today
          } else if (daysUntilExpiry <= 3) {
            threeDaysCount++;
          } else if (daysUntilExpiry <= 7) {
            weekCount++;
          }
        }

        state = state.copyWith(
          expiringItems: items,
          todayExpiryCount: todayCount,
          threeDaysExpiryCount: threeDaysCount,
          weekExpiryCount: weekCount,
        );
      },
    );
  }

  /// Load recipe suggestions
  Future<void> _loadRecipeSuggestions() async {
    state = state.copyWith(isLoadingRecipes: true);

    // Get available ingredients from fridge
    final availableIngredients = <String>[]; // TODO: Get from fridge items

    final params = GetSuggestedRecipesParams(
      availableIngredients: availableIngredients.isEmpty
          ? null
          : availableIngredients,
      limit: 5, // Get top 5 suggestions
    );

    final result = await _getSuggestedRecipesUseCase(params);

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoadingRecipes: false,
          errorMessage: 'Không thể tải gợi ý món ăn',
        );
      },
      (recipes) {
        state = state.copyWith(
          suggestedRecipes: recipes,
          isLoadingRecipes: false,
        );
      },
    );
  }

  /// Load shopping list preview
  Future<void> _loadShoppingList() async {
    // TODO: Implement when shopping list use case is available
    // For now, use mock data
    state = state.copyWith(
      shoppingItemCount: 7,
      shoppingPreviewItems: ['Sữa tươi', 'Trứng gà', 'Cà chua'],
    );
  }

  /// Update selected bottom navigation index
  void updateBottomNavIndex(int index) {
    state = state.copyWith(selectedBottomNavIndex: index);
  }

  /// Clear error message
  void clearError() {
    state = state.copyWith(errorMessage: null);
  }

  /// Retry loading data after error
  Future<void> retry() async {
    await loadDashboardData();
  }

  /// Load mock data for development
  /// TODO: Remove when real use cases are implemented
  Future<void> _loadMockData() async {
    state = state.copyWith(isLoading: true);

    await Future.delayed(const Duration(seconds: 1));

    state = state.copyWith(
      isLoading: false,
      fridgeItemCount: 42,
      todayExpiryCount: 2,
      threeDaysExpiryCount: 5,
      weekExpiryCount: 8,
      expiringItems: [],
      suggestedRecipes: [],
      shoppingItemCount: 7,
      shoppingPreviewItems: ['Sữa tươi', 'Trứng gà', 'Cà chua'],
    );
  }
}
