class AppRoutes {
  // Auth routes
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';

  // Main routes
  static const String home = '/';
  static const String dashboard = '/dashboard';
  static const String settings = '/settings';
  static const String profile = '/profile';

  // Fridge routes
  static const String fridgeHome = '/fridge';
  static const String fridgeItems = '/fridge/items';
  static const String fridgeItemDetail = '/fridge/items/:id';
  static const String fridgeAddItem = '/fridge/items/add';
  static const String fridgeEditItem = '/fridge/items/:id/edit';
  static const String fridgeCategories = '/fridge/categories';
  static const String fridgeLocations = '/fridge/locations';
  static const String fridgeStats = '/fridge/stats';

  // Recipe routes
  static const String recipes = '/recipes';
  static const String recipeDetail = '/recipes/:id';
  static const String recipeAdd = '/recipes/add';
  static const String recipeEdit = '/recipes/:id/edit';
  static const String recipeCategories = '/recipes/categories';
  static const String recipeSearch = '/recipes/search';

  // Shopping routes
  static const String shoppingLists = '/shopping';
  static const String shoppingListDetail = '/shopping/:id';
  static const String shoppingListAdd = '/shopping/add';
  static const String shoppingListEdit = '/shopping/:id/edit';
  static const String shoppingBudget = '/shopping/budget';
  static const String shoppingStores = '/shopping/stores';

  // Medicine routes
  static const String medicineHome = '/medicine';
  static const String medicineItems = '/medicine/items';
  static const String medicineItemDetail = '/medicine/items/:id';
  static const String medicineAddItem = '/medicine/items/add';
  static const String medicineEditItem = '/medicine/items/:id/edit';
  static const String medicineCategories = '/medicine/categories';
  static const String medicineStats = '/medicine/stats';

  // Social routes
  static const String social = '/social';
  static const String socialFeed = '/social/feed';
  static const String socialPost = '/social/posts/:id';
  static const String socialPostAdd = '/social/posts/add';
  static const String socialProfile = '/social/profile/:id';
  static const String socialChallenges = '/social/challenges';
  static const String socialAchievements = '/social/achievements';

  // AI routes
  static const String ai = '/ai';
  static const String aiCamera = '/ai/camera';
  static const String aiBarcode = '/ai/barcode';
  static const String aiChat = '/ai/chat';

  // Notification routes
  static const String notifications = '/notifications';
  static const String notificationDetail = '/notifications/:id';

  // Error routes
  static const String notFound = '/404';
  static const String error = '/error';

  // Helper methods
  static String fridgeItemDetailPath(String id) =>
      fridgeItemDetail.replaceAll(':id', id);
  static String fridgeEditItemPath(String id) =>
      fridgeEditItem.replaceAll(':id', id);
  static String recipeDetailPath(String id) =>
      recipeDetail.replaceAll(':id', id);
  static String recipeEditPath(String id) => recipeEdit.replaceAll(':id', id);
  static String shoppingListDetailPath(String id) =>
      shoppingListDetail.replaceAll(':id', id);
  static String shoppingListEditPath(String id) =>
      shoppingListEdit.replaceAll(':id', id);
  static String medicineItemDetailPath(String id) =>
      medicineItemDetail.replaceAll(':id', id);
  static String medicineEditItemPath(String id) =>
      medicineEditItem.replaceAll(':id', id);
  static String socialPostPath(String id) => socialPost.replaceAll(':id', id);
  static String socialProfilePath(String id) =>
      socialProfile.replaceAll(':id', id);
  static String notificationDetailPath(String id) =>
      notificationDetail.replaceAll(':id', id);
}
