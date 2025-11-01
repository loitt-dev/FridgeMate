# FridgeMate - Style Guide

## Code Style Guidelines

### Dart/Flutter Conventions

#### Naming Conventions
```dart
// Classes: PascalCase
class ItemRepository {}
class FridgeItem {}

// Variables and functions: camelCase
String itemName;
void loadItems() {}

// Constants: camelCase
const String defaultItemName = 'New Item';

// Private members: underscore prefix
String _privateField;
void _privateMethod() {}

// Files: snake_case
item_repository.dart
fridge_item.dart
```

#### File Organization
```dart
// 1. Imports (dart, flutter, packages, local)
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../domain/entities/item.dart';

// 2. Class declaration
class ItemRepositoryImpl implements ItemRepository {
  // 3. Fields
  final ItemDataSource _dataSource;
  
  // 4. Constructor
  ItemRepositoryImpl(this._dataSource);
  
  // 5. Public methods
  @override
  Future<List<Item>> getItems() async {
    // Implementation
  }
  
  // 6. Private methods
  void _validateItem(Item item) {
    // Implementation
  }
}
```

#### Documentation
```dart
/// Repository implementation for managing items.
/// 
/// This class provides concrete implementation of [ItemRepository]
/// using [ItemDataSource] for data operations.
class ItemRepositoryImpl implements ItemRepository {
  /// Creates a new instance of [ItemRepositoryImpl].
  /// 
  /// [dataSource] is used for all data operations.
  ItemRepositoryImpl(this._dataSource);
  
  /// Retrieves all items from the data source.
  /// 
  /// Returns a [Future] that completes with a list of [Item] objects.
  /// Throws [ItemRepositoryException] if the operation fails.
  @override
  Future<List<Item>> getItems() async {
    // Implementation
  }
}
```

### Architecture Patterns

#### Use Case Pattern
```dart
/// Use case for retrieving items.
class GetItemsUseCase {
  final ItemRepository _repository;
  
  GetItemsUseCase(this._repository);
  
  /// Executes the use case to retrieve all items.
  Future<List<Item>> execute() async {
    return await _repository.getItems();
  }
}
```

#### Repository Pattern
```dart
/// Abstract repository for item operations.
abstract class ItemRepository {
  /// Retrieves all items.
  Future<List<Item>> getItems();
  
  /// Retrieves an item by ID.
  Future<Item> getItemById(String id);
  
  /// Saves an item.
  Future<void> saveItem(Item item);
  
  /// Deletes an item by ID.
  Future<void> deleteItem(String id);
}
```

#### State Management (Riverpod)
```dart
/// Provider for items state.
final itemsProvider = StateNotifierProvider<ItemsNotifier, List<Item>>((ref) {
  return ItemsNotifier(ref.read(itemRepositoryProvider));
});

/// Notifier for managing items state.
class ItemsNotifier extends StateNotifier<List<Item>> {
  final ItemRepository _repository;
  
  ItemsNotifier(this._repository) : super([]);
  
  /// Loads all items.
  Future<void> loadItems() async {
    final items = await _repository.getItems();
    state = items;
  }
}
```

### UI/UX Guidelines

#### Widget Structure
```dart
class ItemListScreen extends StatelessWidget {
  const ItemListScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _navigateToAddItem(context),
          ),
        ],
      ),
      body: Consumer<ItemsNotifier>(
        builder: (context, notifier, child) {
          if (notifier.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (notifier.hasError) {
            return Center(
              child: Text('Error: ${notifier.error}'),
            );
          }
          
          return ListView.builder(
            itemCount: notifier.items.length,
            itemBuilder: (context, index) {
              final item = notifier.items[index];
              return ItemTile(item: item);
            },
          );
        },
      ),
    );
  }
}
```

#### Theme Usage
```dart
// Use theme colors
Container(
  color: Theme.of(context).colorScheme.primary,
  child: Text(
    'Hello',
    style: Theme.of(context).textTheme.headlineMedium,
  ),
)

// Use design system colors
Container(
  color: AppColors.primary,
  child: Text(
    'Hello',
    style: AppTextStyles.headlineMedium,
  ),
)
```

#### Responsive Design
```dart
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  
  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return desktop ?? tablet ?? mobile;
        } else if (constraints.maxWidth >= 800) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}
```

### Error Handling

#### Exception Handling
```dart
class ItemRepositoryImpl implements ItemRepository {
  @override
  Future<List<Item>> getItems() async {
    try {
      return await _dataSource.getItems();
    } on NetworkException catch (e) {
      throw ItemRepositoryException('Network error: ${e.message}');
    } on DatabaseException catch (e) {
      throw ItemRepositoryException('Database error: ${e.message}');
    } catch (e) {
      throw ItemRepositoryException('Unexpected error: $e');
    }
  }
}
```

#### Result Pattern
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

