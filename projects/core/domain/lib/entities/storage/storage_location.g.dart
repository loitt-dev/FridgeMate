// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StorageLocationImpl _$$StorageLocationImplFromJson(
  Map<String, dynamic> json,
) => _$StorageLocationImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  type: json['type'] as String,
  description: json['description'] as String?,
  capacity: (json['capacity'] as num?)?.toInt(),
  currentItems: (json['currentItems'] as num?)?.toInt(),
);

Map<String, dynamic> _$$StorageLocationImplToJson(
  _$StorageLocationImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'description': instance.description,
  'capacity': instance.capacity,
  'currentItems': instance.currentItems,
};
