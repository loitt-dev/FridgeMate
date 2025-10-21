import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_item.freezed.dart';
part 'storage_item.g.dart';

@freezed
class StorageItem with _$StorageItem {
  const factory StorageItem({
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
  }) = _StorageItem;

  factory StorageItem.fromJson(Map<String, dynamic> json) => _$StorageItemFromJson(json);
}
