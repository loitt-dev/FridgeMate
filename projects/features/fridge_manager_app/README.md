# Fridge Manager App

## 📋 Tổng Quan

Fridge Manager App là feature module chính cho việc quản lý tủ lạnh, thực phẩm, công thức nấu ăn và danh sách mua sắm.

## 🎯 Nguyên Tắc

- **Feature Module**: Chỉ chứa UI và presentation logic
- **Domain Dependency**: Chỉ phụ thuộc domain layer
- **GetIt Usage**: Sử dụng GetIt để resolve use cases
- **Riverpod State**: StateNotifier cho state management
- **No Business Logic**: Business logic ở domain layer

## 📁 Cấu Trúc

```
lib/
├── fridge_manager_app.dart
└── presentation/
    ├── screens/
    │   ├── home/
    │   │   ├── fridge_home_screen.dart
    │   │   ├── fridge_home_view_model.dart
    │   │   └── fridge_home_state.dart
    │   ├── item_detail/
    │   │   ├── fridge_item_detail_screen.dart
    │   │   ├── fridge_item_detail_view_model.dart
    │   │   └── fridge_item_detail_state.dart
    │   ├── item_add/
    │   │   ├── fridge_add_item_screen.dart
    │   │   ├── fridge_add_item_view_model.dart
    │   │   └── fridge_add_item_state.dart
    │   ├── recipe_list/
    │   │   ├── fridge_recipe_list_screen.dart
    │   │   ├── fridge_recipe_list_view_model.dart
    │   │   └── fridge_recipe_list_state.dart
    │   ├── shopping_list/
    │   │   ├── fridge_shopping_list_screen.dart
    │   │   ├── fridge_shopping_list_view_model.dart
    │   │   └── fridge_shopping_list_state.dart
    │   └── settings/
    │       ├── fridge_settings_screen.dart
    │       ├── fridge_settings_view_model.dart
    │       └── fridge_settings_state.dart
    ├── widgets/
    │   ├── fridge_item_card.dart
    │   ├── fridge_stats_widget.dart
    │   ├── fridge_category_filter.dart
    │   └── fridge_expiry_warning.dart
    └── providers/
        └── fridge_providers.dart
```

## 🔧 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # Foundation
  design_system:
    path: ../../foundation/design_system
  navigation:
    path: ../../foundation/navigation
  shared_presentation:
    path: ../../foundation/shared_presentation
  common:
    path: ../../foundation/common
  
  # Core - CHỈ domain!
  domain:
    path: ../../core/domain
  
  # ✅ get_it để resolve dependencies
  get_it: ^7.6.0
  flutter_riverpod: ^2.5.0
  
  # ❌ KHÔNG depend: data, network, local_storage, config
```

## 📝 Sử Dụng

### Main App Widget

```dart
class FridgeManagerApp extends StatelessWidget {
  const FridgeManagerApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fridge Manager',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: AppRouter.router,
    );
  }
}
```

### ViewModel Pattern

```dart
class FridgeHomeViewModel extends BaseViewModel<FridgeHomeState> {
  late final GetStorageItemsUseCase _getItemsUseCase;
  late final GetExpiringItemsUseCase _getExpiringItemsUseCase;
  late final GetStorageStatsUseCase _getStatsUseCase;
  
  FridgeHomeViewModel() : super(FridgeHomeState.initial()) {
    _getItemsUseCase = resolve<GetStorageItemsUseCase>();
    _getExpiringItemsUseCase = resolve<GetExpiringItemsUseCase>();
    _getStatsUseCase = resolve<GetStorageStatsUseCase>();
  }
  
  // For testing - inject dependencies
  FridgeHomeViewModel.test({
    required GetStorageItemsUseCase getItemsUseCase,
    required GetExpiringItemsUseCase getExpiringItemsUseCase,
    required GetStorageStatsUseCase getStatsUseCase,
  })  : _getItemsUseCase = getItemsUseCase,
        _getExpiringItemsUseCase = getExpiringItemsUseCase,
        _getStatsUseCase = getStatsUseCase,
        super(FridgeHomeState.initial());
  
  Future<void> loadData() async {
    await handleAsync(
      () async {
        // Load items
        final itemsResult = await _getItemsUseCase.execute();
        itemsResult.fold(
          (failure) => setError(failure.message),
          (items) => state = state.copyWith(items: items),
        );
        
        // Load expiring items
        final expiringResult = await _getExpiringItemsUseCase.execute();
        expiringResult.fold(
          (failure) => setError(failure.message),
          (expiringItems) => state = state.copyWith(expiringItems: expiringItems),
        );
        
        // Load stats
        final statsResult = await _getStatsUseCase.execute();
        statsResult.fold(
          (failure) => setError(failure.message),
          (stats) => state = state.copyWith(stats: stats),
        );
      },
    );
  }
  
  void filterByCategory(String? categoryId) {
    state = state.copyWith(selectedCategoryId: categoryId);
  }
  
  void searchItems(String query) {
    state = state.copyWith(searchQuery: query);
  }
}

@freezed
class FridgeHomeState extends BaseState with _$FridgeHomeState {
  const factory FridgeHomeState({
    @Default(false) bool isLoading,
    String? error,
    @Default(false) bool isInitialized,
    @Default([]) List<StorageItem> items,
    @Default([]) List<StorageItem> expiringItems,
    StorageStats? stats,
    String? selectedCategoryId,
    @Default('') String searchQuery,
  }) = _FridgeHomeState;
  
  const FridgeHomeState._();
  
