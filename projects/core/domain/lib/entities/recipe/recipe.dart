import 'package:domain/entities/recipe/cooking_step.dart';
import 'package:domain/entities/recipe/ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String id,
    required String name,
    required String description,
    required List<Ingredient> ingredients,
    required List<CookingStep> steps,
    required int prepTime,
    required int cookTime,
    required int servings,
    required String categoryId,
    String? imageUrl,
    double? rating,
    int? reviewCount,
    String? authorId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}