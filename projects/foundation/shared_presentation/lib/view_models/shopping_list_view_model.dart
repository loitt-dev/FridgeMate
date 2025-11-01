import '../base/base_view_model.dart';
import '../base/base_state.dart';
import '../mixins/loading_state_mixin.dart';
import '../mixins/error_handling_mixin.dart';

/// Shopping list ViewModel với shopping-specific functionality
///
/// Cung cấp:
/// - Shopping list management
/// - Item CRUD operations
/// - Purchase tracking
/// - Budget management
/// - Category organization
class ShoppingListViewModel extends BaseViewModel<ListState<dynamic>>
    with
        LoadingStateMixin<ListState<dynamic>>,
        ErrorHandlingMixin<ListState<dynamic>> {
  ShoppingListViewModel() : super(const ListState.initial());

  /// Shopping list items
  List<dynamic> _items = [];

  /// Purchased items
  List<dynamic> _purchasedItems = [];

  /// Total budget
  double? _totalBudget;

  /// Spent amount
  double _spentAmount = 0.0;

  /// Selected category filter
  String? _selectedCategory;

  /// Show only unpurchased items
  bool _showOnlyUnpurchased = false;

  /// Get all items
  List<dynamic> get items => List.unmodifiable(_items);

  /// Get purchased items
  List<dynamic> get purchasedItems => List.unmodifiable(_purchasedItems);

  /// Get unpurchased items
  List<dynamic> get unpurchasedItems =>
      _items.where((item) => !_purchasedItems.contains(item)).toList();

  /// Get filtered items
  List<dynamic> get filteredItems {
    var filtered = _showOnlyUnpurchased ? unpurchasedItems : _items;

    if (_selectedCategory != null) {
      filtered = filtered
          .where((item) => _getItemCategory(item) == _selectedCategory)
          .toList();
    }

    return filtered;
  }

  /// Get total budget
  double? get totalBudget => _totalBudget;

  /// Get spent amount
  double get spentAmount => _spentAmount;

  /// Get remaining budget
  double? get remainingBudget =>
      _totalBudget != null ? _totalBudget! - _spentAmount : null;

  /// Get selected category
  String? get selectedCategory => _selectedCategory;

  /// Get show only unpurchased
  bool get showOnlyUnpurchased => _showOnlyUnpurchased;

  /// Load shopping list
  Future<void> loadShoppingList(
    Future<List<dynamic>> Function() loadFunction,
  ) async {
    await executeWithLoadingAndError(
      () async {
        state = const ListState.loading();
        final items = await loadFunction();
        _items = items;
        _updatePurchasedItems();
        _calculateSpentAmount();
        state = ListState.success(_items);
      },
      onError: (error) {
        state = ListState.error(_getErrorMessage(error));
      },
    );
  }

  /// Add item to shopping list
  Future<void> addItem(
    dynamic item,
    Future<dynamic> Function(dynamic item) addFunction,
  ) async {
    await executeWithLoadingAndError(
      () async {
        final newItem = await addFunction(item);
        _items.add(newItem);
        state = ListState.success(_items);
      },
      onError: (error) {
        state = ListState.error(_getErrorMessage(error));
      },
    );
  }

  /// Update item in shopping list
  Future<void> updateItem(
    dynamic oldItem,
    dynamic newItem,
    Future<dynamic> Function(dynamic item) updateFunction,
  ) async {
    await executeWithLoadingAndError(
      () async {
        final updatedItem = await updateFunction(newItem);
        final index = _items.indexOf(oldItem);
        if (index != -1) {
          _items[index] = updatedItem;
          _updatePurchasedItems();
          _calculateSpentAmount();
          state = ListState.success(_items);
        }
      },
      onError: (error) {
        state = ListState.error(_getErrorMessage(error));
      },
    );
  }

  /// Remove item from shopping list
  Future<void> removeItem(
    dynamic item,
    Future<void> Function(dynamic item) removeFunction,
  ) async {
    await executeWithLoadingAndError(
      () async {
        await removeFunction(item);
        _items.remove(item);
        _purchasedItems.remove(item);
        _calculateSpentAmount();
        state = ListState.success(_items);
      },
      onError: (error) {
        state = ListState.error(_getErrorMessage(error));
      },
    );
  }

  /// Toggle item purchased status
  Future<void> toggleItemPurchased(
    dynamic item,
    Future<bool> Function(dynamic item) toggleFunction,
  ) async {
    await executeWithLoadingAndError(
      () async {
        final isPurchased = await toggleFunction(item);
        if (isPurchased) {
          if (!_purchasedItems.contains(item)) {
            _purchasedItems.add(item);
          }
        } else {
          _purchasedItems.remove(item);
        }
        _calculateSpentAmount();
        state = ListState.success(_items);
      },
      onError: (error) {
        state = ListState.error(_getErrorMessage(error));
      },
    );
  }

  /// Mark all items as purchased
  Future<void> markAllAsPurchased(
    Future<void> Function(List<dynamic> items) markFunction,
  ) async {
    await executeWithLoadingAndError(
      () async {
        final unpurchased = unpurchasedItems;
        await markFunction(unpurchased);
        _purchasedItems.addAll(unpurchased);
        _calculateSpentAmount();
        state = ListState.success(_items);
      },
      onError: (error) {
        state = ListState.error(_getErrorMessage(error));
      },
    );
  }

  /// Clear purchased items
  Future<void> clearPurchasedItems(
    Future<void> Function(List<dynamic> items) clearFunction,
  ) async {
    await executeWithLoadingAndError(
      () async {
        await clearFunction(_purchasedItems);
        _purchasedItems.clear();
        _calculateSpentAmount();
        state = ListState.success(_items);
      },
      onError: (error) {
        state = ListState.error(_getErrorMessage(error));
      },
    );
  }

  /// Set total budget
  void setTotalBudget(double? budget) {
    _totalBudget = budget;
  }

  /// Set selected category filter
  void setSelectedCategory(String? category) {
    _selectedCategory = category;
  }

  /// Toggle show only unpurchased
  void toggleShowOnlyUnpurchased() {
    _showOnlyUnpurchased = !_showOnlyUnpurchased;
    state = ListState.success(_items);
  }

  /// Clear all filters
  void clearFilters() {
    _selectedCategory = null;
    _showOnlyUnpurchased = false;
    state = ListState.success(_items);
  }

  /// Get items by category
  List<dynamic> getItemsByCategory(String category) {
    return _items.where((item) => _getItemCategory(item) == category).toList();
  }

  /// Get all categories
  List<String> getAllCategories() {
    return _items.map((item) => _getItemCategory(item)).toSet().toList();
  }

  /// Get urgent items
  List<dynamic> getUrgentItems() {
    return _items.where((item) => _isItemUrgent(item)).toList();
  }

  /// Update purchased items from items
  void _updatePurchasedItems() {
    _purchasedItems = _items.where((item) => _isItemPurchased(item)).toList();
  }

  /// Calculate spent amount
  void _calculateSpentAmount() {
    _spentAmount = _purchasedItems.fold(
      0.0,
      (sum, item) => sum + (_getItemPrice(item) ?? 0.0),
    );
  }

  /// Get item category (override in concrete implementations)
  String _getItemCategory(dynamic item) {
    // This should be overridden in concrete implementations
    return item.category ?? 'Khác';
  }

  /// Check if item is purchased (override in concrete implementations)
  bool _isItemPurchased(dynamic item) {
    // This should be overridden in concrete implementations
    return item.isPurchased ?? false;
  }

  /// Check if item is urgent (override in concrete implementations)
  bool _isItemUrgent(dynamic item) {
    // This should be overridden in concrete implementations
    return item.isUrgent ?? false;
  }

  /// Get item price (override in concrete implementations)
  double? _getItemPrice(dynamic item) {
    // This should be overridden in concrete implementations
    return item.price;
  }

  /// Get error message
  String _getErrorMessage(Object error) {
    if (error is Exception) {
      return error.toString();
    }
    return 'Đã xảy ra lỗi không xác định.';
  }

  // Override mixin methods
  @override
  void setLoading() {
    if (state is! ListLoadingState) {
      state = const ListState.loading();
    }
  }

  @override
  void clearLoading() {
    // Loading is handled by state transitions
  }

  @override
  void setError(String message, [Object? error]) {
    state = ListState.error(message, error);
  }

  @override
  void clearError() {
    // Error is cleared when new operation starts
  }
}

