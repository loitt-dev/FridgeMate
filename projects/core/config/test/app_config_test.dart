import 'package:config/config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppConfig', () {
    test('creates configuration from environment', () {
      final config = AppConfig.fromEnvironment();

      expect(config, isNotNull);
      expect(config.environment, isA<Environment>());
      expect(config.apiBaseUrl, isNotEmpty);
      expect(config.appName, isNotEmpty);
    });

    test('has correct feature flags for Phase 1', () {
      final config = AppConfig.fromEnvironment();

      // Phase 1 - all enabled
      expect(config.isDebug, isTrue);

      // Future phases - all disabled
      expect(config.enableAiFeatures, isFalse);
      expect(config.enableSocialFeatures, isFalse);
      expect(config.enablePaymentFeatures, isFalse);
    });

    test('provides valid network configuration', () {
      final config = AppConfig.fromEnvironment();

      expect(config.connectTimeout.inSeconds, greaterThan(0));
      expect(config.receiveTimeout.inSeconds, greaterThan(0));
      expect(config.sendTimeout.inSeconds, greaterThan(0));
    });

    test('provides valid cache configuration', () {
      final config = AppConfig.fromEnvironment();

      expect(config.cacheExpiration, greaterThan(Duration.zero));
      expect(config.enableCaching, isTrue);
    });

    test('provides API URL with version', () {
      final config = AppConfig.fromEnvironment();

      expect(config.apiUrl, contains(config.apiBaseUrl));
      expect(config.apiUrl, contains('v1'));
    });
  });

  group('Environment', () {
    test('creates environment from string', () {
      expect(
        Environment.fromString('development'),
        equals(Environment.development),
      );
      expect(
        Environment.fromString('staging'),
        equals(Environment.staging),
      );
      expect(
        Environment.fromString('production'),
        equals(Environment.production),
      );
    });

    test('defaults to development for unknown environment', () {
      expect(
        Environment.fromString('unknown'),
        equals(Environment.development),
      );
    });

    test('provides correct environment checks', () {
      final dev = Environment.development;
      expect(dev.isDevelopment, isTrue);
      expect(dev.isStaging, isFalse);
      expect(dev.isProduction, isFalse);

      final prod = Environment.production;
      expect(prod.isDevelopment, isFalse);
      expect(prod.isStaging, isFalse);
      expect(prod.isProduction, isTrue);
    });

    test('provides display name', () {
      expect(Environment.development.name, equals('Development'));
      expect(Environment.staging.name, equals('Staging'));
      expect(Environment.production.name, equals('Production'));
    });
  });

  group('AppConstants', () {
    test('provides valid app constants', () {
      expect(AppConstants.appName, isNotEmpty);
      expect(AppConstants.databaseName, isNotEmpty);
      expect(AppConstants.defaultPageSize, greaterThan(0));
      expect(AppConstants.maxImageSize, greaterThan(0));
    });

    test('provides valid validation constants', () {
      expect(AppConstants.minPasswordLength, greaterThan(0));
      expect(AppConstants.maxNameLength, greaterThan(0));
      expect(AppConstants.maxDescriptionLength, greaterThan(0));
    });
  });

  group('ApiConstants', () {
    test('provides valid API constants', () {
      expect(ApiConstants.connectTimeout, greaterThan(Duration.zero));
      expect(ApiConstants.maxRetries, greaterThan(0));
      expect(ApiConstants.contentType, isNotEmpty);
    });

    test('provides valid status codes', () {
      expect(ApiConstants.successCode, equals(200));
      expect(ApiConstants.createdCode, equals(201));
      expect(ApiConstants.badRequestCode, equals(400));
      expect(ApiConstants.unauthorizedCode, equals(401));
    });
  });

  group('StorageConstants', () {
    test('provides valid preference keys', () {
      expect(StorageConstants.authTokenKey, isNotEmpty);
      expect(StorageConstants.userIdKey, isNotEmpty);
      expect(StorageConstants.themeKey, isNotEmpty);
    });

    test('provides valid table names', () {
      expect(StorageConstants.storageItemsTable, isNotEmpty);
      expect(StorageConstants.recipesTable, isNotEmpty);
      expect(StorageConstants.shoppingListsTable, isNotEmpty);
    });
  });
}
