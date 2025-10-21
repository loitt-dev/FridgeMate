// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StorageCategory _$StorageCategoryFromJson(Map<String, dynamic> json) {
  return _StorageCategory.fromJson(json);
}

/// @nodoc
mixin _$StorageCategory {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  int? get sortOrder => throw _privateConstructorUsedError;

  /// Serializes this StorageCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StorageCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StorageCategoryCopyWith<StorageCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageCategoryCopyWith<$Res> {
  factory $StorageCategoryCopyWith(
    StorageCategory value,
    $Res Function(StorageCategory) then,
  ) = _$StorageCategoryCopyWithImpl<$Res, StorageCategory>;
  @useResult
  $Res call({
    String id,
    String name,
    String icon,
    String? description,
    String? color,
    int? sortOrder,
  });
}

/// @nodoc
class _$StorageCategoryCopyWithImpl<$Res, $Val extends StorageCategory>
    implements $StorageCategoryCopyWith<$Res> {
  _$StorageCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StorageCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? description = freezed,
    Object? color = freezed,
    Object? sortOrder = freezed,
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
            icon: null == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            color: freezed == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as String?,
            sortOrder: freezed == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StorageCategoryImplCopyWith<$Res>
    implements $StorageCategoryCopyWith<$Res> {
  factory _$$StorageCategoryImplCopyWith(
    _$StorageCategoryImpl value,
    $Res Function(_$StorageCategoryImpl) then,
  ) = __$$StorageCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String icon,
    String? description,
    String? color,
    int? sortOrder,
  });
}

/// @nodoc
class __$$StorageCategoryImplCopyWithImpl<$Res>
    extends _$StorageCategoryCopyWithImpl<$Res, _$StorageCategoryImpl>
    implements _$$StorageCategoryImplCopyWith<$Res> {
  __$$StorageCategoryImplCopyWithImpl(
    _$StorageCategoryImpl _value,
    $Res Function(_$StorageCategoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StorageCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? description = freezed,
    Object? color = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(
      _$StorageCategoryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        icon: null == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        color: freezed == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as String?,
        sortOrder: freezed == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StorageCategoryImpl implements _StorageCategory {
  const _$StorageCategoryImpl({
    required this.id,
    required this.name,
    required this.icon,
    this.description,
    this.color,
    this.sortOrder,
  });

  factory _$StorageCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$StorageCategoryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String icon;
  @override
  final String? description;
  @override
  final String? color;
  @override
  final int? sortOrder;

  @override
  String toString() {
    return 'StorageCategory(id: $id, name: $name, icon: $icon, description: $description, color: $color, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorageCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, icon, description, color, sortOrder);

  /// Create a copy of StorageCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StorageCategoryImplCopyWith<_$StorageCategoryImpl> get copyWith =>
      __$$StorageCategoryImplCopyWithImpl<_$StorageCategoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StorageCategoryImplToJson(this);
  }
}

abstract class _StorageCategory implements StorageCategory {
  const factory _StorageCategory({
    required final String id,
    required final String name,
    required final String icon,
    final String? description,
    final String? color,
    final int? sortOrder,
  }) = _$StorageCategoryImpl;

  factory _StorageCategory.fromJson(Map<String, dynamic> json) =
      _$StorageCategoryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get icon;
  @override
  String? get description;
  @override
  String? get color;
  @override
  int? get sortOrder;

  /// Create a copy of StorageCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StorageCategoryImplCopyWith<_$StorageCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