/// Shopping list summary ViewModel
class ShoppingListSummaryViewModel extends BaseViewModel<BaseState<dynamic>>
    with
        LoadingStateMixin<BaseState<dynamic>>,
        ErrorHandlingMixin<BaseState<dynamic>> {
  ShoppingListSummaryViewModel() : super(const BaseState.initial());

  /// Shopping list summary data
  dynamic _summaryData;

  /// Get summary data
  dynamic get summaryData => _summaryData;

  /// Load shopping list summary
  Future<void> loadSummary(Future<dynamic> Function() loadFunction) async {
    await executeWithLoadingAndError(
      () async {
        state = const BaseState.loading();
        final summary = await loadFunction();
        _summaryData = summary;
        state = BaseState.success(summary);
      },
      onError: (error) {
        state = BaseState.error(_getErrorMessage(error));
      },
    );
  }

  /// Refresh summary
  Future<void> refreshSummary(Future<dynamic> Function() loadFunction) async {
    await loadSummary(loadFunction);
  }

  /// Get error message
  String _getErrorMessage(Object error) {
    if (error is Exception) {
      return error.toString();
    }
    return 'Đã xảy ra lỗi không xác định.';
  }

  // Override mixin methods
  @override
  void setLoading() {
    if (state is! LoadingState) {
      state = const BaseState.loading();
    }
  }

  @override
  void clearLoading() {
    // Loading is handled by state transitions
  }

  @override
  void setError(String message, [Object? error]) {
    state = BaseState.error(message, error);
  }

  @override
  void clearError() {
    // Error is cleared when new operation starts
  }
}
