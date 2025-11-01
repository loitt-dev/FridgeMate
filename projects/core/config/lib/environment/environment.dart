import 'development_env.dart';
import 'production_env.dart';
import 'staging_env.dart';

export 'development_env.dart';
export 'production_env.dart';
export 'staging_env.dart';

/// Environment enum for FridgeMate app
enum Environment {
  development,
  staging,
  production;

  /// Create Environment from string value
  static Environment fromString(String value) {
    switch (value.toLowerCase()) {
      case 'development':
        return Environment.development;
      case 'staging':
        return Environment.staging;
      case 'production':
        return Environment.production;
      default:
        return Environment.development;
    }
  }

  /// Check if current environment is development
  bool get isDevelopment => this == Environment.development;

  /// Check if current environment is staging
  bool get isStaging => this == Environment.staging;

  /// Check if current environment is production
  bool get isProduction => this == Environment.production;

  /// Get display name of environment
  String get name {
    switch (this) {
      case Environment.development:
        return 'Development';
      case Environment.staging:
        return 'Staging';
      case Environment.production:
        return 'Production';
    }
  }

  /// Get API base URL for current environment
  String get apiBaseUrl {
    switch (this) {
      case Environment.development:
        return DevelopmentEnv.apiBaseUrl;
      case Environment.staging:
        return StagingEnv.apiBaseUrl;
      case Environment.production:
        return ProductionEnv.apiBaseUrl;
    }
  }

  /// Get database name for current environment
  String get databaseName {
    switch (this) {
      case Environment.development:
        return DevelopmentEnv.databaseName;
      case Environment.staging:
        return StagingEnv.databaseName;
      case Environment.production:
        return ProductionEnv.databaseName;
    }
  }

  /// Check if debug mode is enabled
  bool get isDebugMode {
    switch (this) {
      case Environment.development:
        return DevelopmentEnv.enableDebugMode;
      case Environment.staging:
        return StagingEnv.enableDebugMode;
      case Environment.production:
        return ProductionEnv.enableDebugMode;
    }
  }

  /// Check if logging is enabled
  bool get isLoggingEnabled {
    switch (this) {
      case Environment.development:
        return DevelopmentEnv.enableLogging;
      case Environment.staging:
        return StagingEnv.enableLogging;
      case Environment.production:
        return ProductionEnv.enableLogging;
    }
  }
}
