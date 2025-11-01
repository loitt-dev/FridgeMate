/// App-wide constants for FridgeMate
class AppConstants {
  AppConstants._();

  // ============================================
  // App Information
  // ============================================

  static const String appName = 'FridgeMate';
  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';
  static const String appDescription = 'Smart Fridge & Medicine Management';

  // ============================================
  // Storage & Database
  // ============================================

  static const String databaseName = 'fridge_mate.db';
  static const int databaseVersion = 1;
  static const String sharedPreferencesName = 'fridge_mate_prefs';

  // ============================================
  // API & Network
  // ============================================

  static const String baseUrl = 'https://api.fridgemate.com';
  static const String apiVersion = 'v1';
  static const Duration requestTimeout = Duration(seconds: 30);
  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // ============================================
  // Pagination
  // ============================================

  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  static const int minPageSize = 5;

  // ============================================
  // File & Media
  // ============================================

  static const int maxImageSize = 5 * 1024 * 1024; // 5MB
  static const int maxVideoSize = 50 * 1024 * 1024; // 50MB
  static const List<String> allowedImageTypes = [
    'jpg',
    'jpeg',
    'png',
    'gif',
    'webp',
  ];
  static const List<String> allowedVideoTypes = ['mp4', 'mov', 'avi', 'mkv'];
  static const List<String> allowedDocumentTypes = [
    'pdf',
    'doc',
    'docx',
    'txt',
  ];

  // ============================================
  // Validation Limits
  // ============================================

  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 128;
  static const int minUsernameLength = 3;
  static const int maxUsernameLength = 30;
  static const int minNameLength = 2;
  static const int maxNameLength = 100;
  static const int maxDescriptionLength = 1000;
  static const int maxCommentLength = 500;
  static const int maxTitleLength = 200;

  // ============================================
  // Food & Medicine
  // ============================================

  static const int maxStorageItems = 1000;
  static const int maxRecipes = 500;
  static const int maxShoppingLists = 100;
  static const int maxIngredientsPerRecipe = 50;
  static const int maxStepsPerRecipe = 20;
  static const int maxCategories = 50;

  // ============================================
  // Expiry & Notifications
  // ============================================

  static const int defaultExpiryWarningDays = 3;
  static const int maxExpiryWarningDays = 30;
  static const int minExpiryWarningDays = 1;
  static const Duration notificationCheckInterval = Duration(hours: 1);

