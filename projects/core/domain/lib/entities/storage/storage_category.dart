import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_category.freezed.dart';
part 'storage_category.g.dart';

@freezed
class StorageCategory with _$StorageCategory {
  const factory StorageCategory({
    required String id,
    required String name,
    required String icon,
    String? description,
    String? color,
    int? sortOrder,
  }) = _StorageCategory;

  factory StorageCategory.fromJson(Map<String, dynamic> json) => _$StorageCategoryFromJson(json);
}
