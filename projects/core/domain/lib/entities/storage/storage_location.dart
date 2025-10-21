import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_location.freezed.dart';
part 'storage_location.g.dart';

@freezed
class StorageLocation with _$StorageLocation {
  const factory StorageLocation({
    required String id,
    required String name,
    required String type, // 'shelf', 'drawer', 'door', etc.
    String? description,
    int? capacity,
    int? currentItems,
  }) = _StorageLocation;

  factory StorageLocation.fromJson(Map<String, dynamic> json) => _$StorageLocationFromJson(json);
}
