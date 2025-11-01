import 'environment/environment.dart';

/// Application configuration based on environment
class AppConfig {
  final String apiBaseUrl;
  final String appName;
  final String appVersion;
  final bool isDebug;
  final Environment environment;

  // Database
  final String databaseName;
  final bool enableDatabaseLogging;

  // Feature Flags
  final bool enableLogging;
  final bool enablePerformanceMonitoring;
  final bool enableCrashReporting;

  // Network
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final Duration sendTimeout;

  // Cache
  final Duration cacheExpiration;
  final bool enableCaching;

  // Notifications
  final bool enablePushNotifications;
  final int expiryWarningDays;

  // Phase 3 - AI Features
  final String aiServiceUrl;
  final bool enableAiFeatures;

  // Phase 5 - Payment Features
  final String paymentGatewayUrl;
  final bool enablePaymentFeatures;

  // Phase 4 - Social Features
  final bool enableSocialFeatures;

  // Logging
  final bool verboseLogging;
  final bool logApiRequests;
  final bool logDatabaseQueries;

  const AppConfig({
    required this.apiBaseUrl,
    required this.appName,
    required this.appVersion,
    required this.isDebug,
    required this.environment,
    required this.databaseName,
    required this.enableDatabaseLogging,
    required this.enableLogging,
    required this.enablePerformanceMonitoring,
    required this.enableCrashReporting,
    required this.connectTimeout,
    required this.receiveTimeout,
    required this.sendTimeout,
    required this.cacheExpiration,
    required this.enableCaching,
    required this.enablePushNotifications,
    required this.expiryWarningDays,
    required this.aiServiceUrl,
    required this.enableAiFeatures,
    required this.paymentGatewayUrl,
    required this.enablePaymentFeatures,
    required this.enableSocialFeatures,
    required this.verboseLogging,
    required this.logApiRequests,
    required this.logDatabaseQueries,
  });

  /// Create AppConfig from environment variables
  factory AppConfig.fromEnvironment() {
    const envString = String.fromEnvironment(
      'ENVIRONMENT',
      defaultValue: 'development',
    );
    final env = Environment.fromString(envString);

    return AppConfig._fromEnv(env);
  }

  /// Create AppConfig for specific environment
  factory AppConfig._fromEnv(Environment env) {
    switch (env) {
      case Environment.development:
        return AppConfig(
          apiBaseUrl: DevelopmentEnv.apiBaseUrl,
          appName: 'FridgeMate Dev',
          appVersion: '1.0.0',
          isDebug: true,
          environment: env,
          databaseName: DevelopmentEnv.databaseName,
          enableDatabaseLogging: DevelopmentEnv.enableDatabaseLogging,
          enableLogging: DevelopmentEnv.enableLogging,
          enablePerformanceMonitoring:
              DevelopmentEnv.enablePerformanceMonitoring,
          enableCrashReporting: DevelopmentEnv.enableCrashReporting,
          connectTimeout: DevelopmentEnv.connectTimeout,
          receiveTimeout: DevelopmentEnv.receiveTimeout,
          sendTimeout: DevelopmentEnv.sendTimeout,
          cacheExpiration: DevelopmentEnv.cacheExpiration,
          enableCaching: DevelopmentEnv.enableCaching,
          enablePushNotifications: DevelopmentEnv.enablePushNotifications,
          expiryWarningDays: DevelopmentEnv.expiryWarningDays,
          aiServiceUrl: DevelopmentEnv.aiServiceUrl,
          enableAiFeatures: DevelopmentEnv.enableAiFeatures,
          paymentGatewayUrl: DevelopmentEnv.paymentGatewayUrl,
          enablePaymentFeatures: DevelopmentEnv.enablePaymentFeatures,
          enableSocialFeatures: DevelopmentEnv.enableSocialFeatures,
          verboseLogging: DevelopmentEnv.verboseLogging,
          logApiRequests: DevelopmentEnv.logApiRequests,
          logDatabaseQueries: DevelopmentEnv.logDatabaseQueries,
        );

      case Environment.staging:
        return AppConfig(
          apiBaseUrl: StagingEnv.apiBaseUrl,
          appName: 'FridgeMate Staging',
          appVersion: '1.0.0',
          isDebug: true,
          environment: env,
          databaseName: StagingEnv.databaseName,
          enableDatabaseLogging: StagingEnv.enableDatabaseLogging,
          enableLogging: StagingEnv.enableLogging,
          enablePerformanceMonitoring: StagingEnv.enablePerformanceMonitoring,
          enableCrashReporting: StagingEnv.enableCrashReporting,
          connectTimeout: StagingEnv.connectTimeout,
          receiveTimeout: StagingEnv.receiveTimeout,
          sendTimeout: StagingEnv.sendTimeout,
          cacheExpiration: StagingEnv.cacheExpiration,
          enableCaching: StagingEnv.enableCaching,
          enablePushNotifications: StagingEnv.enablePushNotifications,
          expiryWarningDays: StagingEnv.expiryWarningDays,
          aiServiceUrl: StagingEnv.aiServiceUrl,
          enableAiFeatures: StagingEnv.enableAiFeatures,
          paymentGatewayUrl: StagingEnv.paymentGatewayUrl,
          enablePaymentFeatures: StagingEnv.enablePaymentFeatures,
          enableSocialFeatures: StagingEnv.enableSocialFeatures,
          verboseLogging: StagingEnv.verboseLogging,
          logApiRequests: StagingEnv.logApiRequests,
          logDatabaseQueries: StagingEnv.logDatabaseQueries,
        );

      case Environment.production:
        return AppConfig(
          apiBaseUrl: ProductionEnv.apiBaseUrl,
          appName: 'FridgeMate',
          appVersion: '1.0.0',
          isDebug: false,
          environment: env,
          databaseName: ProductionEnv.databaseName,
          enableDatabaseLogging: ProductionEnv.enableDatabaseLogging,
          enableLogging: ProductionEnv.enableLogging,
          enablePerformanceMonitoring:
              ProductionEnv.enablePerformanceMonitoring,
          enableCrashReporting: ProductionEnv.enableCrashReporting,
          connectTimeout: ProductionEnv.connectTimeout,
          receiveTimeout: ProductionEnv.receiveTimeout,
          sendTimeout: ProductionEnv.sendTimeout,
          cacheExpiration: ProductionEnv.cacheExpiration,
          enableCaching: ProductionEnv.enableCaching,
          enablePushNotifications: ProductionEnv.enablePushNotifications,
          expiryWarningDays: ProductionEnv.expiryWarningDays,
          aiServiceUrl: ProductionEnv.aiServiceUrl,
          enableAiFeatures: ProductionEnv.enableAiFeatures,
          paymentGatewayUrl: ProductionEnv.paymentGatewayUrl,
          enablePaymentFeatures: ProductionEnv.enablePaymentFeatures,
          enableSocialFeatures: ProductionEnv.enableSocialFeatures,
          verboseLogging: ProductionEnv.verboseLogging,
          logApiRequests: ProductionEnv.logApiRequests,
          logDatabaseQueries: ProductionEnv.logDatabaseQueries,
        );
    }
  }

  /// Get full API URL with version
  String get apiUrl => '$apiBaseUrl/${DevelopmentEnv.apiVersion}';

  /// Check if any future phase features are enabled
  bool get hasFutureFeatures =>
      enableAiFeatures || enablePaymentFeatures || enableSocialFeatures;

  @override
  String toString() {
    return 'AppConfig('
        'environment: ${environment.name}, '
        'apiBaseUrl: $apiBaseUrl, '
        'isDebug: $isDebug'
        ')';
  }
}
