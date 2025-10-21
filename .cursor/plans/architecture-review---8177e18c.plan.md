<!-- 8177e18c-049f-4323-85c0-d306ef9e9bd9 080def5f-d076-4f70-a65f-ce40eb624b90 -->
# Plan Hoàn Chỉnh: Kiến Trúc FridgeMate

## 📋 Tổng Quan Dự Án

**FridgeMate** là hệ thống quản lý tủ lạnh/tủ thuốc thông minh với 5 phases phát triển:

- **Phase 1**: Offline - Quản lý tủ, gợi ý thực đơn, mua sắm
- **Phase 2**: Online - User accounts, sync, chia sẻ
- **Phase 3**: AI - Nhận diện ảnh, mã vạch, giá cả, dinh dưỡng  
- **Phase 4**: Community - Cộng đồng, đánh giá, theo dõi
- **Phase 5**: E-commerce - Giao hàng, thanh toán, phân tích

**Đặc điểm:**

- 2 apps (Fridge, Medicine) share >70% logic
- Sử dụng Riverpod state management
- Share database và API
- Clean Architecture với module hóa

## 🎯 Nguyên Tắc Kiến Trúc

### 1. Dependency Inversion Principle (DIP)

```
✅ BẮT BUỘC:
- Presentation → Domain (Use Cases) → Repository Interface
- Data → Domain (Implements Repository Interface)
- Modules KHÔNG phụ thuộc DI module
- Domain layer KHÔNG phụ thuộc bất kỳ layer nào

❌ NGHIÊM CẤM:
- Presentation → Data (trực tiếp)
- Presentation → Network/Local Storage
- Domain → Data/Infrastructure
- Modules → DI module
```

### 2. Dependency Injection với GetIt

```
✅ ĐÚNG:
- Root app (/lib/) setup GetIt và register TẤT CẢ
- Presentation sử dụng GetIt.I<AbstractInterface>()
- Use Cases/Repositories dùng constructor injection
- Modules chỉ define interfaces và implementations

❌ SAI:
- Feature modules depend vào DI module
- Domain/Data modules có get_it dependency
- Use Cases/Repositories dùng GetIt.I<>() internally
```

### 3. Dependency Flow

```
┌────────────────────────────────────────┐
│  Root App (/lib/)                      │
│  - Setup GetIt & register all deps    │
└──────────┬─────────────────────────────┘
           │ imports all
           ↓
┌────────────────────────────────────────┐
│  Features (fridge_app, medicine_app)   │
│  GetIt.I<UseCase>() trong ViewModels   │
│  Depend: domain, foundation, get_it    │
└──────────┬─────────────────────────────┘
           │ uses
           ↓
┌────────────────────────────────────────┐
│  Foundation (design, navigation...)    │
│  Depend: domain, get_it                │
└──────────┬─────────────────────────────┘
           │ uses
           ↓
┌────────────────────────────────────────┐
│  Domain (Pure Dart)                    │
│  - Entities, Repository Interfaces     │
│  - Use Cases (constructor injection)   │
│  Dependencies: NONE!                   │
└────────────────────────────────────────┘
           ↑ implements
           │
┌────────────────────────────────────────┐
│  Data                                  │
│  - RepositoryImpl (constructor inj)    │
│  Depend: domain, network, local_storage│
└──────────┬─────────────────────────────┘
           │ uses
           ↓
┌────────────────────────────────────────┐
│  Infrastructure (network, local_storage)│
│  Pure infrastructure - no business logic│
│  Dependencies: dio, drift, etc.        │
└────────────────────────────────────────┘
```

## 🏗️ Cấu Trúc Module Chi Tiết

### Module Organization

```
/lib/                               # Root app - DI setup
/projects/
  ├── core/
  │   ├── domain/                   # Business logic (pure Dart)
  │   ├── data/                     # Data implementations
  │   ├── network/                  # Dio setup
  │   ├── local_storage/            # Drift/SharedPrefs
  │   └── config/                   # Constants, environment
  │
  ├── foundation/
  │   ├── design_system/            # Theme, styles, colors
  │   ├── navigation/               # Routes, go_router
  │   ├── common/                   # Utils, extensions
  │   └── shared_presentation/      # Base ViewModels, widgets
  │
  └── features/
      ├── fridge_manager_app/       # Fridge UI
      └── medicine_box_manager_app/ # Medicine UI
```

