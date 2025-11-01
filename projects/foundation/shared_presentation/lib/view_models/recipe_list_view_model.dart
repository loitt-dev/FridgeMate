import '../base/base_view_model.dart';
import '../base/base_state.dart';
import '../mixins/loading_state_mixin.dart';
import '../mixins/error_handling_mixin.dart';
import '../mixins/pagination_mixin.dart';

/// Recipe list ViewModel với recipe-specific functionality
///
/// Cung cấp:
/// - Recipe list management
/// - Recipe filtering by ingredients
/// - Recipe search
/// - Favorite recipes
/// - Recipe categories
class RecipeListViewModel extends BaseViewModel<ListState<dynamic>>
    with
        LoadingStateMixin<ListState<dynamic>>,
        ErrorHandlingMixin<ListState<dynamic>>,
        PaginationMixin<ListState<dynamic>> {
  RecipeListViewModel() : super(const ListState.initial());

  /// Available ingredients for filtering
  List<String> _availableIngredients = [];

  /// Selected ingredients for filtering
  final List<String> _selectedIngredients = [];

  /// Recipe categories
  List<String> _categories = [];

  /// Selected category
  String? _selectedCategory;

  /// Search query
  String _searchQuery = '';

  /// Cooking time filter
  Duration? _maxCookingTime;

  /// Difficulty filter
  String? _difficulty;

  /// Get available ingredients
  List<String> get availableIngredients =>
      List.unmodifiable(_availableIngredients);

  /// Get selected ingredients
  List<String> get selectedIngredients =>
      List.unmodifiable(_selectedIngredients);

  /// Get categories
  List<String> get categories => List.unmodifiable(_categories);

  /// Get selected category
  String? get selectedCategory => _selectedCategory;

  /// Get search query
  String get searchQuery => _searchQuery;

  /// Get max cooking time
  Duration? get maxCookingTime => _maxCookingTime;

  /// Get difficulty
  String? get difficulty => _difficulty;

  /// Load recipes
  Future<void> loadRecipes(
    Future<List<dynamic>> Function() loadFunction,
  ) async {
    await executeWithLoadingAndError(
      () async {
        state = const ListState.loading();
        final recipes = await loadFunction();
        state = ListState.success(recipes, hasMore: recipes.length >= 20);
      },
      onError: (error) {
        state = ListState.error(_getErrorMessage(error));
      },
    );
  }

  /// Load recipes by ingredients
  Future<void> loadRecipesByIngredients(
    List<String> ingredients,
    Future<List<dynamic>> Function(List<String> ingredients) loadFunction,
  ) async {
    await executeWithLoadingAndError(
      () async {
        state = const ListState.loading();
        final recipes = await loadFunction(ingredients);
        state = ListState.success(recipes, hasMore: recipes.length >= 20);
      },
      onError: (error) {
        state = ListState.error(_getErrorMessage(error));
      },
    );
  }

  /// Search recipes
  Future<void> searchRecipes(
    String query,
    Future<List<dynamic>> Function(String query) searchFunction,
  ) async {
    _searchQuery = query;

    await executeWithLoadingAndError(
      () async {
        state = const ListState.loading();
        final recipes = await searchFunction(query);
        state = ListState.success(recipes, hasMore: recipes.length >= 20);
      },
      onError: (error) {
        state = ListState.error(_getErrorMessage(error));
      },
    );
  }

  /// Filter recipes
  Future<void> filterRecipes(
    Future<List<dynamic>> Function({
      List<String>? ingredients,
      String? category,
      Duration? maxCookingTime,
      String? difficulty,
    })
    filterFunction,
  ) async {
    await executeWithLoadingAndError(
      () async {
        state = const ListState.loading();
        final recipes = await filterFunction(
          ingredients: _selectedIngredients.isNotEmpty
              ? _selectedIngredients
              : null,
          category: _selectedCategory,
          maxCookingTime: _maxCookingTime,
          difficulty: _difficulty,
        );
        state = ListState.success(recipes, hasMore: recipes.length >= 20);
      },
      onError: (error) {
        state = ListState.error(_getErrorMessage(error));
      },
    );
  }

  /// Load more recipes
  Future<void> loadMoreRecipes(
    Future<List<dynamic>> Function(int page, int pageSize) loadFunction,
  ) async {
    if (state is ListLoadingMoreState || !hasMore) return;

    await executeWithLoadingAndError(
      () async {
        final currentRecipes = _getCurrentRecipes();
        state = ListState.loadingMore(currentRecipes);

        final nextPage = currentPage + 1;
        final newRecipes = await loadFunction(nextPage, pageSize);

        if (newRecipes.isEmpty) {
          state = ListState.success(currentRecipes, hasMore: false);
        } else {
          final allRecipes = [...currentRecipes, ...newRecipes];
          state = ListState.success(
            allRecipes,
            hasMore: newRecipes.length >= pageSize,
          );
        }
      },
      onError: (error) {
        state = ListState.error(_getErrorMessage(error));
      },
    );
  }

  /// Refresh recipes
  Future<void> refreshRecipes(
    Future<List<dynamic>> Function() loadFunction,
  ) async {
    await executeWithLoadingAndError(
      () async {
        final currentRecipes = _getCurrentRecipes();
        state = ListState.refreshing(currentRecipes);

        final recipes = await loadFunction();
        state = ListState.success(recipes, hasMore: recipes.length >= 20);
      },
      onError: (error) {
        state = ListState.error(_getErrorMessage(error));
      },
    );
  }

  /// Set available ingredients
  void setAvailableIngredients(List<String> ingredients) {
    _availableIngredients = List.from(ingredients);
  }

  /// Add ingredient to filter
  void addIngredientFilter(String ingredient) {
    if (!_selectedIngredients.contains(ingredient)) {
      _selectedIngredients.add(ingredient);
    }
  }

  /// Remove ingredient from filter
  void removeIngredientFilter(String ingredient) {
    _selectedIngredients.remove(ingredient);
  }

  /// Clear ingredient filters
  void clearIngredientFilters() {
    _selectedIngredients.clear();
  }

  /// Set categories
  void setCategories(List<String> categories) {
    _categories = List.from(categories);
  }

  /// Set selected category
  void setSelectedCategory(String? category) {
    _selectedCategory = category;
  }

  /// Set max cooking time
  void setMaxCookingTime(Duration? time) {
    _maxCookingTime = time;
  }

  /// Set difficulty
  void setDifficulty(String? difficulty) {
    _difficulty = difficulty;
  }

  /// Clear all filters
  void clearAllFilters() {
    _selectedIngredients.clear();
    _selectedCategory = null;
    _maxCookingTime = null;
    _difficulty = null;
    _searchQuery = '';
  }

  /// Get current recipes from state
  List<dynamic> _getCurrentRecipes() {
    return state.when(
      initial: () => [],
      loading: () => [],
      loadingMore: (recipes) => recipes,
      success: (recipes, hasMore) => recipes,
      error: (message, error) => [],
      refreshing: (recipes) => recipes,
    );
  }

  /// Get error message
  String _getErrorMessage(Object error) {
    if (error is Exception) {
      return error.toString();
    }
    return 'Đã xảy ra lỗi không xác định.';
  }

  // Override mixin methods
  @override
  void setLoading() {
    if (state is! ListLoadingState) {
      state = const ListState.loading();
    }
  }

  @override
  void clearLoading() {
    // Loading is handled by state transitions
  }

  @override
  void setError(String message, [Object? error]) {
    state = ListState.error(message, error);
  }

  @override
  void clearError() {
    // Error is cleared when new operation starts
  }
}

