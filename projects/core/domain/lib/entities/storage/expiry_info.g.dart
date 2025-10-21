// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expiry_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpiryInfoImpl _$$ExpiryInfoImplFromJson(Map<String, dynamic> json) =>
    _$ExpiryInfoImpl(
      expiryDate: DateTime.parse(json['expiryDate'] as String),
      daysUntilExpiry: (json['daysUntilExpiry'] as num).toInt(),
      status: $enumDecode(_$ExpiryStatusEnumMap, json['status']),
      warningMessage: json['warningMessage'] as String?,
    );

Map<String, dynamic> _$$ExpiryInfoImplToJson(_$ExpiryInfoImpl instance) =>
    <String, dynamic>{
      'expiryDate': instance.expiryDate.toIso8601String(),
      'daysUntilExpiry': instance.daysUntilExpiry,
      'status': _$ExpiryStatusEnumMap[instance.status]!,
      'warningMessage': instance.warningMessage,
    };

const _$ExpiryStatusEnumMap = {
  ExpiryStatus.fresh: 'fresh',
  ExpiryStatus.expiringSoon: 'expiringSoon',
  ExpiryStatus.expired: 'expired',
  ExpiryStatus.unknown: 'unknown',
};
