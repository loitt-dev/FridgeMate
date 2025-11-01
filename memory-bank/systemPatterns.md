# FridgeMate - System Patterns

## Architectural Patterns

### 1. Clean Architecture
```
┌────────────────────────────────────────┐
│  Presentation Layer (UI/ViewModels)    │
└──────────┬─────────────────────────────┘
           │ depends on
           ↓
┌────────────────────────────────────────┐
│  Domain Layer (Use Cases/Entities)     │
└──────────┬─────────────────────────────┘
           │ depends on
           ↓
┌────────────────────────────────────────┐
│  Data Layer (Repositories/Data Sources)│
└────────────────────────────────────────┘
```

### 2. Repository Pattern
```dart
// Domain Layer
abstract class ItemRepository {
  Future<List<Item>> getItems();
  Future<Item> getItemById(String id);
  Future<void> saveItem(Item item);
  Future<void> deleteItem(String id);
}

// Data Layer
class ItemRepositoryImpl implements ItemRepository {
  final ItemDataSource _dataSource;
  
  ItemRepositoryImpl(this._dataSource);
  
  @override
  Future<List<Item>> getItems() => _dataSource.getItems();
}
```

### 3. Use Case Pattern
```dart
class GetItemsUseCase {
  final ItemRepository _repository;
  
  GetItemsUseCase(this._repository);
  
  Future<List<Item>> execute() => _repository.getItems();
}
```

## Design Patterns

### 1. Dependency Injection (GetIt + Injectable)
```dart
@injectable
class ItemRepositoryImpl implements ItemRepository {
  final ItemDataSource _dataSource;
  
  ItemRepositoryImpl(this._dataSource);
}

@module
abstract class DataModule {
  @lazySingleton
  ItemRepository get itemRepository => ItemRepositoryImpl(get<ItemDataSource>());
}
```

### 2. Factory Pattern
```dart
abstract class ItemFactory {
  static Item createFridgeItem(Map<String, dynamic> data) {
    return FridgeItem.fromJson(data);
  }
  
  static Item createMedicineItem(Map<String, dynamic> data) {
    return MedicineItem.fromJson(data);
  }
}
```

### 3. Observer Pattern (Riverpod)
```dart
final itemsProvider = StateNotifierProvider<ItemsNotifier, List<Item>>((ref) {
  return ItemsNotifier(ref.read(itemRepositoryProvider));
});

class ItemsNotifier extends StateNotifier<List<Item>> {
  final ItemRepository _repository;
  
  ItemsNotifier(this._repository) : super([]);
  
  Future<void> loadItems() async {
    final items = await _repository.getItems();
    state = items;
  }
}
```

## Data Patterns

### 1. Data Transfer Object (DTO)
```dart
class ItemDto {
  final String id;
  final String name;
  final DateTime expiryDate;
  
  ItemDto({
    required this.id,
    required this.name,
    required this.expiryDate,
  });
  
  factory ItemDto.fromJson(Map<String, dynamic> json) {
    return ItemDto(
      id: json['id'],
      name: json['name'],
      expiryDate: DateTime.parse(json['expiryDate']),
    );
  }
}
```

### 2. Entity Mapping
```dart
extension ItemDtoExtension on ItemDto {
  Item toEntity() {
    return Item(
      id: id,
      name: name,
      expiryDate: expiryDate,
    );
  }
}
```

### 3. Repository Implementation
```dart
class ItemRepositoryImpl implements ItemRepository {
  final ItemDataSource _dataSource;
  final ItemMapper _mapper;
  
  ItemRepositoryImpl(this._dataSource, this._mapper);
  
  @override
  Future<List<Item>> getItems() async {
    final dtos = await _dataSource.getItems();
    return dtos.map((dto) => _mapper.toEntity(dto)).toList();
  }
}
```

## UI Patterns

### 1. MVVM Pattern
```dart
class ItemListViewModel extends BaseViewModel {
  final GetItemsUseCase _getItemsUseCase;
  
  ItemListViewModel(this._getItemsUseCase);
  
  List<Item> _items = [];
  List<Item> get items => _items;
  
  Future<void> loadItems() async {
    setLoading(true);
    try {
      _items = await _getItemsUseCase.execute();
      notifyListeners();
    } catch (e) {
      setError(e.toString());
    } finally {
      setLoading(false);
    }
  }
}
```

### 2. Widget Composition
```dart
class ItemListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Items')),
      body: Consumer<ItemListViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return LoadingWidget();
          }
          
          if (viewModel.hasError) {
            return ErrorWidget(viewModel.error);
          }
          
          return ItemListWidget(items: viewModel.items);
        },
      ),
    );
  }
}
```

### 3. State Management Pattern
```dart
class ItemListState {
  final List<Item> items;
  final bool isLoading;
  final String? error;
  
  ItemListState({
    this.items = const [],
    this.isLoading = false,
    this.error,
  });
  
  ItemListState copyWith({
    List<Item>? items,
    bool? isLoading,
    String? error,
  }) {
    return ItemListState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
```

## Error Handling Patterns

### 1. Result Pattern
```dart
abstract class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends Result<T> {
  final String message;
  const Failure(this.message);
}
```

### 2. Exception Handling
```dart
class ItemRepositoryImpl implements ItemRepository {
  @override
  Future<List<Item>> getItems() async {
    try {
      return await _dataSource.getItems();
    } on NetworkException {
      throw ItemRepositoryException('Network error');
    } on DatabaseException {
      throw ItemRepositoryException('Database error');
    }
  }
}
```

## Testing Patterns

### 1. Mock Objects
```dart
class MockItemRepository extends Mock implements ItemRepository {}

void main() {
  group('GetItemsUseCase', () {
    late GetItemsUseCase useCase;
    late MockItemRepository mockRepository;
    
    setUp(() {
      mockRepository = MockItemRepository();
      useCase = GetItemsUseCase(mockRepository);
    });
    
    test('should return items when repository succeeds', () async {
      // Arrange
      final items = [Item(id: '1', name: 'Test')];
      when(() => mockRepository.getItems()).thenAnswer((_) async => items);
      
      // Act
      final result = await useCase.execute();
      
      // Assert
      expect(result, equals(items));
    });
  });
}
```

### 2. Test Data Builders
```dart
class ItemBuilder {
  String _id = '1';
  String _name = 'Test Item';
  DateTime _expiryDate = DateTime.now().add(Duration(days: 7));
  
  ItemBuilder withId(String id) {
    _id = id;
    return this;
  }
  
  ItemBuilder withName(String name) {
    _name = name;
    return this;
  }
  
  Item build() {
    return Item(
      id: _id,
      name: _name,
      expiryDate: _expiryDate,
    );
  }
}
```

## Performance Patterns

### 1. Lazy Loading
```dart
class ItemListViewModel extends BaseViewModel {
  List<Item> _items = [];
  bool _hasMore = true;
  int _page = 0;
  
  Future<void> loadMoreItems() async {
    if (!_hasMore || isLoading) return;
    
    final newItems = await _repository.getItems(page: _page);
    _items.addAll(newItems);
    _hasMore = newItems.length == pageSize;
    _page++;
    notifyListeners();
  }
}
```

### 2. Caching
```dart
class ItemRepositoryImpl implements ItemRepository {
  final ItemDataSource _dataSource;
  final Map<String, Item> _cache = {};
  
  @override
  Future<Item> getItemById(String id) async {
    if (_cache.containsKey(id)) {
      return _cache[id]!;
    }
    
    final item = await _dataSource.getItemById(id);
    _cache[id] = item;
    return item;
  }
}
```
