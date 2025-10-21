# Data Module

## 📋 Tổng Quan

Data module implement các repository interfaces từ domain layer, xử lý data sources và mapping giữa entities và models.

## 🎯 Nguyên Tắc

- **Implements Domain**: Implement tất cả repository interfaces
- **Data Sources**: Quản lý local và remote data sources
- **Mapping**: Convert giữa entities (domain) và models (data)
- **Error Handling**: Xử lý lỗi và convert thành domain failures
- **No GetIt**: Không sử dụng GetIt, dùng constructor injection

## 📁 Cấu Trúc

```
lib/
├── data.dart
├── repositories/                   # Implementations
│   ├── storage_repository_impl.dart
│   ├── recipe_repository_impl.dart
│   └── shopping_repository_impl.dart
├── models/                         # DTOs (JSON serializable)
│   ├── storage/
│   ├── recipe/
│   └── shopping/
├── mappers/                        # Entity <-> Model
│   ├── storage_mapper.dart
│   ├── recipe_mapper.dart
│   └── shopping_mapper.dart
└── data_sources/
    ├── local/                      # Local database operations
    │   ├── storage_local_data_source.dart
    │   ├── recipe_local_data_source.dart
    │   └── shopping_local_data_source.dart
    └── remote/                     # API calls
        ├── storage_remote_data_source.dart
        ├── recipe_remote_data_source.dart
        └── shopping_remote_data_source.dart
```

## 🔧 Dependencies

```yaml
dependencies:
  domain:
    path: ../domain              # Implement interfaces
  network:
    path: ../network             # Use Dio
  local_storage:
    path: ../local_storage       # Use Database
  
  dartz: ^0.10.1
  freezed_annotation: ^2.4.0
  json_annotation: ^4.8.0
  
  # ❌ NO get_it!
```

## 📝 Sử Dụng

### Repository Implementation

```dart
class StorageRepositoryImpl implements StorageRepository {
  final StorageLocalDataSource _localDataSource;
  final StorageRemoteDataSource _remoteDataSource;
  
  StorageRepositoryImpl({
    required StorageLocalDataSource localDataSource,
    required StorageRemoteDataSource remoteDataSource,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource;
  
  @override
  Future<Result<List<StorageItem>, Failure>> getItems() async {
    try {
      // Local first strategy
      final localModels = await _localDataSource.getItems();
      if (localModels.isNotEmpty) {
        return Right(localModels.map((m) => m.toEntity()).toList());
      }
      
      // Fetch from API
      final remoteModels = await _remoteDataSource.getItems();
      await _localDataSource.saveItems(remoteModels);
      
      return Right(remoteModels.map((m) => m.toEntity()).toList());
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }
}
```

### Model với JSON Serialization

```dart
@freezed
class StorageItemModel with _$StorageItemModel {
  const factory StorageItemModel({
    required String id,
    required String name,
    required String categoryId,
    required String expiryDate,
  }) = _StorageItemModel;
  
  factory StorageItemModel.fromJson(Map<String, dynamic> json) =>
      _$StorageItemModelFromJson(json);
}
```

### Mapper

```dart
extension StorageItemModelMapper on StorageItemModel {
  StorageItem toEntity() {
    return StorageItem(
      id: id,
      name: name,
      category: StorageCategory.fromId(categoryId),
      expiryDate: DateTime.parse(expiryDate),
    );
  }
}

extension StorageItemMapper on StorageItem {
  StorageItemModel toModel() {
    return StorageItemModel(
      id: id,
      name: name,
      categoryId: category.id,
      expiryDate: expiryDate.toIso8601String(),
    );
  }
}
```

## ✅ Validation

- [ ] Implement tất cả repository interfaces từ domain
- [ ] Phụ thuộc: domain, network, local_storage
- [ ] KHÔNG có get_it
- [ ] Repositories dùng constructor injection
- [ ] Models có JSON serialization
- [ ] Mappers convert đúng giữa entity và model
- [ ] Error handling chuyển đổi thành domain failures

## 🚀 Phase 1 Features

- **Local Storage**: SQLite database với Drift
- **Remote API**: HTTP calls với Dio
- **Offline First**: Local data được ưu tiên
- **Data Sync**: Sync khi có network
- **Caching**: Cache data để tăng performance