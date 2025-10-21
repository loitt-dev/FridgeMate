import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_tag.freezed.dart';
part 'recipe_tag.g.dart';

@freezed
class RecipeTag with _$RecipeTag {
  const factory RecipeTag({
    required String id,
    required String name,
    required String color,
    String? description,
  }) = _RecipeTag;

  factory RecipeTag.fromJson(Map<String, dynamic> json) => _$RecipeTagFromJson(json);
}
