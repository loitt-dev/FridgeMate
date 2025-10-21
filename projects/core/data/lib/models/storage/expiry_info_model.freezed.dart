// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expiry_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ExpiryInfoModel _$ExpiryInfoModelFromJson(Map<String, dynamic> json) {
  return _ExpiryInfoModel.fromJson(json);
}

/// @nodoc
mixin _$ExpiryInfoModel {
  DateTime get expiryDate => throw _privateConstructorUsedError;
  int get daysUntilExpiry => throw _privateConstructorUsedError;
  ExpiryStatus get status => throw _privateConstructorUsedError;
  String? get warningMessage => throw _privateConstructorUsedError;

  /// Serializes this ExpiryInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpiryInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpiryInfoModelCopyWith<ExpiryInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpiryInfoModelCopyWith<$Res> {
  factory $ExpiryInfoModelCopyWith(
    ExpiryInfoModel value,
    $Res Function(ExpiryInfoModel) then,
  ) = _$ExpiryInfoModelCopyWithImpl<$Res, ExpiryInfoModel>;
  @useResult
  $Res call({
    DateTime expiryDate,
    int daysUntilExpiry,
    ExpiryStatus status,
    String? warningMessage,
  });
}

/// @nodoc
class _$ExpiryInfoModelCopyWithImpl<$Res, $Val extends ExpiryInfoModel>
    implements $ExpiryInfoModelCopyWith<$Res> {
  _$ExpiryInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpiryInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expiryDate = null,
    Object? daysUntilExpiry = null,
    Object? status = null,
    Object? warningMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            expiryDate: null == expiryDate
                ? _value.expiryDate
                : expiryDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            daysUntilExpiry: null == daysUntilExpiry
                ? _value.daysUntilExpiry
                : daysUntilExpiry // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as ExpiryStatus,
            warningMessage: freezed == warningMessage
                ? _value.warningMessage
                : warningMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExpiryInfoModelImplCopyWith<$Res>
    implements $ExpiryInfoModelCopyWith<$Res> {
  factory _$$ExpiryInfoModelImplCopyWith(
    _$ExpiryInfoModelImpl value,
    $Res Function(_$ExpiryInfoModelImpl) then,
  ) = __$$ExpiryInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime expiryDate,
    int daysUntilExpiry,
    ExpiryStatus status,
    String? warningMessage,
  });
}

/// @nodoc
class __$$ExpiryInfoModelImplCopyWithImpl<$Res>
    extends _$ExpiryInfoModelCopyWithImpl<$Res, _$ExpiryInfoModelImpl>
    implements _$$ExpiryInfoModelImplCopyWith<$Res> {
  __$$ExpiryInfoModelImplCopyWithImpl(
    _$ExpiryInfoModelImpl _value,
    $Res Function(_$ExpiryInfoModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExpiryInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expiryDate = null,
    Object? daysUntilExpiry = null,
    Object? status = null,
    Object? warningMessage = freezed,
  }) {
    return _then(
      _$ExpiryInfoModelImpl(
        expiryDate: null == expiryDate
            ? _value.expiryDate
            : expiryDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        daysUntilExpiry: null == daysUntilExpiry
            ? _value.daysUntilExpiry
            : daysUntilExpiry // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ExpiryStatus,
        warningMessage: freezed == warningMessage
            ? _value.warningMessage
            : warningMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpiryInfoModelImpl extends _ExpiryInfoModel {
  const _$ExpiryInfoModelImpl({
    required this.expiryDate,
    required this.daysUntilExpiry,
    required this.status,
    this.warningMessage,
  }) : super._();

  factory _$ExpiryInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpiryInfoModelImplFromJson(json);

  @override
  final DateTime expiryDate;
  @override
  final int daysUntilExpiry;
  @override
  final ExpiryStatus status;
  @override
  final String? warningMessage;

  @override
  String toString() {
    return 'ExpiryInfoModel(expiryDate: $expiryDate, daysUntilExpiry: $daysUntilExpiry, status: $status, warningMessage: $warningMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpiryInfoModelImpl &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.daysUntilExpiry, daysUntilExpiry) ||
                other.daysUntilExpiry == daysUntilExpiry) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.warningMessage, warningMessage) ||
                other.warningMessage == warningMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    expiryDate,
    daysUntilExpiry,
    status,
    warningMessage,
  );

  /// Create a copy of ExpiryInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpiryInfoModelImplCopyWith<_$ExpiryInfoModelImpl> get copyWith =>
      __$$ExpiryInfoModelImplCopyWithImpl<_$ExpiryInfoModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpiryInfoModelImplToJson(this);
  }
}

abstract class _ExpiryInfoModel extends ExpiryInfoModel {
  const factory _ExpiryInfoModel({
    required final DateTime expiryDate,
    required final int daysUntilExpiry,
    required final ExpiryStatus status,
    final String? warningMessage,
  }) = _$ExpiryInfoModelImpl;
  const _ExpiryInfoModel._() : super._();

  factory _ExpiryInfoModel.fromJson(Map<String, dynamic> json) =
      _$ExpiryInfoModelImpl.fromJson;

  @override
  DateTime get expiryDate;
  @override
  int get daysUntilExpiry;
  @override
  ExpiryStatus get status;
  @override
  String? get warningMessage;

  /// Create a copy of ExpiryInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpiryInfoModelImplCopyWith<_$ExpiryInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
