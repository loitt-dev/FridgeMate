class AppConstants {
  // App info
  static const String appName = 'FridgeMate';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Smart Fridge & Medicine Management';
  
  // Database
  static const String databaseName = 'fridgemate.db';
  static const int databaseVersion = 1;
  
  // Cache
  static const Duration cacheExpiration = Duration(hours: 24);
  static const int maxCacheSize = 100 * 1024 * 1024; // 100MB
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  
  // Validation
  static const int minPasswordLength = 8;
  static const int maxNameLength = 100;
  static const int maxDescriptionLength = 500;
  
  // Notifications
  static const int defaultExpiryWarningDays = 3;
  static const int maxNotificationRetries = 3;
  
  // File upload
  static const int maxImageSize = 5 * 1024 * 1024; // 5MB
  static const List<String> allowedImageTypes = ['jpg', 'jpeg', 'png', 'webp'];
  
  // Social
  static const int maxPostLength = 1000;
  static const int maxCommentLength = 500;
  static const int maxFollowers = 10000;
}
