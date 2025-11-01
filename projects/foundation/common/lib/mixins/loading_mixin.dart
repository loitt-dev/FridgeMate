import 'package:flutter/material.dart';

/// Mixin for handling loading states in widgets
mixin LoadingMixin<T extends StatefulWidget> on State<T> {
  bool _isLoading = false;
  String? _loadingMessage;

  // ============================================
  // Loading State Getters
  // ============================================

  /// Check if currently loading
  bool get isLoading => _isLoading;

  /// Get current loading message
  String? get loadingMessage => _loadingMessage;

  // ============================================
  // Loading State Management
  // ============================================

  /// Set loading state
  void setLoading(bool loading, {String? message}) {
    if (mounted) {
      setState(() {
        _isLoading = loading;
        _loadingMessage = message;
      });
    }
  }

  /// Show loading with message
  void showLoading({String? message}) {
    setLoading(true, message: message);
  }

  /// Hide loading
  void hideLoading() {
    setLoading(false);
  }

  /// Execute async operation with loading state
  Future<R?> executeWithLoading<R>(
    Future<R> Function() operation, {
    String? loadingMessage,
    bool showLoading = true,
  }) async {
    if (showLoading) {
      setLoading(true, message: loadingMessage);
    }

    try {
      final result = await operation();
      return result;
    } finally {
      if (showLoading) {
        hideLoading();
      }
    }
  }

  // ============================================
  // Loading UI Helpers
  // ============================================

  /// Show loading overlay
  void showLoadingOverlay({String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => LoadingDialog(message: message),
    );
  }

  /// Hide loading overlay
  void hideLoadingOverlay() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  /// Execute async operation with loading overlay
  Future<R?> executeWithLoadingOverlay<R>(
    Future<R> Function() operation, {
    String? message,
  }) async {
    showLoadingOverlay(message: message);

    try {
      final result = await operation();
      return result;
    } finally {
      hideLoadingOverlay();
    }
  }

  // ============================================
  // Loading Widget Builders
  // ============================================

  /// Build loading indicator
  Widget buildLoadingIndicator({
    String? message,
    double size = 24.0,
    Color? color,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation<Color>(
              color ?? Theme.of(context).primaryColor,
            ),
          ),
        ),
        if (message != null) ...[
          const SizedBox(height: 8.0),
          Text(
            message,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }

  /// Build loading button
  Widget buildLoadingButton({
    required VoidCallback? onPressed,
    required Widget child,
    String? loadingMessage,
    bool isLoading = false,
  }) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 16.0,
                  height: 16.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                if (loadingMessage != null) ...[
                  const SizedBox(width: 8.0),
                  Text(loadingMessage),
                ],
              ],
            )
          : child,
    );
  }

  /// Build loading container
  Widget buildLoadingContainer({
    required Widget child,
    bool isLoading = false,
    String? loadingMessage,
    Widget? loadingWidget,
  }) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: Colors.black.withOpacity(0.3),
            child: Center(
              child:
                  loadingWidget ??
                  buildLoadingIndicator(message: loadingMessage),
            ),
          ),
      ],
    );
  }

  // ============================================
  // Error Handling with Loading
  // ============================================

  /// Execute async operation with loading and error handling
  Future<R?> executeWithLoadingAndErrorHandling<R>(
    Future<R> Function() operation, {
    String? loadingMessage,
    String? errorTitle,
    bool showLoading = true,
    bool showErrorDialog = true,
  }) async {
    if (showLoading) {
      setLoading(true, message: loadingMessage);
    }

    try {
      final result = await operation();
      return result;
    } catch (e) {
      if (showErrorDialog) {
        _showErrorDialog(title: errorTitle ?? 'Lỗi', message: e.toString());
      }
      return null;
    } finally {
      if (showLoading) {
        hideLoading();
      }
    }
  }

  /// Show error dialog
  void _showErrorDialog({required String title, required String message}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // ============================================
  // Loading State Persistence
  // ============================================

  /// Save loading state
  void saveLoadingState() {
    // Override in implementing class if needed
  }

  /// Restore loading state
  void restoreLoadingState() {
    // Override in implementing class if needed
  }

  // ============================================
  // Cleanup
  // ============================================

  @override
  void dispose() {
    // Clean up any loading states
    _isLoading = false;
    _loadingMessage = null;
    super.dispose();
  }
}

/// Loading dialog widget
class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            if (message != null) ...[
              const SizedBox(height: 16.0),
              Text(
                message!,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Loading overlay widget
class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.message,
    this.color,
  });

  final bool isLoading;
  final Widget child;
  final String? message;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: (color ?? Colors.black).withOpacity(0.3),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                  if (message != null) ...[
                    const SizedBox(height: 16.0),
                    Text(
                      message!,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            ),
          ),
      ],
    );
  }
}

/// Loading button widget
class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isLoading = false,
    this.loadingMessage,
    this.style,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final bool isLoading;
  final String? loadingMessage;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: style,
      child: isLoading
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 16.0,
                  height: 16.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                if (loadingMessage != null) ...[
                  const SizedBox(width: 8.0),
                  Text(loadingMessage!),
                ],
              ],
            )
          : child,
    );
  }
}
