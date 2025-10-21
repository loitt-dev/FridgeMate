import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/entities/storage/storage.dart';

part 'storage_stats_model.freezed.dart';
part 'storage_stats_model.g.dart';

@freezed
class StorageStatsModel with _$StorageStatsModel {
  const factory StorageStatsModel({
    required int totalItems,
    required int expiringSoon,
    required int expired,
    required int categories,
    required Map<String, int> itemsByCategory,
    required Map<String, int> itemsByLocation,
  }) = _StorageStatsModel;

  factory StorageStatsModel.fromJson(Map<String, dynamic> json) => _$StorageStatsModelFromJson(json);
  
  const StorageStatsModel._();
  
  StorageStats toEntity() => StorageStats(
    totalItems: totalItems,
    expiringSoon: expiringSoon,
    expired: expired,
    categories: categories,
    itemsByCategory: itemsByCategory,
    itemsByLocation: itemsByLocation,
  );
  
  factory StorageStatsModel.fromEntity(StorageStats entity) => StorageStatsModel(
    totalItems: entity.totalItems,
    expiringSoon: entity.expiringSoon,
    expired: entity.expired,
    categories: entity.categories,
    itemsByCategory: entity.itemsByCategory,
    itemsByLocation: entity.itemsByLocation,
  );
}