/// Recipe detail ViewModel
class RecipeDetailViewModel extends BaseViewModel<DetailState<dynamic>>
    with
        LoadingStateMixin<DetailState<dynamic>>,
        ErrorHandlingMixin<DetailState<dynamic>> {
  RecipeDetailViewModel() : super(const DetailState.initial());

  /// Load recipe detail
  Future<void> loadRecipeDetail(
    String recipeId,
    Future<dynamic> Function(String id) loadFunction,
  ) async {
    await executeWithLoadingAndError(
      () async {
        state = const DetailState.loading();
        final recipe = await loadFunction(recipeId);
        state = DetailState.success(recipe);
      },
      onError: (error) {
        state = DetailState.error(_getErrorMessage(error));
      },
    );
  }

  /// Toggle favorite
  Future<void> toggleFavorite(
    String recipeId,
    bool isFavorite,
    Future<bool> Function(String id, bool favorite) toggleFunction,
  ) async {
    await executeWithLoadingAndError(
      () async {
        await toggleFunction(recipeId, isFavorite);
        // Update recipe in state if needed
        final currentRecipe = _getCurrentRecipe();
        if (currentRecipe != null) {
          // Update recipe favorite status
          state = DetailState.success(currentRecipe);
        }
      },
      onError: (error) {
        state = DetailState.error(_getErrorMessage(error));
      },
    );
  }

  /// Share recipe
  Future<void> shareRecipe(
    String recipeId,
    Future<void> Function(String id) shareFunction,
  ) async {
    await executeWithLoadingAndError(
      () async {
        await shareFunction(recipeId);
      },
      onError: (error) {
        // Handle share error
      },
    );
  }

  /// Get current recipe from state
  dynamic _getCurrentRecipe() {
    return state.when(
      initial: () => null,
      loading: () => null,
      success: (recipe) => recipe,
      error: (message, error) => null,
      notFound: () => null,
    );
  }

  /// Get error message
  String _getErrorMessage(Object error) {
    if (error is Exception) {
      return error.toString();
    }
    return 'Đã xảy ra lỗi không xác định.';
  }

  // Override mixin methods
  @override
  void setLoading() {
    if (state is! DetailLoadingState) {
      state = const DetailState.loading();
    }
  }

  @override
  void clearLoading() {
    // Loading is handled by state transitions
  }

  @override
  void setError(String message, [Object? error]) {
    state = DetailState.error(message, error);
  }

  @override
  void clearError() {
    // Error is cleared when new operation starts
  }
}
