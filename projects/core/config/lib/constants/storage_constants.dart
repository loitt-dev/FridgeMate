class StorageConstants {
  // SharedPreferences keys
  static const String authTokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userIdKey = 'user_id';
  static const String languageKey = 'language';
  static const String themeKey = 'theme';
  static const String notificationsEnabledKey = 'notifications_enabled';
  static const String expiryWarningDaysKey = 'expiry_warning_days';
  static const String autoSyncEnabledKey = 'auto_sync_enabled';
  static const String lastSyncTimeKey = 'last_sync_time';
  static const String onboardingCompletedKey = 'onboarding_completed';
  
  // Database table names
  static const String storageItemsTable = 'storage_items';
  static const String storageCategoriesTable = 'storage_categories';
  static const String storageLocationsTable = 'storage_locations';
  static const String recipesTable = 'recipes';
  static const String recipeCategoriesTable = 'recipe_categories';
  static const String shoppingListsTable = 'shopping_lists';
  static const String shoppingItemsTable = 'shopping_items';
  static const String usersTable = 'users';
  static const String userProfilesTable = 'user_profiles';
  static const String userPreferencesTable = 'user_preferences';
  
  // File paths
  static const String imagesPath = 'images';
  static const String cachePath = 'cache';
  static const String tempPath = 'temp';
  static const String logsPath = 'logs';
  
  // Cache keys
  static const String categoriesCacheKey = 'categories_cache';
  static const String recipesCacheKey = 'recipes_cache';
  static const String userProfileCacheKey = 'user_profile_cache';
  static const String settingsCacheKey = 'settings_cache';
}
