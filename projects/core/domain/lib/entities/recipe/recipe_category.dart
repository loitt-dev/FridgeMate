import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_category.freezed.dart';
part 'recipe_category.g.dart';

@freezed
class RecipeCategory with _$RecipeCategory {
  const factory RecipeCategory({
    required String id,
    required String name,
    required String icon,
    String? description,
    String? color,
    int? sortOrder,
  }) = _RecipeCategory;

  factory RecipeCategory.fromJson(Map<String, dynamic> json) => _$RecipeCategoryFromJson(json);
}
