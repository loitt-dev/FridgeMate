import '../base/base_view_model.dart';
import '../base/base_state.dart';
import '../mixins/loading_state_mixin.dart';
import '../mixins/error_handling_mixin.dart';
import '../mixins/pagination_mixin.dart';

/// Generic item list ViewModel với common functionality
///
/// Cung cấp:
/// - Item list management
/// - Loading states
/// - Error handling
/// - Pagination support
/// - Search functionality
class ItemListViewModel<T> extends BaseViewModel<ListState<T>>
    with
        LoadingStateMixin<ListState<T>>,
        ErrorHandlingMixin<ListState<T>>,
        PaginationMixin<ListState<T>> {
  ItemListViewModel() : super(const ListState.initial());

  /// Load initial items
  Future<void> loadItems(Future<List<T>> Function() loadFunction) async {
    await executeWithLoadingAndError(
      () async {
        state = const ListState.loading();
        final items = await loadFunction();
        state = ListState.success(items, hasMore: items.length >= 20);
      },
      onError: (error) {
        state = ListState.error(_getErrorMessage(error));
      },
    );
  }

  /// Load more items
  Future<void> loadMoreItems(
    Future<List<T>> Function(int page, int pageSize) loadFunction,
  ) async {
    if (state is ListLoadingMoreState || !hasMore) return;

    await executeWithLoadingAndError(
      () async {
        final currentItems = _getCurrentItems();
        state = ListState.loadingMore(currentItems);

        final nextPage = currentPage + 1;
        final newItems = await loadFunction(nextPage, pageSize);

        if (newItems.isEmpty) {
          state = ListState.success(currentItems, hasMore: false);
        } else {
          final allItems = [...currentItems, ...newItems];
          state = ListState.success(
            allItems,
            hasMore: newItems.length >= pageSize,
          );
        }
      },
      onError: (error) {
        state = ListState.error(_getErrorMessage(error));
      },
    );
  }

  /// Refresh items
  Future<void> refreshItems(Future<List<T>> Function() loadFunction) async {
    await executeWithLoadingAndError(
      () async {
        final currentItems = _getCurrentItems();
        state = ListState.refreshing(currentItems);

        final items = await loadFunction();
        state = ListState.success(items, hasMore: items.length >= 20);
      },
      onError: (error) {
        state = ListState.error(_getErrorMessage(error));
      },
    );
  }

  /// Add item to list
  void addItem(T item) {
    final currentItems = _getCurrentItems();
    final newItems = [...currentItems, item];
    state = ListState.success(newItems, hasMore: hasMore);
  }

  /// Remove item from list
  void removeItem(T item) {
    final currentItems = _getCurrentItems();
    final newItems = currentItems.where((i) => i != item).toList();
    state = ListState.success(newItems, hasMore: hasMore);
  }

  /// Update item in list
  void updateItem(T oldItem, T newItem) {
    final currentItems = _getCurrentItems();
    final index = currentItems.indexOf(oldItem);
    if (index != -1) {
      final newItems = [...currentItems];
      newItems[index] = newItem;
      state = ListState.success(newItems, hasMore: hasMore);
    }
  }

  /// Clear all items
  void clearItems() {
    state = const ListState.initial();
  }

  /// Get current items from state
  List<T> _getCurrentItems() {
    return state.when(
      initial: () => [],
      loading: () => [],
      loadingMore: (items) => items,
      success: (items, hasMore) => items,
      error: (message, error) => [],
      refreshing: (items) => items,
    );
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

/// Searchable item list ViewModel
class SearchableItemListViewModel<T> extends ItemListViewModel<T>
    with SearchPaginationMixin<ListState<T>> {
  SearchableItemListViewModel() : super();

  /// Search items
  Future<void> searchItems(
    String query,
    Future<List<T>> Function(String query) searchFunction,
  ) async {
    await search(query, searchFunction);
  }

  /// Clear search
  void clearSearch() {
    super.clearSearch();
    // Reset to initial state
    state = const ListState.initial();
  }

  String _getErrorMessage(Object error) {
    if (error is Exception) {
      return error.toString();
    }
    return 'Đã xảy ra lỗi không xác định.';
  }
}

/// Filterable item list ViewModel
class FilterableItemListViewModel<T> extends ItemListViewModel<T> {
  final Map<String, dynamic> _filters = {};

  /// Get current filters
  Map<String, dynamic> get filters => Map.unmodifiable(_filters);

  /// Set filter
  void setFilter(String key, dynamic value) {
    _filters[key] = value;
  }

  /// Remove filter
  void removeFilter(String key) {
    _filters.remove(key);
  }

  /// Clear all filters
  void clearFilters() {
    _filters.clear();
  }

  /// Apply filters
  Future<void> applyFilters(
    Future<List<T>> Function(Map<String, dynamic> filters) filterFunction,
  ) async {
    await executeWithLoadingAndError(
      () async {
        state = const ListState.loading();
        final filteredItems = await filterFunction(_filters);
        state = ListState.success(filteredItems);
      },
      onError: (error) {
        state = ListState.error(_getErrorMessage(error));
      },
    );
  }

  String _getErrorMessage(Object error) {
    if (error is Exception) {
      return error.toString();
    }
    return 'Đã xảy ra lỗi không xác định.';
  }
}

/// Sortable item list ViewModel
class SortableItemListViewModel<T> extends ItemListViewModel<T> {
  String? _sortBy;
  bool _isAscending = true;

  /// Get current sort
  String? get sortBy => _sortBy;
  bool get isAscending => _isAscending;

  /// Set sort
  void setSort(String? field, {bool ascending = true}) {
    _sortBy = field;
    _isAscending = ascending;
  }

  /// Toggle sort direction
  void toggleSortDirection() {
    _isAscending = !_isAscending;
  }

  /// Apply sort
  Future<void> applySort(
    Future<List<T>> Function(String? field, bool ascending) sortFunction,
  ) async {
    await executeWithLoadingAndError(
      () async {
        state = const ListState.loading();
        final sortedItems = await sortFunction(_sortBy, _isAscending);
        state = ListState.success(sortedItems);
      },
      onError: (error) {
        state = ListState.error(_getErrorMessage(error));
      },
    );
  }

  String _getErrorMessage(Object error) {
    if (error is Exception) {
      return error.toString();
    }
    return 'Đã xảy ra lỗi không xác định.';
  }
}