## 📦 Chi Tiết Từng Module

### 1. Core Domain (Pure Dart - Zero Dependencies)

**Path:** `/projects/core/domain/`

**Cấu trúc:**

```
lib/
├── domain.dart                     # Export barrel
│
├── entities/                       # Business entities (Freezed)
│   ├── storage/                    # Phase 1
│   │   ├── storage_item.dart      # Food/Medicine item
│   │   ├── storage_category.dart  # Category (thịt, cá, thuốc...)
│   │   ├── storage_location.dart  # Location trong tủ
│   │   ├── expiry_info.dart       # Hạn sử dụng
│   │   └── storage_stats.dart     # Thống kê
│   │
│   ├── recipe/                     # Phase 1-4
│   │   ├── recipe.dart            # Công thức nấu
│   │   ├── ingredient.dart        # Nguyên liệu
│   │   ├── cooking_step.dart      # Bước nấu
│   │   ├── recipe_category.dart   # Loại món
│   │   ├── nutrition_info.dart    # Dinh dưỡng (P3)
│   │   ├── recipe_rating.dart     # Đánh giá (P4)
│   │   └── recipe_tag.dart        # Tags
│   │
│   ├── shopping/                   # Phase 1, 3, 5
│   │   ├── shopping_list.dart
│   │   ├── shopping_item.dart
│   │   ├── budget.dart
│   │   ├── price_info.dart        # P3
│   │   ├── store_info.dart        # P5
│   │   ├── order.dart             # P5
│   │   └── delivery_info.dart     # P5
│   │
│   ├── user/                       # Phase 2+
│   │   ├── user.dart
│   │   ├── user_profile.dart
│   │   ├── user_preferences.dart  # Sở thích, dị ứng
│   │   └── family_info.dart
│   │
│   ├── social/                     # Phase 4
│   │   ├── post.dart
│   │   ├── comment.dart
│   │   ├── rating.dart
│   │   ├── follow.dart
│   │   ├── challenge.dart
│   │   └── achievement.dart
│   │
│   ├── ai/                         # Phase 3
│   │   ├── image_recognition_result.dart
│   │   ├── barcode_info.dart
│   │   └── ai_suggestion.dart
│   │
│   ├── notification/
│   │   ├── notification.dart
│   │   ├── expiry_notification.dart
│   │   └── social_notification.dart
│   │
│   └── common/
│       ├── result.dart            # Result<T, Failure>
│       ├── failure.dart           # Error types
│       ├── pagination.dart
│       └── money.dart             # Value object
│
├── repositories/                   # ABSTRACT INTERFACES
│   ├── storage_repository.dart
│   ├── recipe_repository.dart
│   ├── shopping_repository.dart
│   ├── user_repository.dart
│   ├── auth_repository.dart
│   ├── social_repository.dart
│   ├── notification_repository.dart
│   ├── ai_repository.dart
│   ├── barcode_repository.dart
│   ├── price_repository.dart
│   └── payment_repository.dart
│
└── use_cases/                      # Application business logic
    ├── base_use_case.dart
    │
    ├── storage/                    # Phase 1
    │   ├── get_storage_items_use_case.dart
    │   ├── add_item_to_storage_use_case.dart
    │   ├── update_item_use_case.dart
    │   ├── delete_item_use_case.dart
    │   ├── get_expiring_items_use_case.dart
    │   └── search_items_use_case.dart
    │
    ├── recipe/                     # Phase 1-4
    │   ├── get_suggested_recipes_use_case.dart
    │   ├── get_recipes_by_ingredients_use_case.dart
    │   ├── search_recipes_use_case.dart
    │   ├── save_favorite_recipe_use_case.dart
    │   ├── share_recipe_use_case.dart        # P2
    │   ├── calculate_nutrition_use_case.dart  # P3
    │   ├── ai_suggest_recipes_use_case.dart   # P3
    │   └── publish_recipe_to_community_use_case.dart # P4
    │
    ├── shopping/                   # Phase 1, 3, 5
    │   ├── create_shopping_list_use_case.dart
    │   ├── add_to_shopping_list_use_case.dart
    │   ├── generate_list_from_recipe_use_case.dart
    │   ├── compare_prices_use_case.dart       # P3
    │   ├── place_order_use_case.dart          # P5
    │   └── track_order_use_case.dart          # P5
    │
    ├── user/                       # Phase 2+
    │   ├── login_use_case.dart
    │   ├── register_use_case.dart
    │   ├── sync_data_use_case.dart
    │   └── update_profile_use_case.dart
    │
    ├── social/                     # Phase 4
    │   ├── follow_user_use_case.dart
    │   ├── comment_on_post_use_case.dart
    │   └── join_challenge_use_case.dart
    │
    └── ai/                         # Phase 3
        ├── recognize_food_from_image_use_case.dart
        ├── scan_barcode_use_case.dart
        └── chat_with_ai_assistant_use_case.dart
```

