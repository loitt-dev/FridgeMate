// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expiry_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpiryInfoModelImpl _$$ExpiryInfoModelImplFromJson(
  Map<String, dynamic> json,
) => _$ExpiryInfoModelImpl(
  expiryDate: DateTime.parse(json['expiryDate'] as String),
  daysUntilExpiry: (json['daysUntilExpiry'] as num).toInt(),
  status: $enumDecode(_$ExpiryStatusEnumMap, json['status']),
  warningMessage: json['warningMessage'] as String?,
);

Map<String, dynamic> _$$ExpiryInfoModelImplToJson(
  _$ExpiryInfoModelImpl instance,
) => <String, dynamic>{
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
