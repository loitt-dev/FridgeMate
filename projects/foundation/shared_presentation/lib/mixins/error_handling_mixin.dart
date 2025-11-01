import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Mixin để handle error states
///
/// Cung cấp:
/// - Error state management
/// - Error message handling
/// - Error recovery
mixin ErrorHandlingMixin<T> on StateNotifier<T> {
  /// Set error state
  void setError(String message, [Object? error]) {
    // Override trong concrete ViewModels để set error state
  }

  /// Clear error state
  void clearError() {
    // Override trong concrete ViewModels để clear error state
  }

  /// Handle error với retry option
  void handleErrorWithRetry(
    Object error, {
    String? customMessage,
    VoidCallback? onRetry,
  }) {
    final message = customMessage ?? _getErrorMessage(error);
    setError(message, error);

    // Có thể show retry dialog hoặc snackbar
    if (onRetry != null) {
      // Implement retry logic
    }
  }

  /// Handle network error
  void handleNetworkError(Object error) {
    setError('Lỗi kết nối mạng. Vui lòng kiểm tra kết nối internet.', error);
  }

  /// Handle server error
  void handleServerError(Object error) {
    setError('Lỗi máy chủ. Vui lòng thử lại sau.', error);
  }

  /// Handle validation error
  void handleValidationError(Object error) {
    setError('Dữ liệu không hợp lệ. Vui lòng kiểm tra lại.', error);
  }

  /// Handle unauthorized error
  void handleUnauthorizedError(Object error) {
    setError('Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.', error);
  }

  /// Handle not found error
  void handleNotFoundError(Object error) {
    setError('Không tìm thấy dữ liệu.', error);
  }

  /// Get error message từ exception
  String _getErrorMessage(Object error) {
    if (error is Exception) {
      return error.toString();
    }
    return 'Đã xảy ra lỗi không xác định.';
  }

  /// Execute operation với error handling
  Future<R?> executeWithErrorHandling<R>(
    Future<R> Function() operation, {
    void Function(Object error)? onError,
    String? customErrorMessage,
  }) async {
    try {
      return await operation();
    } catch (error) {
      if (onError != null) {
        onError(error);
      } else {
        handleErrorWithRetry(error, customMessage: customErrorMessage);
      }
      return null;
    }
  }

  /// Execute operation với specific error handling
  Future<R?> executeWithSpecificErrorHandling<R>(
    Future<R> Function() operation, {
    void Function(Object error)? onNetworkError,
    void Function(Object error)? onServerError,
    void Function(Object error)? onValidationError,
    void Function(Object error)? onUnauthorizedError,
    void Function(Object error)? onNotFoundError,
    void Function(Object error)? onDefaultError,
  }) async {
    try {
      return await operation();
    } catch (error) {
      if (error.toString().contains('network') ||
          error.toString().contains('connection')) {
        onNetworkError?.call(error);
        if (onNetworkError == null) handleNetworkError(error);
      } else if (error.toString().contains('server') ||
          error.toString().contains('500')) {
        onServerError?.call(error);
        if (onServerError == null) handleServerError(error);
      } else if (error.toString().contains('validation') ||
          error.toString().contains('400')) {
        onValidationError?.call(error);
        if (onValidationError == null) handleValidationError(error);
      } else if (error.toString().contains('unauthorized') ||
          error.toString().contains('401')) {
        onUnauthorizedError?.call(error);
        if (onUnauthorizedError == null) handleUnauthorizedError(error);
      } else if (error.toString().contains('not found') ||
          error.toString().contains('404')) {
        onNotFoundError?.call(error);
        if (onNotFoundError == null) handleNotFoundError(error);
      } else {
        onDefaultError?.call(error);
        if (onDefaultError == null) handleErrorWithRetry(error);
      }
      return null;
    }
  }
}
