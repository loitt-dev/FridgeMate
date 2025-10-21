import 'package:dartz/dartz.dart';
import '../entities/common/failure.dart';
import '../entities/recipe/recipe_exports.dart';

abstract class RecipeRepository {
  Future<Either<CommonFailure, List<Recipe>>> getSuggestedRecipes({
    List<String>? availableIngredients,
    String? categoryId,
    int? limit,
  });

  Future<Either<CommonFailure, List<Recipe>>> getRecipesByIngredients(
    List<String> ingredientIds,
  );

  Future<Either<CommonFailure, List<Recipe>>> searchRecipes(String query);

  Future<Either<CommonFailure, Recipe>> getRecipeById(String id);

  Future<Either<CommonFailure, Recipe>> saveRecipe(Recipe recipe);

  Future<Either<CommonFailure, void>> deleteRecipe(String id);

  // Removed category, tag, and nutrition methods - not needed for Phase 1
}
