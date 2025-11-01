import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'base_state.dart';

/// Base ViewModel class với GetIt helper
///
/// Cung cấp:
/// - GetIt resolution helper
/// - Common async operation handling
/// - Error handling patterns
/// - Loading state management
abstract class BaseViewModel<T> extends StateNotifier<T> {
  BaseViewModel(T initialState) : super(initialState);

  /// Helper để resolve dependencies từ GetIt
  ///
  /// Usage:
  /// ```dart
  /// final useCase = resolve<GetStorageItemsUseCase>();
  /// ```
  U resolve<U extends Object>() => GetIt.I<U>();

  /// Common async operation handler với error handling
  ///
  /// Usage:
  /// ```dart
  /// await handleAsync(() async {
  ///   final result = await useCase.execute();
  ///   // Handle success
  /// });
  /// ```
  Future<void> handleAsync(
    Future<void> Function() operation, {
    void Function(Object error)? onError,
  }) async {
    try {
      await operation();
    } catch (error) {
      onError?.call(error);
      // Default error handling có thể được override
      handleError(error);
    }
  }

  /// Default error handler - có thể được override
  void handleError(Object error) {
    // Default implementation - log error
    // Có thể được override trong concrete ViewModels
  }

  /// Helper để check nếu state có loading
  bool get isLoading {
    if (state is BaseState) {
      return (state as BaseState).when(
        initial: () => false,
        loading: () => true,
        success: (data) => false,
        error: (message, error) => false,
      );
    }
    return false;
  }

  /// Helper để check nếu state có error
  bool get hasError {
    if (state is BaseState) {
      return (state as BaseState).when(
        initial: () => false,
        loading: () => false,
        success: (data) => false,
        error: (message, error) => true,
      );
    }
    return false;
  }

  /// Helper để get error message
  String? get errorMessage {
    if (state is BaseState) {
      return (state as BaseState).when(
        initial: () => null,
        loading: () => null,
        success: (data) => null,
        error: (message, error) => message,
      );
    }
    return null;
  }
}
