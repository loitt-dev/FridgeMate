import 'package:local_storage/database/app_database.dart';

class RecipeLocalDataSource {
  final AppDatabase _database;

  RecipeLocalDataSource(this._database);

  // For Phase 1, all methods return empty data
  Future<List<Map<String, dynamic>>> getRecipes() async {
    return [];
  }

  Future<Map<String, dynamic>?> getRecipeById(String id) async {
    return null;
  }

  Future<Map<String, dynamic>> addRecipe(Map<String, dynamic> recipe) async {
    return recipe;
  }

  Future<Map<String, dynamic>> updateRecipe(Map<String, dynamic> recipe) async {
    return recipe;
  }

  Future<void> deleteRecipe(String id) async {
    // Do nothing for Phase 1
  }

  Future<List<Map<String, dynamic>>> searchRecipes(String query) async {
    return [];
  }

  Future<void> saveRecipes(List<Map<String, dynamic>> recipes) async {
    // Do nothing for Phase 1
  }
}