  // ============================================
  // UI & UX
  // ============================================

  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration shortAnimationDuration = Duration(milliseconds: 150);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);
  static const double defaultBorderRadius = 8.0;
  static const double defaultPadding = 16.0;
  static const double defaultMargin = 16.0;
  static const double defaultElevation = 2.0;

  // ============================================
  // Search & Filter
  // ============================================

  static const int minSearchLength = 2;
  static const int maxSearchLength = 100;
  static const Duration searchDebounceDelay = Duration(milliseconds: 500);
  static const int maxSearchHistory = 20;
  static const int maxRecentItems = 10;

  // ============================================
  // Social & Community
  // ============================================

  static const int maxPostsPerPage = 20;
  static const int maxCommentsPerPost = 100;
  static const int maxFollowers = 10000;
  static const int maxFollowing = 5000;
  static const int maxLikesPerPost = 100000;

  // ============================================
  // AI & Recognition
  // ============================================

  static const int maxImageRecognitionSize = 10 * 1024 * 1024; // 10MB
  static const Duration aiProcessingTimeout = Duration(seconds: 60);
  static const int maxBarcodeLength = 20;
  static const int minBarcodeLength = 8;

  // ============================================
  // E-commerce
  // ============================================

  static const int maxCartItems = 100;
  static const int maxOrderItems = 50;
  static const double minOrderAmount = 10000; // 10,000 VND
  static const double maxOrderAmount = 10000000; // 10,000,000 VND
  static const int maxDeliveryDays = 7;

  // ============================================
  // Cache & Performance
  // ============================================

  static const Duration cacheExpiration = Duration(days: 7);
  static const Duration imageCacheExpiration = Duration(days: 30);
  static const int maxCacheSize = 100 * 1024 * 1024; // 100MB
  static const int maxImageCacheSize = 50 * 1024 * 1024; // 50MB

  // ============================================
  // Security
  // ============================================

  static const int maxLoginAttempts = 5;
  static const Duration lockoutDuration = Duration(minutes: 15);
  static const Duration sessionTimeout = Duration(hours: 24);
  static const int maxConcurrentSessions = 3;

  // ============================================
  // Analytics & Tracking
  // ============================================

  static const Duration analyticsBatchInterval = Duration(minutes: 5);
  static const int maxAnalyticsEventsPerBatch = 100;
  static const Duration userSessionTimeout = Duration(minutes: 30);

  // ============================================
  // Development & Debug
  // ============================================

  static const bool enableLogging = true;
  static const bool enableCrashReporting = true;
  static const bool enableAnalytics = true;
  static const bool enablePerformanceMonitoring = true;

  // ============================================
  // Feature Flags
  // ============================================

  static const bool enableOfflineMode = true;
  static const bool enableSync = true;
  static const bool enableSocialFeatures = false; // Phase 4
  static const bool enableAIFeatures = false; // Phase 3
  static const bool enableEcommerceFeatures = false; // Phase 5

  // ============================================
  // Localization
  // ============================================

  static const String defaultLanguage = 'vi';
  static const String fallbackLanguage = 'en';
  static const List<String> supportedLanguages = ['vi', 'en'];

  // ============================================
  // Environment
  // ============================================

  static const String developmentEnvironment = 'development';
  static const String stagingEnvironment = 'staging';
  static const String productionEnvironment = 'production';

  // ============================================
  // Error Messages
  // ============================================

  static const String networkErrorMessage =
      'Không có kết nối mạng. Vui lòng kiểm tra lại.';
  static const String serverErrorMessage = 'Lỗi máy chủ. Vui lòng thử lại sau.';
  static const String unknownErrorMessage = 'Đã xảy ra lỗi không xác định.';
  static const String timeoutErrorMessage =
      'Yêu cầu hết thời gian chờ. Vui lòng thử lại.';
  static const String validationErrorMessage = 'Dữ liệu không hợp lệ.';
  static const String authenticationErrorMessage =
      'Phiên đăng nhập đã hết hạn.';
  static const String authorizationErrorMessage =
      'Bạn không có quyền thực hiện hành động này.';

  // ============================================
  // Success Messages
  // ============================================

  static const String saveSuccessMessage = 'Lưu thành công.';
  static const String deleteSuccessMessage = 'Xóa thành công.';
  static const String updateSuccessMessage = 'Cập nhật thành công.';
  static const String createSuccessMessage = 'Tạo thành công.';
  static const String uploadSuccessMessage = 'Tải lên thành công.';
  static const String syncSuccessMessage = 'Đồng bộ thành công.';

  // ============================================
  // Default Values
  // ============================================

  static const String defaultAvatar = 'assets/images/default_avatar.png';
  static const String defaultFoodImage = 'assets/images/default_food.png';
  static const String defaultMedicineImage =
      'assets/images/default_medicine.png';
  static const String defaultRecipeImage = 'assets/images/default_recipe.png';
  static const String defaultCategoryImage =
      'assets/images/default_category.png';

  // ============================================
  // Units & Measurements
  // ============================================

  static const List<String> weightUnits = ['g', 'kg', 'lb', 'oz'];
  static const List<String> volumeUnits = ['ml', 'l', 'cup', 'tbsp', 'tsp'];
  static const List<String> temperatureUnits = ['°C', '°F', 'K'];
  static const List<String> timeUnits = [
    'phút',
    'giờ',
    'ngày',
    'tuần',
    'tháng',
  ];

  // ============================================
  // Categories
  // ============================================

  static const List<String> foodCategories = [
    'Thịt',
    'Cá',
    'Rau củ',
    'Trái cây',
    'Sữa',
    'Bánh kẹo',
    'Đồ uống',
    'Gia vị',
    'Đồ khô',
    'Đồ đông lạnh',
  ];

  static const List<String> medicineCategories = [
    'Thuốc cảm',
    'Thuốc đau đầu',
    'Thuốc tiêu hóa',
    'Vitamin',
    'Thuốc bổ',
    'Thuốc kháng sinh',
    'Thuốc mỡ',
    'Dụng cụ y tế',
  ];

  static const List<String> recipeCategories = [
    'Món chính',
    'Món phụ',
    'Canh',
    'Salad',
    'Tráng miệng',
    'Đồ uống',
    'Bánh',
    'Món nhanh',
  ];
}