  static FridgeHomeState initial() => const FridgeHomeState();
  
  List<StorageItem> get filteredItems {
    var filtered = items;
    
    if (selectedCategoryId != null) {
      filtered = filtered.where((item) => item.category.id == selectedCategoryId).toList();
    }
    
    if (searchQuery.isNotEmpty) {
      filtered = filtered.where((item) => 
        item.name.toLowerCase().contains(searchQuery.toLowerCase())
      ).toList();
    }
    
    return filtered;
  }
}
```

### Screen Implementation

```dart
class FridgeHomeScreen extends ConsumerWidget {
  const FridgeHomeScreen({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fridgeHomeViewModelProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tủ Lạnh'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.pushTo(FridgeRoutes.addItem),
          ),
        ],
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Lỗi: $error'),
              ElevatedButton(
                onPressed: () => ref.read(fridgeHomeViewModelProvider.notifier).loadData(),
                child: const Text('Thử lại'),
              ),
            ],
          ),
        ),
        success: () => _buildContent(context, ref, state),
      ),
    );
  }
  
  Widget _buildContent(BuildContext context, WidgetRef ref, FridgeHomeState state) {
    return Column(
      children: [
        // Stats Widget
        if (state.stats != null)
          FridgeStatsWidget(stats: state.stats!),
        
        // Expiry Warning
        if (state.expiringItems.isNotEmpty)
          FridgeExpiryWarning(items: state.expiringItems),
        
        // Category Filter
        FridgeCategoryFilter(
          selectedCategoryId: state.selectedCategoryId,
          onCategorySelected: (categoryId) => 
            ref.read(fridgeHomeViewModelProvider.notifier).filterByCategory(categoryId),
        ),
        
        // Search Bar
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Tìm kiếm thực phẩm...',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (query) => 
              ref.read(fridgeHomeViewModelProvider.notifier).searchItems(query),
          ),
        ),
        
        // Items List
        Expanded(
          child: ItemListWidget(
            items: state.filteredItems,
            onItemTap: (item) => context.goToItemDetail(item.id),
            onItemDelete: (item) => _deleteItem(context, ref, item),
          ),
        ),
      ],
    );
  }
  
  void _deleteItem(BuildContext context, WidgetRef ref, StorageItem item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Xóa thực phẩm'),
        content: Text('Bạn có chắc muốn xóa "${item.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(fridgeHomeViewModelProvider.notifier).deleteItem(item.id);
            },
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
  }
}
```

### Custom Widgets

```dart
class FridgeStatsWidget extends StatelessWidget {
  final StorageStats stats;
  
  const FridgeStatsWidget({super.key, required this.stats});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thống kê tủ lạnh',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('Tổng số', stats.totalItems.toString()),
                _buildStatItem('Sắp hết hạn', stats.expiringItemsCount.toString()),
                _buildStatItem('Đã hết hạn', stats.expiredItemsCount.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(label),
      ],
    );
  }
}

class FridgeExpiryWarning extends StatelessWidget {
  final List<StorageItem> items;
  
  const FridgeExpiryWarning({super.key, required this.items});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange),
      ),
      child: Row(
        children: [
          Icon(Icons.warning, color: Colors.orange.shade700),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Có ${items.length} thực phẩm sắp hết hạn',
              style: TextStyle(color: Colors.orange.shade700),
            ),
          ),
          TextButton(
            onPressed: () => context.pushTo(FridgeRoutes.expiringItems),
            child: const Text('Xem chi tiết'),
          ),
        ],
      ),
    );
  }
}
```

### Providers

```dart
final fridgeHomeViewModelProvider = StateNotifierProvider<FridgeHomeViewModel, FridgeHomeState>(
  (ref) => FridgeHomeViewModel(),
);

final fridgeItemDetailViewModelProvider = StateNotifierProvider.family<FridgeItemDetailViewModel, FridgeItemDetailState, String>(
  (ref, itemId) => FridgeItemDetailViewModel(itemId),
);

final fridgeAddItemViewModelProvider = StateNotifierProvider<FridgeAddItemViewModel, FridgeAddItemState>(
  (ref) => FridgeAddItemViewModel(),
);

final fridgeRecipeListViewModelProvider = StateNotifierProvider<FridgeRecipeListViewModel, FridgeRecipeListState>(
  (ref) => FridgeRecipeListViewModel(),
);

final fridgeShoppingListViewModelProvider = StateNotifierProvider<FridgeShoppingListViewModel, FridgeShoppingListState>(
  (ref) => FridgeShoppingListViewModel(),
);
```

## ✅ Validation

- [ ] Feature module - chỉ UI và presentation
- [ ] Phụ thuộc: domain, foundation, get_it
- [ ] KHÔNG phụ thuộc: data, network, local_storage, config
- [ ] ViewModels dùng GetIt.I<UseCase>()
- [ ] State management với Riverpod
- [ ] Screens sử dụng shared widgets
- [ ] Custom widgets cho fridge-specific UI

## 🚀 Phase 1 Features

- **Home Dashboard**: Tổng quan tủ lạnh
- **Item Management**: Thêm, sửa, xóa thực phẩm
- **Category Filtering**: Lọc theo danh mục
- **Search**: Tìm kiếm thực phẩm
- **Expiry Tracking**: Theo dõi hạn sử dụng
- **Recipe Suggestions**: Gợi ý công thức nấu ăn
- **Shopping Lists**: Danh sách mua sắm
- **Stats Dashboard**: Thống kê tủ lạnh