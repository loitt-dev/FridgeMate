# Shared Presentation Module

## 📋 Tổng Quan

Shared Presentation module cung cấp base classes, widgets, và view models được chia sẻ giữa các feature apps của FridgeMate.

## 🎯 Nguyên Tắc

- **Base Classes**: Base ViewModel, State, Screen
- **Shared Widgets**: Common UI components
- **GetIt Integration**: Sử dụng GetIt để resolve dependencies
- **Riverpod State Management**: StateNotifier pattern
- **Reusable Logic**: Business logic được chia sẻ

## 📁 Cấu Trúc

```
lib/
├── shared_presentation.dart
├── base/
│   ├── base_view_model.dart        # Base StateNotifier
│   ├── base_state.dart             # Common UI states
│   └── base_screen.dart            # Base screen widget
├── mixins/
│   ├── loading_state_mixin.dart    # Loading state mixin
│   ├── error_handling_mixin.dart   # Error handling mixin
│   └── validation_mixin.dart       # Validation mixin
├── widgets/                        # Shared smart widgets
│   ├── item_list/
│   │   ├── item_list_widget.dart
│   │   └── item_card_widget.dart
│   ├── expiry/
│   │   └── expiry_badge_widget.dart
│   ├── recipe/
│   │   └── recipe_card_widget.dart
│   └── shopping/
│       └── shopping_item_widget.dart
└── view_models/                    # Shared ViewModels
    ├── item_list_view_model.dart
    └── recipe_list_view_model.dart
```

## 🔧 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
    
  # CAN depend on domain (for entities, use cases)
  domain:
    path: ../../core/domain
    
  # CAN depend on other foundation modules
  design_system:
    path: ../design_system
  common:
    path: ../common
    
  # ✅ CÓ get_it để sử dụng trong ViewModels
  get_it: ^7.6.0
  
  # State management
  flutter_riverpod: ^2.5.0
  
  # ❌ KHÔNG depend data, network, local_storage
```

## 📝 Sử Dụng

### Base ViewModel

```dart
abstract class BaseViewModel<T> extends StateNotifier<T> {
  BaseViewModel(T initialState) : super(initialState);
  
  // Helper to resolve from GetIt
  U resolve<U extends Object>() => GetIt.I<U>();
  
  // Common async handler
  Future<void> handleAsync(
    Future<void> Function() operation, {
    void Function()? onStart,
    void Function()? onComplete,
    void Function(Object error)? onError,
  }) async {
    try {
      onStart?.call();
      await operation();
    } catch (e) {
      onError?.call(e);
    } finally {
      onComplete?.call();
    }
  }
  
  // Loading state helper
  void setLoading(bool loading) {
    if (state is BaseState) {
      state = (state as BaseState).copyWith(isLoading: loading) as T;
    }
  }
  
  // Error state helper
  void setError(String? error) {
    if (state is BaseState) {
      state = (state as BaseState).copyWith(error: error) as T;
    }
  }
}
```

### Base State

```dart
@freezed
class BaseState with _$BaseState {
  const factory BaseState({
    @Default(false) bool isLoading,
    String? error,
    @Default(false) bool isInitialized,
  }) = _BaseState;
  
  const BaseState._();
  
  bool get hasError => error != null;
  bool get isSuccess => !isLoading && !hasError && isInitialized;
}
```

### Base Screen

```dart
abstract class BaseScreen<T extends StateNotifier<BaseState>> extends ConsumerStatefulWidget {
  const BaseScreen({super.key});
  
  @override
  ConsumerState<BaseScreen<T>> createState() => _BaseScreenState<T>();
}

class _BaseScreenState<T extends StateNotifier<BaseState>> extends ConsumerState<BaseScreen<T>> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(viewModelProvider);
    
    return Scaffold(
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Lỗi: $error'),
              ElevatedButton(
                onPressed: () => ref.read(viewModelProvider.notifier).retry(),
                child: const Text('Thử lại'),
              ),
            ],
          ),
        ),
        success: () => buildContent(context, state),
      ),
    );
  }
  
  Widget buildContent(BuildContext context, T state);
  
  StateNotifierProvider<T> get viewModelProvider;
}
```

### Loading State Mixin

```dart
mixin LoadingStateMixin<T extends BaseState> on StateNotifier<T> {
  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading) as T;
  }
  
  Future<R> withLoading<R>(Future<R> Function() operation) async {
    setLoading(true);
    try {
      final result = await operation();
      return result;
    } finally {
      setLoading(false);
    }
  }
}
```

### Error Handling Mixin

```dart
mixin ErrorHandlingMixin<T extends BaseState> on StateNotifier<T> {
  void setError(String? error) {
    state = state.copyWith(error: error) as T;
  }
  
  void clearError() {
    setError(null);
  }
  
  Future<R?> handleAsync<R>(
    Future<R> Function() operation, {
    String? errorMessage,
  }) async {
    try {
      clearError();
      return await operation();
    } catch (e) {
      setError(errorMessage ?? e.toString());
      return null;
    }
  }
}
```

### Shared Widgets

```dart
class ItemListWidget extends ConsumerWidget {
  final List<StorageItem> items;
  final Function(StorageItem) onItemTap;
  final Function(StorageItem)? onItemDelete;
  
