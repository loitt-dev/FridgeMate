import 'environment/environment.dart';

class AppConfig {
  final String apiBaseUrl;
  final String appName;
  final String appVersion;
  final bool isDebug;
  final Environment environment;
  
  const AppConfig({
    required this.apiBaseUrl,
    required this.appName,
    required this.appVersion,
    required this.isDebug,
    required this.environment,
  });
  
  factory AppConfig.fromEnvironment() {
    const environment = String.fromEnvironment('ENVIRONMENT', defaultValue: 'development');
    const isDebug = bool.fromEnvironment('DEBUG', defaultValue: true);
    
    return AppConfig(
      apiBaseUrl: _getApiBaseUrl(environment),
      appName: 'FridgeMate',
      appVersion: '1.0.0',
      isDebug: isDebug,
      environment: Environment.fromString(environment),
    );
  }
  
  static String _getApiBaseUrl(String environment) {
    switch (environment) {
      case 'production':
        return 'https://api.fridgemate.com';
      case 'staging':
        return 'https://staging-api.fridgemate.com';
      case 'development':
      default:
        return 'http://localhost:3000';
    }
  }
}
