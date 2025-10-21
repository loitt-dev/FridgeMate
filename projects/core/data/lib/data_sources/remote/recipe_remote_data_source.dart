import 'package:dio/dio.dart';

class RecipeRemoteDataSource {
  final Dio _dio;

  RecipeRemoteDataSource(this._dio);

  // For Phase 1, all methods return empty data
  Future<List<Map<String, dynamic>>> getRecipes() async {
    return [];
  }

  Future<Map<String, dynamic>> addRecipe(Map<String, dynamic> recipe) async {
    return recipe;
  }

  Future<Map<String, dynamic>> updateRecipe(Map<String, dynamic> recipe) async {
    return recipe;
  }

  Future<void> deleteRecipe(String recipeId) async {
    // Do nothing for Phase 1
  }
}
