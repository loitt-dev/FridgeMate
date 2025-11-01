# Shared Presentation Layer

Shared presentation layer cung cấp các component cơ bản để xây dựng UI trong FridgeMate apps.

## 🏗️ Cấu Trúc

```
lib/
├── base/                    # Base classes
│   ├── base_view_model.dart    # Base ViewModel với GetIt helper
│   ├── base_state.dart         # Common UI states
│   └── base_screen.dart        # Base screen với common functionality
│
├── mixins/                  # Reusable mixins
│   ├── loading_state_mixin.dart    # Loading state management
│   ├── error_handling_mixin.dart   # Error handling
│   ├── validation_mixin.dart       # Form validation
│   └── pagination_mixin.dart       # Pagination support
│
├── widgets/                 # Shared widgets
│   ├── item_list/               # List widgets
│   ├── expiry/                  # Expiry-related widgets
│   ├── recipe/                  # Recipe widgets
│   └── shopping/                # Shopping widgets
│
└── view_models/             # Shared ViewModels
    ├── item_list_view_model.dart
    ├── recipe_list_view_model.dart
    └── shopping_list_view_model.dart
```

## 🚀 Sử Dụng

### 1. Base ViewModel

```dart
import 'package:shared_presentation/shared_presentation.dart';

class MyViewModel extends BaseViewModel<MyState> {
  MyViewModel() : super(MyState.initial());
  
  Future<void> loadData() async {
    final useCase = resolve<GetDataUseCase>(); // GetIt helper
    
    await handleAsync(() async {
      final result = await useCase.execute();
      // Handle result
    });
  }
}
```

### 2. Base States

```dart
// Sử dụng các state có sẵn
@freezed
class MyState with _$MyState {
  const factory MyState.initial() = MyInitialState;
  const factory MyState.loading() = MyLoadingState;
  const factory MyState.success(MyData data) = MySuccessState;
  const factory MyState.error(String message) = MyErrorState;
}

// Hoặc extend từ base states
@freezed
class MyListState with _$MyListState {
  const factory MyListState.initial() = MyListInitialState;
  const factory MyListState.loading() = MyListLoadingState;
  const factory MyListState.success(List<MyItem> items, {@Default(false) bool hasMore}) = MyListSuccessState;
  const factory MyListState.error(String message) = MyListErrorState;
}
```

### 3. Mixins

```dart
class MyViewModel extends BaseViewModel<MyState>
    with LoadingStateMixin<MyState>, 
         ErrorHandlingMixin<MyState>,
         ValidationMixin<MyState> {
  
  Future<void> loadData() async {
    await executeWithLoading(() async {
      // Your async operation
    });
  }
  
  void validateForm() {
    validateField('email', emailValue, [ValidationRule.email()]);
  }
}
```

### 4. Shared Widgets

```dart
// Item list widget
ItemListWidget<MyItem>(
  items: items,
  itemBuilder: (context, item, index) => MyItemWidget(item: item),
  isLoading: isLoading,
  hasError: hasError,
  errorMessage: errorMessage,
  onRefresh: () => viewModel.refresh(),
  onLoadMore: () => viewModel.loadMore(),
)

// Item card widget
ItemCardWidget(
  title: item.name,
  subtitle: item.description,
  leading: Icon(Icons.item),
  trailing: ExpiryBadgeWidget(expiryDate: item.expiryDate),
  onTap: () => navigateToDetail(item),
)

// Recipe card widget
RecipeCardWidget(
  title: recipe.name,
  description: recipe.description,
  imageUrl: recipe.imageUrl,
  cookingTime: recipe.cookingTime,
  difficulty: recipe.difficulty,
  rating: recipe.rating,
  onTap: () => navigateToRecipe(recipe),
  onFavorite: () => toggleFavorite(recipe),
)
```

### 5. Shared ViewModels

```dart
// Item list ViewModel
class MyItemListViewModel extends ItemListViewModel<MyItem> {
  @override
  Future<void> loadItems() async {
    final useCase = resolve<GetMyItemsUseCase>();
    await loadItems(() => useCase.execute());
  }
  
  @override
  Future<void> loadMore() async {
    final useCase = resolve<GetMyItemsUseCase>();
    await loadMoreItems((page, pageSize) => useCase.execute(page: page, pageSize: pageSize));
  }
}

// Recipe list ViewModel
class MyRecipeListViewModel extends RecipeListViewModel {
  @override
  Future<void> loadRecipes() async {
    final useCase = resolve<GetRecipesUseCase>();
    await loadRecipes(() => useCase.execute());
  }
  
  @override
  Future<void> searchRecipes(String query) async {
    final useCase = resolve<SearchRecipesUseCase>();
    await searchRecipes(query, (q) => useCase.execute(query: q));
  }
}
```

## 📋 Dependencies

### Có thể depend:
- ✅ `domain` - Để sử dụng entities, use cases
- ✅ `design_system` - Để sử dụng theme, colors
- ✅ `common` - Để sử dụng utilities
- ✅ `get_it` - Để resolve dependencies trong ViewModels
- ✅ `flutter_riverpod` - State management

### KHÔNG được depend:
- ❌ `data` - Data layer
- ❌ `network` - Network layer  
- ❌ `local_storage` - Local storage layer
- ❌ `config` - Configuration layer

## 🎯 Nguyên Tắc

1. **Dependency Inversion**: Chỉ depend vào domain interfaces, không depend vào implementations
2. **GetIt Usage**: Chỉ sử dụng GetIt trong ViewModels để resolve use cases
3. **State Management**: Sử dụng Riverpod với base ViewModels
4. **Reusability**: Tất cả components phải có thể reuse giữa các apps
5. **Consistency**: Đảm bảo consistent UI/UX patterns

## 🔧 Development

### Build generated files:
```bash
dart run build_runner build
```

### Watch for changes:
```bash
dart run build_runner watch
```

### Clean build:
```bash
dart run build_runner clean
```

## 📝 Examples

Xem các file example trong thư mục `examples/` để hiểu cách sử dụng các components.