**pubspec.yaml:**

```yaml
name: domain
dependencies:
  dartz: ^0.10.1                  # Functional programming
  freezed_annotation: ^2.4.0      # Immutable models
  json_annotation: ^4.8.0
  
  # ❌ NO Flutter dependency!
  # ❌ NO get_it!
  # ❌ NO other modules!
```

**Use Case Pattern:**

```dart
// domain/use_cases/storage/get_storage_items_use_case.dart
class GetStorageItemsUseCase {
  final StorageRepository _repository; // Interface from domain
  
  // Constructor injection - NO GetIt here!
  GetStorageItemsUseCase(this._repository);
  
  Future<Result<List<StorageItem>, Failure>> execute({
    String? categoryId,
    bool onlyExpiring = false,
  }) async {
    return await _repository.getItems(
      categoryId: categoryId,
      onlyExpiring: onlyExpiring,
    );
  }
}
```

---

### 2. Core Data (Implements Domain)

**Path:** `/projects/core/data/`

**Cấu trúc:**

```
lib/
├── data.dart
│
├── repositories/                   # Implementations
│   ├── storage_repository_impl.dart
│   ├── recipe_repository_impl.dart
│   ├── shopping_repository_impl.dart
│   ├── user_repository_impl.dart
│   ├── social_repository_impl.dart
│   ├── ai_repository_impl.dart
│   └── payment_repository_impl.dart
│
├── models/                         # DTOs (JSON serializable)
│   ├── storage/
│   │   ├── storage_item_model.dart
│   │   └── storage_category_model.dart
│   ├── recipe/
│   │   ├── recipe_model.dart
│   │   └── ingredient_model.dart
│   └── shopping/
│       └── shopping_list_model.dart
│
├── mappers/                        # Entity <-> Model
│   ├── storage_mapper.dart
│   ├── recipe_mapper.dart
│   └── shopping_mapper.dart
│
└── data_sources/
    ├── local/                      # Local database operations
    │   ├── storage_local_data_source.dart
    │   ├── recipe_local_data_source.dart
    │   └── user_local_data_source.dart
    │
    └── remote/                     # API calls
        ├── storage_remote_data_source.dart
        ├── recipe_remote_data_source.dart
        ├── social_remote_data_source.dart
        └── ai_remote_data_source.dart
```

**pubspec.yaml:**

```yaml
name: data
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

**Repository Pattern:**

```dart
// data/repositories/storage_repository_impl.dart
import 'package:domain/repositories/storage_repository.dart';

class StorageRepositoryImpl implements StorageRepository {
  final StorageLocalDataSource _localDataSource;
  final StorageRemoteDataSource _remoteDataSource;
  