// Usage
Future<Result<List<Item>>> getItems() async {
  try {
    final items = await _repository.getItems();
    return Success(items);
  } catch (e) {
    return Failure(e.toString());
  }
}
```

### Testing Guidelines

#### Unit Test Structure
```dart
void main() {
  group('GetItemsUseCase', () {
    late GetItemsUseCase useCase;
    late MockItemRepository mockRepository;
    
    setUp(() {
      mockRepository = MockItemRepository();
      useCase = GetItemsUseCase(mockRepository);
    });
    
    group('execute', () {
      test('should return items when repository succeeds', () async {
        // Arrange
        final items = [Item(id: '1', name: 'Test')];
        when(() => mockRepository.getItems()).thenAnswer((_) async => items);
        
        // Act
        final result = await useCase.execute();
        
        // Assert
        expect(result, equals(items));
        verify(() => mockRepository.getItems()).called(1);
      });
      
      test('should throw exception when repository fails', () async {
        // Arrange
        when(() => mockRepository.getItems()).thenThrow(Exception('Error'));
        
        // Act & Assert
        expect(
          () => useCase.execute(),
          throwsA(isA<Exception>()),
        );
      });
    });
  });
}
```

#### Widget Test Structure
```dart
void main() {
  group('ItemListScreen', () {
    testWidgets('should display items when loaded', (tester) async {
      // Arrange
      final items = [Item(id: '1', name: 'Test Item')];
      final mockNotifier = MockItemsNotifier();
      when(() => mockNotifier.items).thenReturn(items);
      when(() => mockNotifier.isLoading).thenReturn(false);
      when(() => mockNotifier.hasError).thenReturn(false);
      
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: ProviderScope(
            overrides: [
              itemsProvider.overrideWith((ref) => mockNotifier),
            ],
            child: const ItemListScreen(),
          ),
        ),
      );
      
      // Assert
      expect(find.text('Test Item'), findsOneWidget);
    });
  });
}
```

### Performance Guidelines

#### Lazy Loading
```dart
class ItemListViewModel extends BaseViewModel {
  List<Item> _items = [];
  bool _hasMore = true;
  int _page = 0;
  static const int pageSize = 20;
  
  Future<void> loadMoreItems() async {
    if (!_hasMore || isLoading) return;
    
    setLoading(true);
    try {
      final newItems = await _repository.getItems(
        page: _page,
        limit: pageSize,
      );
      
      _items.addAll(newItems);
      _hasMore = newItems.length == pageSize;
      _page++;
      notifyListeners();
    } catch (e) {
      setError(e.toString());
    } finally {
      setLoading(false);
    }
  }
}
```

#### Caching
```dart
class ItemRepositoryImpl implements ItemRepository {
  final ItemDataSource _dataSource;
  final Map<String, Item> _cache = {};
  final Duration _cacheExpiry = const Duration(minutes: 5);
  DateTime? _lastCacheUpdate;
  
  @override
  Future<Item> getItemById(String id) async {
    if (_cache.containsKey(id) && _isCacheValid()) {
      return _cache[id]!;
    }
    
    final item = await _dataSource.getItemById(id);
    _cache[id] = item;
    _lastCacheUpdate = DateTime.now();
    return item;
  }
  
  bool _isCacheValid() {
    if (_lastCacheUpdate == null) return false;
    return DateTime.now().difference(_lastCacheUpdate!) < _cacheExpiry;
  }
}
```

### Accessibility Guidelines

#### Semantic Labels
```dart
ElevatedButton(
  onPressed: () => _addItem(),
  child: const Text('Add Item'),
  semanticLabel: 'Add new item to the list',
)

IconButton(
  icon: const Icon(Icons.delete),
  onPressed: () => _deleteItem(item),
  tooltip: 'Delete item',
  semanticLabel: 'Delete ${item.name}',
)
```

#### Screen Reader Support
```dart
class ItemTile extends StatelessWidget {
  final Item item;
  
  const ItemTile({Key? key, required this.item}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Item: ${item.name}, Expires: ${item.expiryDate}',
      child: ListTile(
        title: Text(item.name),
        subtitle: Text('Expires: ${item.expiryDate}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => _deleteItem(item),
        ),
      ),
    );
  }
}
```

### Security Guidelines

#### Input Validation
```dart
class ItemValidator {
  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name is required';
    }
    if (name.length < 2) {
      return 'Name must be at least 2 characters';
    }
    if (name.length > 100) {
      return 'Name must be less than 100 characters';
    }
    return null;
  }
  
  static String? validateExpiryDate(DateTime? date) {
    if (date == null) {
      return 'Expiry date is required';
    }
    if (date.isBefore(DateTime.now())) {
      return 'Expiry date cannot be in the past';
    }
    return null;
  }
}
```

#### Data Sanitization
```dart
class ItemSanitizer {
  static String sanitizeName(String name) {
    return name.trim().replaceAll(RegExp(r'[<>"\']'), '');
  }
  
  static String sanitizeDescription(String description) {
    return description.trim().replaceAll(RegExp(r'[<>"\']'), '');
  }
}
```

## Best Practices

### Code Organization
1. **Single Responsibility**: Each class should have one reason to change
2. **Dependency Inversion**: Depend on abstractions, not concretions
3. **Interface Segregation**: Keep interfaces focused and cohesive
4. **Open/Closed**: Open for extension, closed for modification

### Performance
1. **Lazy Loading**: Load data only when needed
2. **Caching**: Cache frequently accessed data
3. **Debouncing**: Debounce user input for search
4. **Pagination**: Use pagination for large datasets

### Testing
1. **Test Coverage**: Aim for 80%+ code coverage
2. **Test Isolation**: Each test should be independent
3. **Mock Dependencies**: Mock external dependencies
4. **Test Naming**: Use descriptive test names

### Documentation
1. **API Documentation**: Document all public APIs
2. **Code Comments**: Comment complex logic
3. **README Files**: Keep README files updated
4. **Change Log**: Maintain change log for releases
