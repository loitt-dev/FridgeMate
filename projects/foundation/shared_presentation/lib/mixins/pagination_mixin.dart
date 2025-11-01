import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Mixin để handle pagination
///
/// Cung cấp:
/// - Pagination state management
/// - Load more functionality
/// - Refresh functionality
/// - Infinite scroll support
mixin PaginationMixin<T> on StateNotifier<T> {
  /// Current page
  int _currentPage = 1;

  /// Page size
  int _pageSize = 20;

  /// Has more data
  bool _hasMore = true;

  /// Is loading more
  bool _isLoadingMore = false;

  /// Is refreshing
  bool _isRefreshing = false;

  /// Get current page
  int get currentPage => _currentPage;

  /// Get page size
  int get pageSize => _pageSize;

  /// Get has more data
  bool get hasMore => _hasMore;

  /// Get is loading more
  bool get isLoadingMore => _isLoadingMore;

  /// Get is refreshing
  bool get isRefreshing => _isRefreshing;

  /// Set page size
  void setPageSize(int size) {
    _pageSize = size;
  }

  /// Reset pagination
  void resetPagination() {
    _currentPage = 1;
    _hasMore = true;
    _isLoadingMore = false;
    _isRefreshing = false;
    _onPaginationReset();
  }

  /// Load more data
  Future<void> loadMore(
    Future<List<dynamic>> Function(int page, int pageSize) loadFunction,
  ) async {
    if (_isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;
    _onLoadingMoreChanged();

    try {
      final nextPage = _currentPage + 1;
      final newItems = await loadFunction(nextPage, _pageSize);

      if (newItems.isEmpty) {
        _hasMore = false;
      } else {
        _currentPage = nextPage;
        _onDataLoaded(newItems);
      }
    } catch (error) {
      _onLoadMoreError(error);
    } finally {
      _isLoadingMore = false;
      _onLoadingMoreChanged();
    }
  }

  /// Refresh data
  Future<void> refresh(
    Future<List<dynamic>> Function(int page, int pageSize) loadFunction,
  ) async {
    _isRefreshing = true;
    _onRefreshingChanged();

    try {
      final items = await loadFunction(1, _pageSize);
      _currentPage = 1;
      _hasMore = items.length >= _pageSize;
      _onDataRefreshed(items);
    } catch (error) {
      _onRefreshError(error);
    } finally {
      _isRefreshing = false;
      _onRefreshingChanged();
    }
  }

  /// Load initial data
  Future<void> loadInitial(
    Future<List<dynamic>> Function(int page, int pageSize) loadFunction,
  ) async {
    resetPagination();

    try {
      final items = await loadFunction(1, _pageSize);
      _hasMore = items.length >= _pageSize;
      _onInitialDataLoaded(items);
    } catch (error) {
      _onInitialLoadError(error);
    }
  }

  /// Called when pagination is reset
  void _onPaginationReset() {
    // Override trong concrete ViewModels
  }

  /// Called when loading more state changes
  void _onLoadingMoreChanged() {
    // Override trong concrete ViewModels
  }

  /// Called when refreshing state changes
  void _onRefreshingChanged() {
    // Override trong concrete ViewModels
  }

  /// Called when new data is loaded
  void _onDataLoaded(List<dynamic> newItems) {
    // Override trong concrete ViewModels
  }

  /// Called when data is refreshed
  void _onDataRefreshed(List<dynamic> items) {
    // Override trong concrete ViewModels
  }

  /// Called when initial data is loaded
  void _onInitialDataLoaded(List<dynamic> items) {
    // Override trong concrete ViewModels
  }

  /// Called when load more error occurs
  void _onLoadMoreError(Object error) {
    // Override trong concrete ViewModels
  }

  /// Called when refresh error occurs
  void _onRefreshError(Object error) {
    // Override trong concrete ViewModels
  }

  /// Called when initial load error occurs
  void _onInitialLoadError(Object error) {
    // Override trong concrete ViewModels
  }
}

/// Mixin cho search với pagination
mixin SearchPaginationMixin<T> on StateNotifier<T> {
  /// Current search query
  String _searchQuery = '';

  /// Search results
  List<dynamic> _searchResults = [];

  /// Is searching
  bool _isSearching = false;

  /// Get search query
  String get searchQuery => _searchQuery;

  /// Get search results
  List<dynamic> get searchResults => List.unmodifiable(_searchResults);

  /// Get is searching
  bool get isSearching => _isSearching;

  /// Search with query
  Future<void> search(
    String query,
    Future<List<dynamic>> Function(String query) searchFunction,
  ) async {
    _searchQuery = query;
    _isSearching = true;
    _onSearchingChanged();

    try {
      if (query.isEmpty) {
        _searchResults = [];
        _onSearchCleared();
      } else {
        final results = await searchFunction(query);
        _searchResults = results;
        _onSearchCompleted(results);
      }
    } catch (error) {
      _onSearchError(error);
    } finally {
      _isSearching = false;
      _onSearchingChanged();
    }
  }

  /// Clear search
  void clearSearch() {
    _searchQuery = '';
    _searchResults = [];
    _onSearchCleared();
  }

  /// Called when searching state changes
  void _onSearchingChanged() {
    // Override trong concrete ViewModels
  }

  /// Called when search is completed
  void _onSearchCompleted(List<dynamic> results) {
    // Override trong concrete ViewModels
  }

  /// Called when search is cleared
  void _onSearchCleared() {
    // Override trong concrete ViewModels
  }

  /// Called when search error occurs
  void _onSearchError(Object error) {
    // Override trong concrete ViewModels
  }
}