  const ItemListWidget({
    super.key,
    required this.items,
    required this.onItemTap,
    this.onItemDelete,
  });
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ItemCardWidget(
          item: item,
          onTap: () => onItemTap(item),
          onDelete: onItemDelete != null ? () => onItemDelete!(item) : null,
        );
      },
    );
  }
}

class ItemCardWidget extends StatelessWidget {
  final StorageItem item;
  final VoidCallback onTap;
  final VoidCallback? onDelete;
  
  const ItemCardWidget({
    super.key,
    required this.item,
    required this.onTap,
    this.onDelete,
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: item.category.color,
          child: Text(item.name[0].toUpperCase()),
        ),
        title: Text(item.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.category.name),
            Text('HSD: ${item.expiryDate.formattedDate}'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (item.isExpiringSoon)
              const ExpiryBadgeWidget(),
            if (onDelete != null)
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: onDelete,
              ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
```

### Expiry Badge Widget

```dart
class ExpiryBadgeWidget extends StatelessWidget {
  final DateTime? expiryDate;
  final String? customText;
  
  const ExpiryBadgeWidget({
    super.key,
    this.expiryDate,
    this.customText,
  });
  
  @override
  Widget build(BuildContext context) {
    final text = customText ?? _getExpiryText();
    final color = _getExpiryColor();
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
  
  String _getExpiryText() {
    if (expiryDate == null) return 'Hết hạn';
    
    if (expiryDate!.isExpired) return 'Hết hạn';
    if (expiryDate!.isExpiringSoon) return 'Sắp hết hạn';
    return 'Còn hạn';
  }
  
  Color _getExpiryColor() {
    if (expiryDate == null) return Colors.red;
    
    if (expiryDate!.isExpired) return Colors.red;
    if (expiryDate!.isExpiringSoon) return Colors.orange;
    return Colors.green;
  }
}
```

### Shared ViewModels

```dart
class ItemListViewModel extends BaseViewModel<ItemListState> {
  late final GetStorageItemsUseCase _getItemsUseCase;
  late final DeleteItemUseCase _deleteItemUseCase;
  
  ItemListViewModel() : super(ItemListState.initial()) {
    _getItemsUseCase = resolve<GetStorageItemsUseCase>();
    _deleteItemUseCase = resolve<DeleteItemUseCase>();
  }
  
  Future<void> loadItems() async {
    await handleAsync(
      () async {
        final result = await _getItemsUseCase.execute();
        result.fold(
          (failure) => setError(failure.message),
          (items) => state = state.copyWith(items: items),
        );
      },
    );
  }
  
  Future<void> deleteItem(String itemId) async {
    await handleAsync(
      () async {
        final result = await _deleteItemUseCase.execute(itemId);
        result.fold(
          (failure) => setError(failure.message),
          (_) => loadItems(), // Reload items after deletion
        );
      },
    );
  }
}

@freezed
class ItemListState extends BaseState with _$ItemListState {
  const factory ItemListState({
    @Default(false) bool isLoading,
    String? error,
    @Default(false) bool isInitialized,
    @Default([]) List<StorageItem> items,
  }) = _ItemListState;
  
  const ItemListState._();
  
  static ItemListState initial() => const ItemListState();
}
```

## ✅ Validation

- [ ] Base classes được implement đúng
- [ ] GetIt integration hoạt động
- [ ] Riverpod state management
- [ ] Shared widgets reusable
- [ ] Mixins hữu ích
- [ ] ViewModels sử dụng use cases
- [ ] Error handling đầy đủ

## 🚀 Phase 1 Features

- **Base Architecture**: Base ViewModel, State, Screen
- **State Management**: Riverpod + StateNotifier
- **Shared Widgets**: Item lists, cards, badges
- **Error Handling**: Centralized error management
- **Loading States**: Loading state management
- **GetIt Integration**: Dependency resolution
