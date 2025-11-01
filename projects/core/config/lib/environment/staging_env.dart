/// Staging environment configuration
class StagingEnv {
  // API Configuration
  static const String apiBaseUrl = 'https://staging-api.fridgemate.com';
  static const String apiVersion = 'v1';

  // Database Configuration
  static const String databaseName = 'fridgemate_staging.db';
  static const bool enableDatabaseLogging = true;

  // Feature Flags
  static const bool enableDebugMode = true;
  static const bool enableLogging = true;
  static const bool enablePerformanceMonitoring = true;
  static const bool enableCrashReporting = true;

  // Network Configuration
  static const Duration connectTimeout = Duration(seconds: 20);
  static const Duration receiveTimeout = Duration(seconds: 20);
  static const Duration sendTimeout = Duration(seconds: 20);

  // Cache Configuration
  static const Duration cacheExpiration = Duration(hours: 1);
  static const bool enableCaching = true;

  // Notification Configuration
  static const bool enablePushNotifications = true;
  static const int expiryWarningDays = 3;

  // AI Configuration (Phase 3)
  static const String aiServiceUrl = 'https://staging-ai.fridgemate.com';
  static const bool enableAiFeatures = false; // Will enable in Phase 3

  // Payment Configuration (Phase 5)
  static const String paymentGatewayUrl = 'https://staging-payments.fridgemate.com';
  static const bool enablePaymentFeatures = false; // Will enable in Phase 5

  // Social Configuration (Phase 4)
  static const bool enableSocialFeatures = false; // Will enable in Phase 4

  // Logging
  static const bool verboseLogging = true;
  static const bool logApiRequests = true;
  static const bool logDatabaseQueries = true;

  // Security
  static const bool enableSslPinning = false; // Disabled for testing
  static const bool enableEncryption = true;
}
