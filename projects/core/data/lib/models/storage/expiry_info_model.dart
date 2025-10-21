import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/entities/storage/storage.dart';

part 'expiry_info_model.freezed.dart';
part 'expiry_info_model.g.dart';

@freezed
class ExpiryInfoModel with _$ExpiryInfoModel {
  const factory ExpiryInfoModel({
    required DateTime expiryDate,
    required int daysUntilExpiry,
    required ExpiryStatus status,
    String? warningMessage,
  }) = _ExpiryInfoModel;

  factory ExpiryInfoModel.fromJson(Map<String, dynamic> json) => _$ExpiryInfoModelFromJson(json);
  
  const ExpiryInfoModel._();
  
  ExpiryInfo toEntity() => ExpiryInfo(
    expiryDate: expiryDate,
    daysUntilExpiry: daysUntilExpiry,
    status: status,
    warningMessage: warningMessage,
  );
  
  factory ExpiryInfoModel.fromEntity(ExpiryInfo entity) => ExpiryInfoModel(
    expiryDate: entity.expiryDate,
    daysUntilExpiry: entity.daysUntilExpiry,
    status: entity.status,
    warningMessage: entity.warningMessage,
  );
}
