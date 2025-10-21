// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeTagImpl _$$RecipeTagImplFromJson(Map<String, dynamic> json) =>
    _$RecipeTagImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      color: json['color'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$RecipeTagImplToJson(_$RecipeTagImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'description': instance.description,
    };
