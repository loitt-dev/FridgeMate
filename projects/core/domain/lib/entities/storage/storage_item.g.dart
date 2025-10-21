// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StorageItemImpl _$$StorageItemImplFromJson(Map<String, dynamic> json) =>
    _$StorageItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      categoryId: json['categoryId'] as String,
      expiryDate: DateTime.parse(json['expiryDate'] as String),
      quantity: (json['quantity'] as num).toInt(),
      unit: json['unit'] as String,
      location: json['location'] as String?,
      notes: json['notes'] as String?,
      imageUrl: json['imageUrl'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$StorageItemImplToJson(_$StorageItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'categoryId': instance.categoryId,
      'expiryDate': instance.expiryDate.toIso8601String(),
      'quantity': instance.quantity,
      'unit': instance.unit,
      'location': instance.location,
      'notes': instance.notes,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
