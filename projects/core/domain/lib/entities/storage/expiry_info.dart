import 'package:freezed_annotation/freezed_annotation.dart';

part 'expiry_info.freezed.dart';
part 'expiry_info.g.dart';

@freezed
class ExpiryInfo with _$ExpiryInfo {
  const factory ExpiryInfo({
    required DateTime expiryDate,
    required int daysUntilExpiry,
    required ExpiryStatus status,
    String? warningMessage,
  }) = _ExpiryInfo;

  factory ExpiryInfo.fromJson(Map<String, dynamic> json) => _$ExpiryInfoFromJson(json);
}

enum ExpiryStatus {
  fresh,
  expiringSoon,
  expired,
  unknown,
}
