import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Generic item list widget với common functionality
///
/// Cung cấp:
/// - Item list display
/// - Loading states
/// - Error states
/// - Empty states
/// - Pull to refresh
/// - Infinite scroll
class ItemListWidget<T> extends ConsumerWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasError;
  final String? errorMessage;
  final bool isEmpty;
  final Widget? emptyWidget;
  final Widget? errorWidget;
  final Widget? loadingWidget;
  final Widget? loadingMoreWidget;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoadMore;
  final ScrollController? scrollController;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final Axis scrollDirection;
  final int? itemCount;
  final Widget? separator;
  final bool showSeparator;

  const ItemListWidget({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasError = false,
    this.errorMessage,
    this.isEmpty = false,
    this.emptyWidget,
    this.errorWidget,
    this.loadingWidget,
    this.loadingMoreWidget,
    this.onRefresh,
    this.onLoadMore,
    this.scrollController,
    this.padding,
    this.shrinkWrap = false,
    this.physics,
    this.scrollDirection = Axis.vertical,
    this.itemCount,
    this.separator,
    this.showSeparator = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Error state
    if (hasError) {
      return _buildErrorState(context);
    }

    // Loading state
    if (isLoading && items.isEmpty) {
      return _buildLoadingState(context);
    }

    // Empty state
    if (isEmpty && items.isEmpty) {
      return _buildEmptyState(context);
    }

    // Content with items
    return _buildContent(context);
  }

  Widget _buildErrorState(BuildContext context) {
    if (errorWidget != null) {
      return errorWidget!;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            errorMessage ?? 'Đã xảy ra lỗi',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          ElevatedButton(onPressed: onRefresh, child: const Text('Thử lại')),
        ],
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    if (loadingWidget != null) {
      return loadingWidget!;
    }

    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildEmptyState(BuildContext context) {
    if (emptyWidget != null) {
      return emptyWidget!;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            'Không có dữ liệu',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          if (onRefresh != null)
            ElevatedButton(onPressed: onRefresh, child: const Text('Làm mới')),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    Widget listView = ListView.separated(
      controller: scrollController,
      padding: padding,
      shrinkWrap: shrinkWrap,
      physics: physics,
      scrollDirection: scrollDirection,
      itemCount: itemCount ?? items.length + (isLoadingMore ? 1 : 0),
      separatorBuilder: showSeparator
          ? (context, index) => separator ?? const Divider(height: 1)
          : (context, index) => const SizedBox.shrink(),
      itemBuilder: (context, index) {
        // Loading more indicator
        if (index == items.length && isLoadingMore) {
          return _buildLoadingMoreIndicator(context);
        }

        // Item
        return itemBuilder(context, items[index], index);
      },
    );

    // Pull to refresh
    if (onRefresh != null) {
      listView = RefreshIndicator(
        onRefresh: () async => onRefresh!(),
        child: listView,
      );
    }

    return listView;
  }

  Widget _buildLoadingMoreIndicator(BuildContext context) {
    if (loadingMoreWidget != null) {
      return loadingMoreWidget!;
    }

    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

/// Item list widget với infinite scroll
class InfiniteScrollItemListWidget<T> extends StatefulWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final bool isLoading;
  final bool hasError;
  final String? errorMessage;
  final bool isEmpty;
  final Widget? emptyWidget;
  final Widget? errorWidget;
  final Widget? loadingWidget;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoadMore;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final Axis scrollDirection;
  final Widget? separator;
  final bool showSeparator;
  final double loadMoreThreshold;

  const InfiniteScrollItemListWidget({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage,
    this.isEmpty = false,
    this.emptyWidget,
    this.errorWidget,
    this.loadingWidget,
    this.onRefresh,
    this.onLoadMore,
    this.padding,
    this.shrinkWrap = false,
    this.physics,
    this.scrollDirection = Axis.vertical,
    this.separator,
    this.showSeparator = false,
    this.loadMoreThreshold = 0.8,
  });

  @override
  State<InfiniteScrollItemListWidget<T>> createState() =>
      _InfiniteScrollItemListWidgetState<T>();
}

class _InfiniteScrollItemListWidgetState<T>
    extends State<InfiniteScrollItemListWidget<T>> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * widget.loadMoreThreshold) {
      widget.onLoadMore?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ItemListWidget<T>(
      items: widget.items,
      itemBuilder: widget.itemBuilder,
      isLoading: widget.isLoading,
      hasError: widget.hasError,
      errorMessage: widget.errorMessage,
      isEmpty: widget.isEmpty,
      emptyWidget: widget.emptyWidget,
      errorWidget: widget.errorWidget,
      loadingWidget: widget.loadingWidget,
      onRefresh: widget.onRefresh,
      scrollController: _scrollController,
      padding: widget.padding,
      shrinkWrap: widget.shrinkWrap,
      physics: widget.physics,
      scrollDirection: widget.scrollDirection,
      separator: widget.separator,
      showSeparator: widget.showSeparator,
    );
  }
}
