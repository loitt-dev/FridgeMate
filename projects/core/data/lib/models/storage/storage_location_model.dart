import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/entities/storage/storage.dart';

part 'storage_location_model.freezed.dart';
part 'storage_location_model.g.dart';

@freezed
class StorageLocationModel with _$StorageLocationModel {
  const factory StorageLocationModel({
    required String id,
    required String name,
    required String type,
    String? description,
    int? capacity,
    int? currentItems,
  }) = _StorageLocationModel;

  factory StorageLocationModel.fromJson(Map<String, dynamic> json) => _$StorageLocationModelFromJson(json);
  
  const StorageLocationModel._();
  
  StorageLocation toEntity() => StorageLocation(
    id: id,
    name: name,
    type: type,
    description: description,
    capacity: capacity,
    currentItems: currentItems,
  );
  
  factory StorageLocationModel.fromEntity(StorageLocation entity) => StorageLocationModel(
    id: entity.id,
    name: entity.name,
    type: entity.type,
    description: entity.description,
    capacity: entity.capacity,
    currentItems: entity.currentItems,
  );
}
