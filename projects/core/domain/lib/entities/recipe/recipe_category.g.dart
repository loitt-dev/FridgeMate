// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeCategoryImpl _$$RecipeCategoryImplFromJson(Map<String, dynamic> json) =>
    _$RecipeCategoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
      description: json['description'] as String?,
      color: json['color'] as String?,
      sortOrder: (json['sortOrder'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RecipeCategoryImplToJson(
  _$RecipeCategoryImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'icon': instance.icon,
  'description': instance.description,
  'color': instance.color,
  'sortOrder': instance.sortOrder,
};
