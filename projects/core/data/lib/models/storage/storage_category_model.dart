import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/entities/storage/storage.dart';

part 'storage_category_model.freezed.dart';
part 'storage_category_model.g.dart';

@freezed
class StorageCategoryModel with _$StorageCategoryModel {
  const factory StorageCategoryModel({
    required String id,
    required String name,
    required String icon,
    String? description,
    String? color,
    int? sortOrder,
  }) = _StorageCategoryModel;

  factory StorageCategoryModel.fromJson(Map<String, dynamic> json) => _$StorageCategoryModelFromJson(json);
  
  const StorageCategoryModel._();
  
  StorageCategory toEntity() => StorageCategory(
    id: id,
    name: name,
    icon: icon,
    description: description,
    color: color,
    sortOrder: sortOrder,
  );
  
  factory StorageCategoryModel.fromEntity(StorageCategory entity) => StorageCategoryModel(
    id: entity.id,
    name: entity.name,
    icon: entity.icon,
    description: entity.description,
    color: entity.color,
    sortOrder: entity.sortOrder,
  );
}
