// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StorageCategoryImpl _$$StorageCategoryImplFromJson(
  Map<String, dynamic> json,
) => _$StorageCategoryImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  icon: json['icon'] as String,
  description: json['description'] as String?,
  color: json['color'] as String?,
  sortOrder: (json['sortOrder'] as num?)?.toInt(),
);

Map<String, dynamic> _$$StorageCategoryImplToJson(
  _$StorageCategoryImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'icon': instance.icon,
  'description': instance.description,
  'color': instance.color,
  'sortOrder': instance.sortOrder,
};
