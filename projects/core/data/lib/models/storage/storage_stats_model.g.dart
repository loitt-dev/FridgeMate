// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StorageStatsModelImpl _$$StorageStatsModelImplFromJson(
  Map<String, dynamic> json,
) => _$StorageStatsModelImpl(
  totalItems: (json['totalItems'] as num).toInt(),
  expiringSoon: (json['expiringSoon'] as num).toInt(),
  expired: (json['expired'] as num).toInt(),
  categories: (json['categories'] as num).toInt(),
  itemsByCategory: Map<String, int>.from(json['itemsByCategory'] as Map),
  itemsByLocation: Map<String, int>.from(json['itemsByLocation'] as Map),
);

Map<String, dynamic> _$$StorageStatsModelImplToJson(
  _$StorageStatsModelImpl instance,
) => <String, dynamic>{
  'totalItems': instance.totalItems,
  'expiringSoon': instance.expiringSoon,
  'expired': instance.expired,
  'categories': instance.categories,
  'itemsByCategory': instance.itemsByCategory,
  'itemsByLocation': instance.itemsByLocation,
};
