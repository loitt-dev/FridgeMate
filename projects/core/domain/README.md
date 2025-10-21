# Domain Module

## 📋 Tổng Quan

Domain module chứa business logic thuần túy của FridgeMate, không phụ thuộc vào bất kỳ framework hay module nào khác.

## 🎯 Nguyên Tắc

- **Pure Dart**: Không có Flutter dependency
- **Zero Dependencies**: Không phụ thuộc module khác
- **Business Logic**: Chứa entities, repository interfaces, use cases
- **Immutable**: Sử dụng Freezed cho entities
- **Functional**: Sử dụng dartz cho Result pattern

## 📁 Cấu Trúc

```
lib/
├── domain.dart                     # Export barrel
├── entities/                       # Business entities (Freezed)
│   ├── storage/                    # Phase 1: Quản lý tủ
│   ├── recipe/                     # Phase 1: Công thức nấu ăn
│   ├── shopping/                   # Phase 1: Danh sách mua sắm
│   └── common/                     # Common entities
├── repositories/                   # ABSTRACT INTERFACES
│   ├── storage_repository.dart
│   ├── recipe_repository.dart
│   └── shopping_repository.dart
└── use_cases/                      # Application business logic
    ├── base_use_case.dart
    ├── storage/
    ├── recipe/
    └── shopping/
```

## 🔧 Dependencies

```yaml
dependencies:
  dartz: ^0.10.1                  # Functional programming
  freezed_annotation: ^2.4.0      # Immutable models
  json_annotation: ^4.8.0
  
  # ❌ NO Flutter dependency!
  # ❌ NO get_it!
  # ❌ NO other modules!
```

## 📝 Sử Dụng

### Entities

```dart
// Tạo entity với Freezed
@freezed
class StorageItem with _$StorageItem {
  const factory StorageItem({
    required String id,
    required String name,
    required StorageCategory category,
    required DateTime expiryDate,
  }) = _StorageItem;
}
```

### Use Cases

```dart
// Use case với constructor injection
class GetStorageItemsUseCase {
  final StorageRepository _repository;
  
  GetStorageItemsUseCase(this._repository);
  
  Future<Result<List<StorageItem>, Failure>> execute() async {
    return await _repository.getItems();
  }
}
```

### Repository Interfaces

```dart
// Abstract interface
abstract class StorageRepository {
  Future<Result<List<StorageItem>, Failure>> getItems();
  Future<Result<void, Failure>> addItem(StorageItem item);
}
```

## ✅ Validation

- [ ] Không phụ thuộc bất kỳ module nào (pure Dart)
- [ ] Không có get_it dependency
- [ ] Chỉ chứa entities, repository interfaces, use cases
- [ ] Use cases dùng constructor injection
- [ ] Entities sử dụng Freezed
- [ ] Sử dụng Result pattern với dartz

## 🚀 Phase 1 Features

- **Storage Management**: Quản lý thực phẩm/thuốc trong tủ
- **Recipe System**: Gợi ý công thức nấu ăn
- **Shopping Lists**: Tạo danh sách mua sắm
- **Expiry Tracking**: Theo dõi hạn sử dụng
- **Category Management**: Quản lý danh mục