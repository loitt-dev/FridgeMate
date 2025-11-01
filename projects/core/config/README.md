# Config Module

Configuration layer for FridgeMate - Provides environment-specific settings, constants, and application configuration.

## 📋 Overview

The `config` module is a **pure Dart module** (no external dependencies) that centralizes all configuration settings and constants used across the FridgeMate application.

## 🏗️ Architecture Principles

- ✅ **Pure Dart**: No external dependencies (not even Flutter SDK)
- ✅ **Zero Dependencies**: Self-contained configuration module
- ✅ **Environment-aware**: Supports development, staging, and production
- ✅ **Type-safe**: All configurations are strongly typed
- ✅ **Centralized**: Single source of truth for all app constants

## 📁 Structure

```
lib/
├── config.dart                     # Export barrel
├── app_config.dart                 # Main configuration class
│
├── environment/
│   ├── environment.dart            # Environment enum + exports
│   ├── development_env.dart        # Development settings
│   ├── staging_env.dart            # Staging settings
│   └── production_env.dart         # Production settings
│
└── constants/
    ├── constants.dart              # Export barrel
    ├── app_constants.dart          # App-level constants
    ├── api_constants.dart          # API-related constants
    └── storage_constants.dart      # Storage keys and paths
```

## 🎯 Usage

### Basic Usage

```dart
import 'package:config/config.dart';

void main() {
  // Get configuration from environment
  final config = AppConfig.fromEnvironment();
  
  print('Environment: ${config.environment.name}');
  print('API URL: ${config.apiBaseUrl}');
  print('Debug Mode: ${config.isDebug}');
}
```

### Using in Dependency Injection

```dart
// lib/di/injection_container.dart
import 'package:config/config.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Register AppConfig
  getIt.registerLazySingleton<AppConfig>(
    () => AppConfig.fromEnvironment(),
  );
  
  // Use config in other registrations
  getIt.registerLazySingleton<DioClient>(
    () => DioClient(
      baseUrl: getIt<AppConfig>().apiBaseUrl,
      connectTimeout: getIt<AppConfig>().connectTimeout,
    ),
  );
}
```

### Environment-Specific Builds

```bash
# Development (default)
flutter run

# Staging
flutter run --dart-define=ENVIRONMENT=staging

# Production
flutter run --dart-define=ENVIRONMENT=production
```

## 📦 Components

### 1. AppConfig

Main configuration class that provides all app settings based on environment.

```dart
final config = AppConfig.fromEnvironment();

// App Info
config.appName;          // 'FridgeMate Dev' | 'FridgeMate Staging' | 'FridgeMate'
config.appVersion;       // '1.0.0'
config.isDebug;          // true | false

// API
config.apiBaseUrl;       // Environment-specific API URL
config.apiUrl;           // Full API URL with version

// Database
config.databaseName;     // Environment-specific DB name
config.enableDatabaseLogging;

// Feature Flags
config.enableLogging;
config.enablePerformanceMonitoring;
config.enableCrashReporting;

// Network
config.connectTimeout;
config.receiveTimeout;
config.sendTimeout;

// Cache
config.cacheExpiration;
config.enableCaching;

// Notifications
config.enablePushNotifications;
config.expiryWarningDays;

// Phase 3 - AI Features
config.enableAiFeatures;
config.aiServiceUrl;

// Phase 4 - Social Features
config.enableSocialFeatures;

// Phase 5 - Payment Features
config.enablePaymentFeatures;
config.paymentGatewayUrl;
```

### 2. Environment Enum

```dart
enum Environment {
  development,
  staging,
  production;
}

// Usage
final env = Environment.fromString('production');
if (env.isDevelopment) {
  // Development-specific logic
}
```

### 3. Constants

#### App Constants

```dart
import 'package:config/constants/app_constants.dart';

AppConstants.appName;                    // 'FridgeMate'
AppConstants.databaseName;               // 'fridgemate.db'
AppConstants.defaultPageSize;            // 20
AppConstants.maxImageSize;               // 5MB
AppConstants.defaultExpiryWarningDays;   // 3
```

#### API Constants

