# Config Module

## 📋 Tổng Quan

Config module cung cấp constants, environment configuration, và app settings cho FridgeMate.

## 🎯 Nguyên Tắc

- **Configuration**: App constants và environment settings
- **Environment**: Development, staging, production configs
- **Constants**: API endpoints, app constants, storage keys
- **No Dependencies**: Không phụ thuộc modules khác
- **Type Safe**: Strongly typed configuration

## 📁 Cấu Trúc

```
lib/
├── config.dart
├── app_config.dart                 # Main configuration
├── constants/
│   ├── app_constants.dart          # App-wide constants
│   ├── api_constants.dart          # API endpoints
│   ├── storage_constants.dart      # Storage keys
│   └── constants.dart
└── environment/
    ├── environment.dart            # Environment enum
    ├── development_env.dart        # Dev config
    └── production_env.dart         # Prod config
```

## 🔧 Dependencies

```yaml
dependencies:
  # ❌ NO external dependencies
  # ❌ NO domain/data dependencies
  # ❌ NO get_it
```

## 📝 Sử Dụng

### App Configuration

```dart
class AppConfig {
  final String apiBaseUrl;
  final String appName;
  final String version;
  final bool isDebug;
  final Environment environment;
  
  const AppConfig({
    required this.apiBaseUrl,
    required this.appName,
    required this.version,
    required this.isDebug,
    required this.environment,
  });
  
  factory AppConfig.fromEnvironment() {
    const environment = String.fromEnvironment('ENV', defaultValue: 'development');
    
    switch (environment) {
      case 'production':
        return ProductionEnvironment.config;
      case 'staging':
        return StagingEnvironment.config;
      default:
        return DevelopmentEnvironment.config;
    }
  }
}
```

### Environment Configurations

```dart
enum Environment {
  development,
  staging,
  production,
}

class DevelopmentEnvironment {
  static const AppConfig config = AppConfig(
    apiBaseUrl: 'http://localhost:3000/api',
    appName: 'FridgeMate Dev',
    version: '1.0.0-dev',
    isDebug: true,
    environment: Environment.development,
  );
}

class ProductionEnvironment {
  static const AppConfig config = AppConfig(
    apiBaseUrl: 'https://api.fridgemate.com',
    appName: 'FridgeMate',
    version: '1.0.0',
    isDebug: false,
    environment: Environment.production,
  );
}
```

### Constants

```dart
class AppConstants {
  // App Info
  static const String appName = 'FridgeMate';
  static const String appVersion = '1.0.0';
  
  // Storage
  static const String databaseName = 'fridgemate.db';
  static const int databaseVersion = 1;
  
  // UI
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 8.0;
  static const Duration animationDuration = Duration(milliseconds: 300);
}

class ApiConstants {
  // Endpoints
  static const String baseUrl = 'https://api.fridgemate.com';
  static const String storageItems = '/api/v1/storage/items';
  static const String recipes = '/api/v1/recipes';
  static const String shoppingLists = '/api/v1/shopping/lists';
  
  // Headers
  static const String contentType = 'application/json';
  static const String acceptLanguage = 'vi-VN';
  
  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}

class StorageConstants {
  // SharedPreferences Keys
  static const String lastSelectedCategory = 'last_selected_category';
  static const String favoriteRecipeIds = 'favorite_recipe_ids';
  static const String isDarkMode = 'is_dark_mode';
  static const String language = 'language';
  
  // Database Tables
  static const String storageItemsTable = 'storage_items';
  static const String storageCategoriesTable = 'storage_categories';
  static const String recipesTable = 'recipes';
  static const String shoppingListsTable = 'shopping_lists';
}
```

## ✅ Validation

- [ ] Pure configuration - no business logic
- [ ] KHÔNG phụ thuộc modules khác
- [ ] KHÔNG có get_it
- [ ] Environment configs được setup
- [ ] Constants được organize đúng
- [ ] Type safe configuration
- [ ] Easy to change environments

## 🚀 Phase 1 Features

- **Environment Management**: Dev, staging, production
- **API Configuration**: Base URLs và endpoints
- **App Constants**: UI constants và settings
- **Storage Keys**: Database và preferences keys
- **Build Configuration**: Environment-specific builds