class ApiEndpoints {
  // Storage endpoints
  static const String storageItems = '/api/storage/items';
  static const String storageCategories = '/api/storage/categories';
  static const String storageLocations = '/api/storage/locations';
  
  // Recipe endpoints
  static const String recipes = '/api/recipes';
  static const String recipeCategories = '/api/recipes/categories';
  static const String recipeTags = '/api/recipes/tags';
  
  // Shopping endpoints
  static const String shoppingLists = '/api/shopping/lists';
  static const String shoppingItems = '/api/shopping/items';
  static const String budgets = '/api/shopping/budgets';
  
  // User endpoints
  static const String users = '/api/users';
  static const String userProfiles = '/api/users/profiles';
  static const String userPreferences = '/api/users/preferences';
  
  // Auth endpoints
  static const String login = '/api/auth/login';
  static const String register = '/api/auth/register';
  static const String logout = '/api/auth/logout';
  static const String refreshToken = '/api/auth/refresh';
  
  // Social endpoints
  static const String posts = '/api/social/posts';
  static const String comments = '/api/social/comments';
  static const String challenges = '/api/social/challenges';
  static const String achievements = '/api/social/achievements';
  
  // AI endpoints
  static const String imageRecognition = '/api/ai/recognize';
  static const String barcodeScan = '/api/ai/barcode';
  static const String chatAssistant = '/api/ai/chat';
  
  // Notification endpoints
  static const String notifications = '/api/notifications';
  static const String expiryNotifications = '/api/notifications/expiry';
  static const String socialNotifications = '/api/notifications/social';
  
  // Price comparison endpoints
  static const String priceComparison = '/api/prices/compare';
  static const String stores = '/api/stores';
  
  // Payment endpoints
  static const String paymentIntents = '/api/payments/intents';
  static const String paymentMethods = '/api/payments/methods';
}