```dart
import 'package:config/constants/api_constants.dart';

ApiConstants.connectTimeout;             // Duration(seconds: 30)
ApiConstants.maxRetries;                 // 3
ApiConstants.contentType;                // 'application/json'
ApiConstants.successCode;                // 200
```

#### Storage Constants

```dart
import 'package:config/constants/storage_constants.dart';

// SharedPreferences keys
StorageConstants.authTokenKey;           // 'auth_token'
StorageConstants.themeKey;               // 'theme'

// Database tables
StorageConstants.storageItemsTable;      // 'storage_items'
StorageConstants.recipesTable;           // 'recipes'

// Cache keys
StorageConstants.categoriesCacheKey;     // 'categories_cache'
```

## 🔧 Environment Configurations

### Development Environment

- **API**: `http://localhost:3000`
- **Database**: `fridgemate_dev.db`
- **Debug**: Enabled
- **Logging**: Verbose
- **Cache**: 5 minutes
- **Features**: All future features disabled

### Staging Environment

- **API**: `https://staging-api.fridgemate.com`
- **Database**: `fridgemate_staging.db`
- **Debug**: Enabled
- **Logging**: Verbose
- **Cache**: 1 hour
- **Features**: All future features disabled

### Production Environment

- **API**: `https://api.fridgemate.com`
- **Database**: `fridgemate.db`
- **Debug**: Disabled
- **Logging**: Minimal
- **Cache**: 24 hours
- **Security**: SSL pinning enabled

## 🎭 Phase-Based Feature Flags

### Phase 1 (Current) - Offline Management
All basic features enabled by default.

### Phase 2 - Online Features
- User authentication
- Data synchronization
- Cloud backup

### Phase 3 - AI Features
```dart
if (config.enableAiFeatures) {
  // Image recognition
  // Barcode scanning
  // AI suggestions
}
```

### Phase 4 - Social Features
```dart
if (config.enableSocialFeatures) {
  // Community features
  // Recipe sharing
  // Social interactions
}
```

### Phase 5 - E-commerce
```dart
if (config.enablePaymentFeatures) {
  // Order management
  // Payment processing
  // Delivery tracking
}
```

## ✅ Best Practices

### 1. Use AppConfig for Runtime Configuration
```dart
// ✅ Good
final config = getIt<AppConfig>();
if (config.enableLogging) {
  logger.log('Something happened');
}

// ❌ Bad - Don't hardcode
if (kDebugMode) {
  logger.log('Something happened');
}
```

### 2. Use Constants for Static Values
```dart
// ✅ Good
final pageSize = AppConstants.defaultPageSize;

// ❌ Bad - Don't use magic numbers
final pageSize = 20;
```

### 3. Environment-Specific Logic
```dart
// ✅ Good
if (config.environment.isDevelopment) {
  // Dev-only code
}

// ❌ Bad - Don't use build-time constants
#if DEBUG
  // This is less flexible
#endif
```

## 🧪 Testing

```dart
import 'package:config/config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppConfig', () {
    test('creates development config by default', () {
      final config = AppConfig.fromEnvironment();
      
      expect(config.environment, Environment.development);
      expect(config.isDebug, true);
      expect(config.apiBaseUrl, DevelopmentEnv.apiBaseUrl);
    });
    
    test('has correct feature flags for Phase 1', () {
      final config = AppConfig.fromEnvironment();
      
      expect(config.enableAiFeatures, false);
      expect(config.enableSocialFeatures, false);
      expect(config.enablePaymentFeatures, false);
    });
  });
}
```

## 📝 Notes

- This module has **zero external dependencies**
- All configurations are compile-time constants when possible
- Environment switching is done via `--dart-define`
- Feature flags allow gradual rollout of new phases
- Constants are organized by domain (app, api, storage)

## 🔗 Dependencies

**None** - This is a pure Dart module with no dependencies.

## 📚 Related Modules

- Used by: `network`, `data`, `local_storage`, and all other modules
- Depends on: None

## 🚀 Future Enhancements

- [ ] Remote configuration (Phase 2)
- [ ] A/B testing flags (Phase 4)
- [ ] Dynamic feature toggles (Phase 4)
- [ ] Analytics configuration (Phase 4)