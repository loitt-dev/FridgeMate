import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_stats.freezed.dart';
part 'storage_stats.g.dart';

@freezed
class StorageStats with _$StorageStats {
  const factory StorageStats({
    required int totalItems,
    required int expiringSoon,
    required int expired,
    required int categories,
    required Map<String, int> itemsByCategory,
    required Map<String, int> itemsByLocation,
  }) = _StorageStats;

  factory StorageStats.fromJson(Map<String, dynamic> json) => _$StorageStatsFromJson(json);
}
