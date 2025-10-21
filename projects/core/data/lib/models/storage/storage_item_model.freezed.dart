// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StorageItemModel _$StorageItemModelFromJson(Map<String, dynamic> json) {
  return _StorageItemModel.fromJson(json);
}

/// @nodoc
mixin _$StorageItemModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  DateTime get expiryDate => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this StorageItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StorageItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StorageItemModelCopyWith<StorageItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageItemModelCopyWith<$Res> {
  factory $StorageItemModelCopyWith(
    StorageItemModel value,
    $Res Function(StorageItemModel) then,
  ) = _$StorageItemModelCopyWithImpl<$Res, StorageItemModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String categoryId,
    DateTime expiryDate,
    int quantity,
    String unit,
    String? location,
    String? notes,
    String? imageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$StorageItemModelCopyWithImpl<$Res, $Val extends StorageItemModel>
    implements $StorageItemModelCopyWith<$Res> {
  _$StorageItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StorageItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryId = null,
    Object? expiryDate = null,
    Object? quantity = null,
    Object? unit = null,
    Object? location = freezed,
    Object? notes = freezed,
    Object? imageUrl = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            categoryId: null == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as String,
            expiryDate: null == expiryDate
                ? _value.expiryDate
                : expiryDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            unit: null == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as String,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StorageItemModelImplCopyWith<$Res>
    implements $StorageItemModelCopyWith<$Res> {
  factory _$$StorageItemModelImplCopyWith(
    _$StorageItemModelImpl value,
    $Res Function(_$StorageItemModelImpl) then,
  ) = __$$StorageItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String categoryId,
    DateTime expiryDate,
    int quantity,
    String unit,
    String? location,
    String? notes,
    String? imageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$StorageItemModelImplCopyWithImpl<$Res>
    extends _$StorageItemModelCopyWithImpl<$Res, _$StorageItemModelImpl>
    implements _$$StorageItemModelImplCopyWith<$Res> {
  __$$StorageItemModelImplCopyWithImpl(
    _$StorageItemModelImpl _value,
    $Res Function(_$StorageItemModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StorageItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryId = null,
    Object? expiryDate = null,
    Object? quantity = null,
    Object? unit = null,
    Object? location = freezed,
    Object? notes = freezed,
    Object? imageUrl = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$StorageItemModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryId: null == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
        expiryDate: null == expiryDate
            ? _value.expiryDate
            : expiryDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        unit: null == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as String,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StorageItemModelImpl extends _StorageItemModel {
  const _$StorageItemModelImpl({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.expiryDate,
    required this.quantity,
    required this.unit,
    this.location,
    this.notes,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  }) : super._();

  factory _$StorageItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StorageItemModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String categoryId;
  @override
  final DateTime expiryDate;
  @override
  final int quantity;
  @override
  final String unit;
  @override
  final String? location;
  @override
  final String? notes;
  @override
  final String? imageUrl;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'StorageItemModel(id: $id, name: $name, categoryId: $categoryId, expiryDate: $expiryDate, quantity: $quantity, unit: $unit, location: $location, notes: $notes, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorageItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    categoryId,
    expiryDate,
    quantity,
    unit,
    location,
    notes,
    imageUrl,
    createdAt,
    updatedAt,
  );

  /// Create a copy of StorageItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StorageItemModelImplCopyWith<_$StorageItemModelImpl> get copyWith =>
      __$$StorageItemModelImplCopyWithImpl<_$StorageItemModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StorageItemModelImplToJson(this);
  }
}

abstract class _StorageItemModel extends StorageItemModel {
  const factory _StorageItemModel({
    required final String id,
    required final String name,
    required final String categoryId,
    required final DateTime expiryDate,
    required final int quantity,
    required final String unit,
    final String? location,
    final String? notes,
    final String? imageUrl,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$StorageItemModelImpl;
  const _StorageItemModel._() : super._();

  factory _StorageItemModel.fromJson(Map<String, dynamic> json) =
      _$StorageItemModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get categoryId;
  @override
  DateTime get expiryDate;
  @override
  int get quantity;
  @override
  String get unit;
  @override
  String? get location;
  @override
  String? get notes;
  @override
  String? get imageUrl;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of StorageItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StorageItemModelImplCopyWith<_$StorageItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
