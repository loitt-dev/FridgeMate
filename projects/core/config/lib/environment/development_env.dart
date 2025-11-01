/// Development environment configuration
class DevelopmentEnv {
  // API Configuration
  static const String apiBaseUrl = 'http://localhost:3000';
  static const String apiVersion = 'v1';

  // Database Configuration
  static const String databaseName = 'fridgemate_dev.db';
  static const bool enableDatabaseLogging = true;

  // Feature Flags
  static const bool enableDebugMode = true;
  static const bool enableLogging = true;
  static const bool enablePerformanceMonitoring = true;
  static const bool enableCrashReporting = false; // Disable in dev

  // Network Configuration
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

  // Cache Configuration
  static const Duration cacheExpiration = Duration(
    minutes: 5,
  ); // Short cache in dev
  static const bool enableCaching = true;

  // Notification Configuration
  static const bool enablePushNotifications = false; // Disable in dev
  static const int expiryWarningDays = 3;

  // AI Configuration (Phase 3)
  static const String aiServiceUrl = 'http://localhost:5000';
  static const bool enableAiFeatures = false; // Disabled for Phase 1

  // Payment Configuration (Phase 5)
  static const String paymentGatewayUrl = 'http://localhost:4000';
  static const bool enablePaymentFeatures = false; // Disabled for Phase 1

  // Social Configuration (Phase 4)
  static const bool enableSocialFeatures = false; // Disabled for Phase 1

  // Logging
  static const bool verboseLogging = true;
  static const bool logApiRequests = true;
  static const bool logDatabaseQueries = true;
}
