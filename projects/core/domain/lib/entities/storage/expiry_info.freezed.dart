// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expiry_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ExpiryInfo _$ExpiryInfoFromJson(Map<String, dynamic> json) {
  return _ExpiryInfo.fromJson(json);
}

/// @nodoc
mixin _$ExpiryInfo {
  DateTime get expiryDate => throw _privateConstructorUsedError;
  int get daysUntilExpiry => throw _privateConstructorUsedError;
  ExpiryStatus get status => throw _privateConstructorUsedError;
  String? get warningMessage => throw _privateConstructorUsedError;

  /// Serializes this ExpiryInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpiryInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpiryInfoCopyWith<ExpiryInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpiryInfoCopyWith<$Res> {
  factory $ExpiryInfoCopyWith(
    ExpiryInfo value,
    $Res Function(ExpiryInfo) then,
  ) = _$ExpiryInfoCopyWithImpl<$Res, ExpiryInfo>;
  @useResult
  $Res call({
    DateTime expiryDate,
    int daysUntilExpiry,
    ExpiryStatus status,
    String? warningMessage,
  });
}

/// @nodoc
class _$ExpiryInfoCopyWithImpl<$Res, $Val extends ExpiryInfo>
    implements $ExpiryInfoCopyWith<$Res> {
  _$ExpiryInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpiryInfo
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
abstract class _$$ExpiryInfoImplCopyWith<$Res>
    implements $ExpiryInfoCopyWith<$Res> {
  factory _$$ExpiryInfoImplCopyWith(
    _$ExpiryInfoImpl value,
    $Res Function(_$ExpiryInfoImpl) then,
  ) = __$$ExpiryInfoImplCopyWithImpl<$Res>;
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
class __$$ExpiryInfoImplCopyWithImpl<$Res>
    extends _$ExpiryInfoCopyWithImpl<$Res, _$ExpiryInfoImpl>
    implements _$$ExpiryInfoImplCopyWith<$Res> {
  __$$ExpiryInfoImplCopyWithImpl(
    _$ExpiryInfoImpl _value,
    $Res Function(_$ExpiryInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExpiryInfo
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
      _$ExpiryInfoImpl(
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
class _$ExpiryInfoImpl implements _ExpiryInfo {
  const _$ExpiryInfoImpl({
    required this.expiryDate,
    required this.daysUntilExpiry,
    required this.status,
    this.warningMessage,
  });

  factory _$ExpiryInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpiryInfoImplFromJson(json);

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
    return 'ExpiryInfo(expiryDate: $expiryDate, daysUntilExpiry: $daysUntilExpiry, status: $status, warningMessage: $warningMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpiryInfoImpl &&
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

  /// Create a copy of ExpiryInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpiryInfoImplCopyWith<_$ExpiryInfoImpl> get copyWith =>
      __$$ExpiryInfoImplCopyWithImpl<_$ExpiryInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpiryInfoImplToJson(this);
  }
}

abstract class _ExpiryInfo implements ExpiryInfo {
  const factory _ExpiryInfo({
    required final DateTime expiryDate,
    required final int daysUntilExpiry,
    required final ExpiryStatus status,
    final String? warningMessage,
  }) = _$ExpiryInfoImpl;

  factory _ExpiryInfo.fromJson(Map<String, dynamic> json) =
      _$ExpiryInfoImpl.fromJson;

  @override
  DateTime get expiryDate;
  @override
  int get daysUntilExpiry;
  @override
  ExpiryStatus get status;
  @override
  String? get warningMessage;

  /// Create a copy of ExpiryInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpiryInfoImplCopyWith<_$ExpiryInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