  // Constructor injection - dependencies từ DI
  StorageRepositoryImpl({
    required StorageLocalDataSource localDataSource,
    required StorageRemoteDataSource remoteDataSource,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource;
  
  @override
  Future<Result<List<StorageItem>, Failure>> getItems({
    String? categoryId,
    bool onlyExpiring = false,
  }) async {
    try {
      // Local first strategy
      final localModels = await _localDataSource.getItems(
        categoryId: categoryId,
        onlyExpiring: onlyExpiring,
      );
      
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

---

### 3. Infrastructure Modules

#### 3.1 Network (Pure Infrastructure)

**Path:** `/projects/core/network/`

```
lib/
├── network.dart
├── dio_client.dart
├── api_endpoints.dart
├── interceptors/
│   ├── auth_interceptor.dart
│   └── logging_interceptor.dart
└── exceptions/
    └── network_exception.dart
```

**pubspec.yaml:**

```yaml
name: network
dependencies:
  dio: ^5.4.0
  pretty_dio_logger: ^1.3.1
  
  # ❌ NO domain/data dependencies
  # ❌ NO get_it
```

#### 3.2 Local Storage (Pure Infrastructure)

**Path:** `/projects/core/local_storage/`

```
lib/
├── local_storage.dart
├── database/
│   ├── app_database.dart           # Drift
│   └── tables/
│       ├── storage_items_table.dart
│       ├── recipes_table.dart
│       └── shopping_lists_table.dart
└── preferences/
    └── app_preferences.dart
```

**pubspec.yaml:**

```yaml
name: local_storage
dependencies:
  drift: ^2.14.0
  sqlite3_flutter_libs: ^0.5.0
  shared_preferences: ^2.2.0
  path_provider: ^2.1.0
  
  # ❌ NO domain/data dependencies
  # ❌ NO get_it
```

#### 3.3 Config

**Path:** `/projects/core/config/`

```
lib/
├── config.dart
├── app_config.dart
├── constants/
│   ├── app_constants.dart
│   ├── api_constants.dart
│   └── storage_constants.dart
└── environment/
    ├── environment.dart
    ├── development_env.dart
    └── production_env.dart
```

---

### 4. Foundation Layer

#### 4.1 Design System

**Path:** `/projects/foundation/design_system/`

```
lib/
├── design_system.dart
├── theme/
│   ├── app_theme.dart
│   ├── light_theme.dart
│   └── dark_theme.dart
├── values/
│   ├── color/
│   │   └── app_color.dart
│   ├── dimen/
│   │   └── app_dimen.dart
│   └── typography/
│       └── app_font_size.dart
├── components/
│   ├── buttons/
│   ├── inputs/
│   ├── cards/
│   └── dialogs/
└── resources/
    └── app_icons.dart
```

#### 4.2 Navigation

**Path:** `/projects/foundation/navigation/`

```
lib/
├── navigation.dart
├── routes/
│   ├── app_routes.dart
│   ├── fridge_routes.dart
│   └── medicine_routes.dart
├── router/
│   └── app_router.dart          # go_router config
└── guards/
    └── auth_guard.dart
```

**pubspec.yaml:**

```yaml
name: navigation
dependencies:
  flutter:
    sdk: flutter
  go_router: ^14.0.0
  domain:
    path: ../../core/domain      # For auth check
```

#### 4.3 Common

**Path:** `/projects/foundation/common/`

```
lib/
├── common.dart
├── utils/
│   ├── date_utils.dart
│   ├── format_utils.dart
│   └── validation_utils.dart
├── extensions/
│   ├── string_extensions.dart
│   ├── datetime_extensions.dart
│   ├── context_extensions.dart
│   └── list_extensions.dart
└── constants/
    └── app_constants.dart
```

#### 4.4 Shared Presentation (Quan Trọng!)

**Path:** `/projects/foundation/shared_presentation/`

```
lib/
├── shared_presentation.dart
│
├── base/
│   ├── base_view_model.dart     # Base StateNotifier
│   ├── base_state.dart          # Common UI states
│   └── base_screen.dart
│
├── mixins/
│   ├── loading_state_mixin.dart
│   ├── error_handling_mixin.dart
│   └── validation_mixin.dart
│
├── widgets/                      # Shared smart widgets
│   ├── item_list/
│   │   ├── item_list_widget.dart
│   │   └── item_card_widget.dart
│   ├── expiry/
│   │   └── expiry_badge_widget.dart
│   ├── recipe/
│   │   └── recipe_card_widget.dart
│   └── shopping/
│       └── shopping_item_widget.dart
│
└── view_models/                  # Shared ViewModels
    ├── item_list_view_model.dart
    └── recipe_list_view_model.dart
```

**pubspec.yaml:**

```yaml
name: shared_presentation
dependencies:
  flutter:
    sdk: flutter
  domain:
    path: ../../core/domain
  design_system:
    path: ../design_system
  common:
    path: ../common
  
  get_it: ^7.6.0                 # ✅ To resolve use cases
  flutter_riverpod: ^2.5.0
  
  # ❌ NO data, network, local_storage
```

**Base ViewModel:**

```dart
// shared_presentation/base/base_view_model.dart
import 'package:get_it/get_it.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseViewModel<T> extends StateNotifier<T> {
  BaseViewModel(T initialState) : super(initialState);
  
  // Helper to resolve from GetIt
  U resolve<U extends Object>() => GetIt.I<U>();
  
  // Common async handler
  Future<void> handleAsync(Future<void> Function() operation) async {
    try {
      await operation();
    } catch (e) {
      // Handle error
    }
  }
}
```

---

### 5. Feature Modules

#### 5.1 Fridge Manager App

**Path:** `/projects/features/fridge_manager_app/`

```
lib/
├── fridge_manager_app.dart
│
└── presentation/
    ├── screens/
    │   ├── home/
    │   │   ├── fridge_home_screen.dart
    │   │   ├── fridge_home_view_model.dart
    │   │   └── fridge_home_state.dart
    │   ├── item_detail/
    │   ├── item_add/
    │   ├── recipe_list/
    │   ├── shopping_list/
    │   └── settings/
    │
    ├── widgets/
    │   ├── fridge_item_card.dart
    │   └── fridge_stats_widget.dart
    │
    └── providers/
        └── fridge_providers.dart
```

**pubspec.yaml:**

```yaml
name: fridge_manager_app
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
  
  # Core - ONLY domain!
  domain:
    path: ../../core/domain
  
  # DI
  get_it: ^7.6.0
  flutter_riverpod: ^2.5.0
  
  # ❌ NO data, network, local_storage, config
```

**ViewModel Pattern:**

```dart
// fridge_manager_app/presentation/screens/home/fridge_home_view_model.dart
import 'package:get_it/get_it.dart';
import 'package:domain/use_cases/storage/get_storage_items_use_case.dart';
import 'package:domain/use_cases/storage/get_expiring_items_use_case.dart';

class FridgeHomeViewModel extends StateNotifier<FridgeHomeState> {
  late final GetStorageItemsUseCase _getItemsUseCase;
  late final GetExpiringItemsUseCase _getExpiringItemsUseCase;
  
  FridgeHomeViewModel() : super(FridgeHomeState.initial()) {
    _getItemsUseCase = GetIt.I<GetStorageItemsUseCase>();
    _getExpiringItemsUseCase = GetIt.I<GetExpiringItemsUseCase>();
  }
  
  // For testing - inject dependencies
  FridgeHomeViewModel.test({
    required GetStorageItemsUseCase getItemsUseCase,
    required GetExpiringItemsUseCase getExpiringItemsUseCase,
  })  : _getItemsUseCase = getItemsUseCase,
        _getExpiringItemsUseCase = getExpiringItemsUseCase,
        super(FridgeHomeState.initial());
  
  Future<void> loadItems() async {
    state = state.copyWith(isLoading: true);
    
    final result = await _getItemsUseCase.execute();
    
    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
      (items) => state = state.copyWith(
        isLoading: false,
        items: items,
      ),
    );
  }
}

// Provider
final fridgeHomeViewModelProvider = StateNotifierProvider<
    FridgeHomeViewModel, FridgeHomeState>(
  (ref) => FridgeHomeViewModel(),
);
```

#### 5.2 Medicine Box Manager App

Tương tự `fridge_manager_app` nhưng với UI/logic đặc thù cho quản lý thuốc.

---

### 6. Root App - Dependency Injection

**Path:** `/lib/`

```
lib/
├── main.dart
├── app.dart
├── bootstrap.dart
│
└── di/
    ├── injection_container.dart
    └── injection_container.config.dart  # Generated
```

#### main.dart

```dart
import 'package:flutter/material.dart';
import 'di/injection_container.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Setup DI BEFORE running app
  await configureDependencies();
  
  runApp(const FridgeMateApp());
}
```

#### di/injection_container.dart

```dart
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

// Domain
import 'package:domain/repositories/storage_repository.dart';
import 'package:domain/repositories/recipe_repository.dart';
import 'package:domain/use_cases/storage/get_storage_items_use_case.dart';
import 'package:domain/use_cases/storage/add_item_to_storage_use_case.dart';
import 'package:domain/use_cases/recipe/get_suggested_recipes_use_case.dart';

// Data
import 'package:data/repositories/storage_repository_impl.dart';
import 'package:data/repositories/recipe_repository_impl.dart';
import 'package:data/data_sources/local/storage_local_data_source.dart';
import 'package:data/data_sources/remote/storage_remote_data_source.dart';

// Infrastructure
import 'package:network/dio_client.dart';
import 'package:local_storage/database/app_database.dart';
import 'package:local_storage/preferences/app_preferences.dart';
import 'package:config/app_config.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // ============================================
  // 1. Infrastructure Layer
  // ============================================
  
  // Config
  getIt.registerLazySingleton<AppConfig>(
    () => AppConfig.fromEnvironment(),
  );
  
  // Network
  getIt.registerLazySingleton<DioClient>(
    () => DioClient(baseUrl: getIt<AppConfig>().apiBaseUrl),
  );
  
  getIt.registerLazySingleton<Dio>(
    () => getIt<DioClient>().dio,
  );
  
  // Local Storage
  getIt.registerLazySingleton<AppDatabase>(
    () => AppDatabase(),
  );
  
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<AppPreferences>(
    () => AppPreferences(prefs),
  );
  
  // ============================================
  // 2. Data Sources
  // ============================================
  
  // Local
  getIt.registerLazySingleton<StorageLocalDataSource>(
    () => StorageLocalDataSource(getIt<AppDatabase>()),
  );
  
  getIt.registerLazySingleton<RecipeLocalDataSource>(
    () => RecipeLocalDataSource(getIt<AppDatabase>()),
  );
  
  // Remote
  getIt.registerLazySingleton<StorageRemoteDataSource>(
    () => StorageRemoteDataSource(getIt<Dio>()),
  );
  
  getIt.registerLazySingleton<RecipeRemoteDataSource>(
    () => RecipeRemoteDataSource(getIt<Dio>()),
  );
  
  // ============================================
  // 3. Repositories (Register as Interface!)
  // ============================================
  
  getIt.registerLazySingleton<StorageRepository>(
    () => StorageRepositoryImpl(
      localDataSource: getIt<StorageLocalDataSource>(),
      remoteDataSource: getIt<StorageRemoteDataSource>(),
    ),
  );
  
  getIt.registerLazySingleton<RecipeRepository>(
    () => RecipeRepositoryImpl(
      localDataSource: getIt<RecipeLocalDataSource>(),
      remoteDataSource: getIt<RecipeRemoteDataSource>(),
    ),
  );
  
  // ... Register all repositories
  
  // ============================================
  // 4. Use Cases
  // ============================================
  
  // Storage
  getIt.registerLazySingleton<GetStorageItemsUseCase>(
    () => GetStorageItemsUseCase(getIt<StorageRepository>()),
  );
  
  getIt.registerLazySingleton<AddItemToStorageUseCase>(
    () => AddItemToStorageUseCase(getIt<StorageRepository>()),
  );
  
  // Recipe
  getIt.registerLazySingleton<GetSuggestedRecipesUseCase>(
    () => GetSuggestedRecipesUseCase(getIt<RecipeRepository>()),
  );
  
  // ... Register all use cases
}
```

#### pubspec.yaml (Root)

```yaml
name: fridge_mate
description: FridgeMate - Smart Fridge & Medicine Management
version: 1.0.0+1

environment:
  sdk: ^3.9.2

dependencies:
  flutter:
    sdk: flutter
  
  # Feature modules
  fridge_manager_app:
    path: projects/features/fridge_manager_app
  medicine_box_manager_app:
    path: projects/features/medicine_box_manager_app
  
  # Foundation
  design_system:
    path: projects/foundation/design_system
  navigation:
    path: projects/foundation/navigation
  
  # Core (for DI setup)
  domain:
    path: projects/core/domain
  data:
    path: projects/core/data
  network:
    path: projects/core/network
  local_storage:
    path: projects/core/local_storage
  config:
    path: projects/core/config
  
  # DI & State Management
  get_it: ^7.6.0
  injectable: ^2.3.0
  flutter_riverpod: ^2.5.0
  
  # UI
  cupertino_icons: ^1.0.8

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  build_runner: ^2.4.0
  injectable_generator: ^2.4.0
  freezed: ^2.4.0
  json_serializable: ^6.7.0
```

## 📊 Dependency Graph Tổng Thể

```
┌────────────────────────────────────────────────┐
│  ROOT APP (/lib/)                              │
│  • main.dart, app.dart                         │
│  • /di/injection_container.dart                │
│  • Setup GetIt & register ALL dependencies    │
│                                                │
│  Imports: ALL modules                         │
│  Register: Infrastructure → Data → Domain     │
└──────────────────┬─────────────────────────────┘
                   │
     ┌─────────────┴─────────────┐
     │                           │
     ↓                           ↓
┌──────────────────┐    ┌──────────────────────┐
│  FEATURES        │    │  FOUNDATION          │
│  - fridge_app    │    │  - design_system     │
│  - medicine_app  │    │  - navigation        │
│                  │    │  - common            │
│  Depend:         │    │  - shared_presentation│
│  ✅ domain       │    │                      │
│  ✅ foundation   │    │  Depend:             │
│  ✅ get_it       │    │  ✅ domain           │
│  ❌ NO data/infra│    │  ✅ get_it (shared_p)│
└────────┬─────────┘    └──────────┬───────────┘
         │                         │
         └────────────┬────────────┘
                      ↓
            ┌─────────────────────┐
            │  DOMAIN (Pure Dart) │
            │  • Entities         │
            │  • Repositories (I) │
            │  • Use Cases        │
            │                     │
            │  Depend: NOTHING!   │
            └─────────────────────┘
                      ↑
                      │ implements
            ┌─────────────────────┐
            │  DATA               │
            │  • RepositoryImpl   │
            │  • Data Sources     │
            │                     │
            │  Depend:            │
            │  ✅ domain          │
            │  ✅ network         │
            │  ✅ local_storage   │
            │  ❌ NO get_it       │
            └─────────┬───────────┘
                      │ uses
         ┌────────────┴────────────┐
         ↓                         ↓
┌──────────────────┐    ┌─────────────────────┐
│  NETWORK         │    │  LOCAL_STORAGE      │
│  • DioClient     │    │  • AppDatabase      │
│  • Interceptors  │    │  • Tables           │
│                  │    │  • AppPreferences   │
│  Depend:         │    │                     │
│  ✅ dio          │    │  Depend:            │
│  ❌ NO domain    │    │  ✅ drift           │
│  ❌ NO get_it    │    │  ❌ NO domain       │
└──────────────────┘    └─────────────────────┘
```

## ✅ Validation Checklist

**Domain Layer:**

- [ ] Không phụ thuộc bất kỳ module nào (pure Dart)
- [ ] Không có get_it dependency
- [ ] Chỉ chứa entities, repository interfaces, use cases
- [ ] Use cases dùng constructor injection

**Data Layer:**

- [ ] Implement tất cả repository interfaces từ domain
- [ ] Phụ thuộc: domain, network, local_storage
- [ ] KHÔNG có get_it
- [ ] Repositories dùng constructor injection

**Infrastructure (network, local_storage):**

- [ ] Pure infrastructure - no business logic
- [ ] KHÔNG phụ thuộc domain/data
- [ ] KHÔNG có get_it

**Foundation:**

- [ ] design_system, navigation, common: NO get_it
- [ ] shared_presentation: CÓ get_it (để ViewModels dùng)
- [ ] Chỉ phụ thuộc domain (không phụ thuộc data)

**Features:**

- [ ] Phụ thuộc: domain, foundation, get_it
- [ ] KHÔNG phụ thuộc: data, network, local_storage, config
- [ ] ViewModels dùng GetIt.I<UseCase>()

**Root App:**

- [ ] Import TẤT CẢ modules
- [ ] Setup DI trong /lib/di/injection_container.dart
- [ ] Register theo thứ tự: Infrastructure → Data Sources → Repositories → Use Cases

## 🚀 Implementation Roadmap

### Phase 1: Core Foundation (Week 1-2)

**1.1 Domain Layer**

- [ ] Tạo domain module structure
- [ ] Implement entities cho Phase 1 (storage, recipe, shopping)
- [ ] Define repository interfaces
- [ ] Implement use cases cho Phase 1
- [ ] Setup freezed, dartz
- [ ] Unit tests cho use cases

**1.2 Infrastructure**

- [ ] Tạo network module với Dio setup
- [ ] Tạo local_storage module với Drift
- [ ] Define database tables
- [ ] Tạo config module
- [ ] Setup environments (dev/prod)

**1.3 Data Layer**

- [ ] Implement repositories cho Phase 1
- [ ] Tạo models (DTOs) với JSON serialization
- [ ] Implement mappers (Entity ↔ Model)
- [ ] Implement data sources (local/remote)
- [ ] Integration tests

### Phase 2: Foundation Layer (Week 2-3)

**2.1 Design System**

- [ ] Setup theme (light/dark)
- [ ] Define colors, typography, spacing
- [ ] Tạo base components (buttons, inputs, cards)
- [ ] Tạo app icons

**2.2 Navigation**

- [ ] Setup go_router
- [ ] Define routes cho 2 apps
- [ ] Implement navigation guards

**2.3 Common Utilities**

- [ ] Date/String formatters
- [ ] Validators
- [ ] Extensions

**2.4 Shared Presentation**

- [ ] Base ViewModel với GetIt helper
- [ ] Base State classes
- [ ] Common widgets (item lists, badges)
- [ ] Shared ViewModels

### Phase 3: Feature Implementation (Week 3-5)

**3.1 Fridge Manager App**

- [ ] Home screen (dashboard)
- [ ] Item management screens
- [ ] Recipe list screens
- [ ] Shopping list screens
- [ ] Settings screen
- [ ] ViewModels với GetIt integration

**3.2 Medicine Box Manager App**

- [ ] Tương tự fridge app
- [ ] Customize UI cho medicine context

**3.3 Root App**

- [ ] Setup DI container
- [ ] Register ALL dependencies
- [ ] App initialization
- [ ] Flavor configuration

### Phase 4: Testing & QA (Week 5-6)

- [ ] Unit tests (domain use cases)
- [ ] Widget tests (presentation)
- [ ] Integration tests (data layer)
- [ ] E2E tests (critical flows)
- [ ] Performance testing
- [ ] Dependency validation

### Phase 5: Documentation (Week 6)

- [ ] Architecture documentation
- [ ] Dependency diagrams
- [ ] Code guidelines
- [ ] Onboarding guide
- [ ] API documentation

## 📝 Key Principles Summary

1. **Dependency Inversion**: Presentation → Domain ← Data
2. **Service Locator Pattern**: GetIt ONLY in presentation layer
3. **Constructor Injection**: Domain & Data use pure DI
4. **Module Independence**: No module depends on DI module
5. **Separation of Concerns**: Each layer has clear responsibility
6. **Testability**: All layers independently testable
7. **Scalability**: Easy to add new features/apps

## 💡 Important Notes

- **Domain is king**: Không phụ thuộc gì, pure business logic
- **GetIt placement**: Chỉ ở presentation (ViewModels), KHÔNG ở domain/data
- **Repository pattern**: Always register interface, return implementation
- **Use case pattern**: Single responsibility, one business operation
- **Shared logic**: >70% logic ở core/foundation, features chỉ UI
- **State management**: Riverpod + ViewModels pattern
- **Code generation**: Freezed, JSON serializable, Injectable (optional)

### To-dos

- [ ] Phân tích chi tiết cấu trúc hiện tại và xác định gaps
- [ ] Tạo các module còn thiếu: network, local_storage, di, common, shared_presentation
- [ ] Cập nhật pubspec.yaml cho tất cả modules với dependencies chính xác
- [ ] Tạo cấu trúc thư mục chi tiết cho mỗi module theo đề xuất
- [ ] Implement core domain: entities, repositories, use cases
- [ ] Setup DI container và Riverpod providers structure
- [ ] Tạo shared presentation layer với base classes và common widgets
- [ ] Restructure feature modules (fridge_app, medicine_app) theo cấu trúc mới
- [ ] Setup navigation system với go_router
- [ ] Tạo documentation và architectural guidelines