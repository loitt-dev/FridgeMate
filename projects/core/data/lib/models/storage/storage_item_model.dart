import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/entities/storage/storage.dart';

part 'storage_item_model.freezed.dart';
part 'storage_item_model.g.dart';

@freezed
class StorageItemModel with _$StorageItemModel {
  const factory StorageItemModel({
    required String id,
    required String name,
    required String categoryId,
    required DateTime expiryDate,
    required int quantity,
    required String unit,
    String? location,
    String? notes,
    String? imageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _StorageItemModel;

  factory StorageItemModel.fromJson(Map<String, dynamic> json) => _$StorageItemModelFromJson(json);
  
  const StorageItemModel._();
  
  StorageItem toEntity() => StorageItem(
    id: id,
    name: name,
    categoryId: categoryId,
    expiryDate: expiryDate,
    quantity: quantity,
    unit: unit,
    location: location,
    notes: notes,
    imageUrl: imageUrl,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
  
  factory StorageItemModel.fromEntity(StorageItem entity) => StorageItemModel(
    id: entity.id,
    name: entity.name,
    categoryId: entity.categoryId,
    expiryDate: entity.expiryDate,
    quantity: entity.quantity,
    unit: entity.unit,
    location: entity.location,
    notes: entity.notes,
    imageUrl: entity.imageUrl,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
  );
}
