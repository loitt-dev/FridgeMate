/// Production environment configuration
class ProductionEnv {
  // API Configuration
  static const String apiBaseUrl = 'https://api.fridgemate.com';
  static const String apiVersion = 'v1';

  // Database Configuration
  static const String databaseName = 'fridgemate.db';
  static const bool enableDatabaseLogging = false;

  // Feature Flags
  static const bool enableDebugMode = false;
  static const bool enableLogging = false;
  static const bool enablePerformanceMonitoring = true;
  static const bool enableCrashReporting = true;

  // Network Configuration
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const Duration sendTimeout = Duration(seconds: 15);

  // Cache Configuration
  static const Duration cacheExpiration = Duration(hours: 24);
  static const bool enableCaching = true;

  // Notification Configuration
  static const bool enablePushNotifications = true;
  static const int expiryWarningDays = 3;

  // AI Configuration (Phase 3)
  static const String aiServiceUrl = 'https://ai.fridgemate.com';
  static const bool enableAiFeatures = false; // Will enable in Phase 3

  // Payment Configuration (Phase 5)
  static const String paymentGatewayUrl = 'https://payments.fridgemate.com';
  static const bool enablePaymentFeatures = false; // Will enable in Phase 5

  // Social Configuration (Phase 4)
  static const bool enableSocialFeatures = false; // Will enable in Phase 4

  // Logging
  static const bool verboseLogging = false;
  static const bool logApiRequests = false;
  static const bool logDatabaseQueries = false;

  // Security
  static const bool enableSslPinning = true;
  static const bool enableEncryption = true;
}
