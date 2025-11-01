import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Mixin để handle loading states
///
/// Cung cấp:
/// - Loading state management
/// - Loading indicators
/// - Loading overlays
mixin LoadingStateMixin<T> on StateNotifier<T> {
  /// Set loading state
  void setLoading() {
    // Override trong concrete ViewModels để set loading state
  }

  /// Clear loading state
  void clearLoading() {
    // Override trong concrete ViewModels để clear loading state
  }

  /// Execute operation với loading state
  Future<R> executeWithLoading<R>(
    Future<R> Function() operation, {
    void Function()? onStart,
    void Function()? onEnd,
  }) async {
    onStart?.call();
    setLoading();

    try {
      final result = await operation();
      return result;
    } finally {
      clearLoading();
      onEnd?.call();
    }
  }

  /// Execute operation với loading state và error handling
  Future<R?> executeWithLoadingAndError<R>(
    Future<R> Function() operation, {
    void Function()? onStart,
    void Function()? onEnd,
    void Function(Object error)? onError,
  }) async {
    onStart?.call();
    setLoading();

    try {
      final result = await operation();
      return result;
    } catch (error) {
      onError?.call(error);
      return null;
    } finally {
      clearLoading();
      onEnd?.call();
    }
  }
}

/// Mixin cho pagination loading
mixin PaginationLoadingMixin<T> on StateNotifier<T> {
  /// Set loading more state
  void setLoadingMore() {
    // Override trong concrete ViewModels
  }

  /// Clear loading more state
  void clearLoadingMore() {
    // Override trong concrete ViewModels
  }

  /// Set refreshing state
  void setRefreshing() {
    // Override trong concrete ViewModels
  }

  /// Clear refreshing state
  void clearRefreshing() {
    // Override trong concrete ViewModels
  }

  /// Load more data
  Future<void> loadMore(Future<void> Function() loadMoreOperation) async {
    setLoadingMore();

    try {
      await loadMoreOperation();
    } finally {
      clearLoadingMore();
    }
  }

  /// Refresh data
  Future<void> refresh(Future<void> Function() refreshOperation) async {
    setRefreshing();

    try {
      await refreshOperation();
    } finally {
      clearRefreshing();
    }
  }
}
