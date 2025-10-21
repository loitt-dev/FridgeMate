// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StorageCategoryModelImpl _$$StorageCategoryModelImplFromJson(
  Map<String, dynamic> json,
) => _$StorageCategoryModelImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  icon: json['icon'] as String,
  description: json['description'] as String?,
  color: json['color'] as String?,
  sortOrder: (json['sortOrder'] as num?)?.toInt(),
);

Map<String, dynamic> _$$StorageCategoryModelImplToJson(
  _$StorageCategoryModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'icon': instance.icon,
  'description': instance.description,
  'color': instance.color,
  'sortOrder': instance.sortOrder,
};
