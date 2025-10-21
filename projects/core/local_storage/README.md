# Local Storage Module

## 📋 Tổng Quan

Local Storage module cung cấp database và preferences management cho FridgeMate sử dụng Drift (SQLite) và SharedPreferences.

## 🎯 Nguyên Tắc

- **Pure Infrastructure**: Không chứa business logic
- **Database**: SQLite với Drift ORM
- **Preferences**: SharedPreferences cho settings
- **No Dependencies**: Không phụ thuộc domain/data modules
- **Type Safe**: Drift cung cấp type safety

## 📁 Cấu Trúc

```
lib/
├── local_storage.dart
├── database/
│   ├── app_database.dart           # Drift database
│   ├── dao/                        # Data Access Objects
│   │   ├── storage_dao.dart
│   │   ├── recipe_dao.dart
│   │   └── shopping_dao.dart
│   └── tables/                     # Database tables
│       ├── storage_items_table.dart
│       ├── storage_categories_table.dart
│       ├── recipes_table.dart
│       ├── shopping_lists_table.dart
│       └── shopping_items_table.dart
└── preferences/
    └── app_preferences.dart        # SharedPreferences wrapper
```

## 🔧 Dependencies

```yaml
dependencies:
  drift: ^2.14.0
  sqlite3_flutter_libs: ^0.5.0
  shared_preferences: ^2.2.0
  path_provider: ^2.1.0
  
  # ❌ NO domain/data dependencies
  # ❌ NO get_it
```

## 📝 Sử Dụng

### Database Setup

```dart
@DriftDatabase(tables: [
  StorageItemsTable,
  StorageCategoriesTable,
  RecipesTable,
  ShoppingListsTable,
  ShoppingItemsTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  
  @override
  int get schemaVersion => 1;
  
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'fridgemate.db'));
    return NativeDatabase.createInBackground(file);
  });
}
```

### Tables Definition

```dart
class StorageItemsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get categoryId => text()();
  DateTimeColumn get expiryDate => dateTime()();
  IntColumn get quantity => integer()();
  TextColumn get location => text().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}
```

### DAO (Data Access Objects)

```dart
@DriftAccessor(tables: [StorageItemsTable])
class StorageDao extends DatabaseAccessor<AppDatabase> with _$StorageDaoMixin {
  StorageDao(AppDatabase db) : super(db);
  
  Future<List<StorageItem>> getAllItems() => select(storageItemsTable).get();
  
  Future<StorageItem?> getItemById(String id) =>
      (select(storageItemsTable)..where((t) => t.id.equals(id))).getSingleOrNull();
  
  Future<int> insertItem(StorageItemsTableCompanion item) =>
      into(storageItemsTable).insert(item);
  
  Future<bool> updateItem(StorageItemsTableCompanion item) =>
      update(storageItemsTable).replace(item);
  
  Future<int> deleteItem(String id) =>
      (delete(storageItemsTable)..where((t) => t.id.equals(id))).go();
}
```

### Preferences

```dart
class AppPreferences {
  final SharedPreferences _prefs;
  
  AppPreferences(this._prefs);
  
  // Storage preferences
  String? get lastSelectedCategory => _prefs.getString('last_selected_category');
  set lastSelectedCategory(String? value) {
    if (value != null) {
      _prefs.setString('last_selected_category', value);
    } else {
      _prefs.remove('last_selected_category');
    }
  }
  
  // Recipe preferences
  List<String> get favoriteRecipeIds => _prefs.getStringList('favorite_recipe_ids') ?? [];
  set favoriteRecipeIds(List<String> value) => _prefs.setStringList('favorite_recipe_ids', value);
  
  // App settings
  bool get isDarkMode => _prefs.getBool('is_dark_mode') ?? false;
  set isDarkMode(bool value) => _prefs.setBool('is_dark_mode', value);
  
  String get language => _prefs.getString('language') ?? 'vi';
  set language(String value) => _prefs.setString('language', value);
}
```

## ✅ Validation

- [ ] Pure infrastructure - no business logic
- [ ] KHÔNG phụ thuộc domain/data
- [ ] KHÔNG có get_it
- [ ] Database tables được define đúng
- [ ] DAOs cung cấp CRUD operations
- [ ] Preferences wrapper hoạt động
- [ ] Migration strategy được setup

## 🚀 Phase 1 Features

- **SQLite Database**: Drift ORM với type safety
- **CRUD Operations**: Create, Read, Update, Delete
- **Preferences**: App settings và user preferences
- **Data Persistence**: Offline data storage
- **Migration**: Database schema updates
- **Performance**: Optimized queries và indexing
